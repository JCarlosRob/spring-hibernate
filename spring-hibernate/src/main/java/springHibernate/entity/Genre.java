package springHibernate.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Entity
@Table(name="genre")
public class Genre {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="genre")
	private String genre;
	
	@ManyToMany(
			cascade= {CascadeType.DETACH, CascadeType.MERGE,
					CascadeType.PERSIST, CascadeType.REFRESH})
	@JoinTable(
			name="genre_books",
			joinColumns=@JoinColumn(name="id_genre"),
			inverseJoinColumns=@JoinColumn(name="id_books"))
	private List<Book> books;

	public int getId() {
		
		return id;
	
	}

	public void setId(int id) {
	
		this.id = id;
	
	}

	public String getGenre() {
	
		return genre;
	
	}

	public void setGenre(String genre) {
	
		this.genre = genre;
	
	}
	
}
