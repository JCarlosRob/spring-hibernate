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
@Table(name="wishlist")
public class Wishlist {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="username")
	private User username;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="id_book")
	private Book book;
	
	@Column(name="date")
	private Date date;

	public int getId() {
	
		return id;
	
	}

	public void setId(int id) {
	
		this.id = id;
	
	}

	public User getUsername() {
	
		return username;
	
	}

	public void setUsername(User username) {
	
		this.username = username;
	
	}

	public Book getBook() {
	
		return book;
	
	}

	public void setBook(Book book) {
	
		this.book = book;
	
	}

	public Date getDate() {
	
		return date;
	
	}

	public void setDate(Date date) {
	
		this.date = date;
	
	}
	
}
