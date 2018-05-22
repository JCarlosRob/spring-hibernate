package springHibernate.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name="authors")
public class Author {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="author_name")
	private String authorName;
	
	@ManyToMany(cascade = {CascadeType.DETACH, CascadeType.MERGE,
			CascadeType.PERSIST, CascadeType.REFRESH})
	@JoinTable(
		name="authors_books",
		joinColumns=@JoinColumn(name="id_author"),
		inverseJoinColumns=@JoinColumn(name="id_book"))
	private List<Book> books;

	public int getId() {
		
		return id;
	
	}

	public void setId(int id) {
	
		this.id = id;
	
	}

	public String getAuthorName() {
	
		return authorName;
	
	}

	public void setAuthorName(String authorName) {
	
		this.authorName = authorName;
	
	}

	public List<Book> getBooks() {
		return books;
	}

	public void setBooks(List<Book> books) {
		this.books = books;
	}

}
