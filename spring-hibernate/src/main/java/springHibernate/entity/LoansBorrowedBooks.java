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
@Table(name="loans_borrowed_books")
public class LoansBorrowedBooks {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;

	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="username")
	private User user;

	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="id_owned_book")
	private Book idOwnedBook;
	
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

	public User getUsername() {
	
		return user;
	
	}

	public void setUsername(User user) {
	
		this.user = user;
	
	}

	public Book getIdOwnedBook() {
	
		return idOwnedBook;
	
	}

	public void setIdOwnedBook(Book idOwnedBook) {
	
		this.idOwnedBook = idOwnedBook;
	
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
