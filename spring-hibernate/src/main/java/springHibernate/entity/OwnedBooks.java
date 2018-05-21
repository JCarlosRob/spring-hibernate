package springHibernate.entity;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="owned_books")
public class OwnedBooks {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="id_book")
	private Book book;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="username")
	private User user;
	
	@Column(name="state_reading")
	private String stateReading;
	
	@Column(name="date")
	private Date date;

	public int getId() {
	
		return id;
	
	}

	public void setId(int id) {
	
		this.id = id;
	
	}

	public Book getBook() {
	
		return book;
	
	}

	public void setBook(Book book) {
	
		this.book = book;
	
	}

	public User getUser() {
	
		return user;
	
	}

	public void setUser(User user) {
	
		this.user = user;
	
	}

	public String getStateReading() {
	
		return stateReading;
	
	}

	public void setStateReading(String stateReading) {
	
		this.stateReading = stateReading;
	
	}

	public Date getDate() {
	
		return date;
	
	}

	public void setDate(Date date) {
	
		this.date = date;
	
	}

}
