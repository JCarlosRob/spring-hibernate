package springHibernate.entity;

import java.sql.Date;
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
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="books")
public class Book {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="title")
	private String title;
/*	
	@ManyToMany(fetch = FetchType.EAGER,
			cascade = {CascadeType.DETACH, CascadeType.MERGE,
					CascadeType.PERSIST, CascadeType.REFRESH})
	@JoinTable(
			name="authors_books",
			joinColumns=@JoinColumn(name="id_book"),
			inverseJoinColumns=@JoinColumn(name="id_author"))
	private List<Author> authors;
*/	
	@Column(name="synopsis")
	private String synopsis;
	
	@Column(name="publishing_year")
	private int publishingYear;

	@ManyToMany(
			cascade = {CascadeType.DETACH, CascadeType.MERGE,
					CascadeType.PERSIST, CascadeType.REFRESH})
	@JoinTable(
			name="genre_books",
			joinColumns=@JoinColumn(name="id_book"),
			inverseJoinColumns=@JoinColumn(name="id_genre"))
	@Column(name="id_genre")
	private List<Genre> genre;
	
	@Column(name="publishing_country")
	private String publishingCountry;
	
	@Column(name="publisher")
	private String publisher;
	
	@Column(name="isbn")
	private long isnb;
	
	@Column(name="rating")
	private int rating;
	
	@Column(name="date_add")
	private Date dateAdd;

	@ManyToOne(cascade={CascadeType.DETACH, CascadeType.MERGE,
			CascadeType.PERSIST, CascadeType.REFRESH})
	@JoinColumn(name="uploaded_by")
	private User uploadedBy; 

	@Column(name="img")
	private String img;

	public int getId() {
		
		return id;
	
	}

	public void setId(int id) {
		
		this.id = id;
		
	}

	public String getTitle() {
		
		return title;
		
	}

	public void setTitle(String title) {
		
		this.title = title;
		
	}

	public List<Genre> getGenre() {
		return genre;
	}

	public void setGenre(List<Genre> genre) {
		this.genre = genre;
	}

	public String getSynopsis() {
		
		return synopsis;
		
	}

	public void setSynopsis(String synopsis) {
		
		this.synopsis = synopsis;
		
	}

	public int getPublishingYear() {
		
		return publishingYear;
		
	}

	public void setPublishingYear(int publishingYear) {
		
		this.publishingYear = publishingYear;
	
	}
/*
	public Genre getGenre() {
		
		return genre;
		
	}

	public void setGenre(Genre genre) {
		
		this.genre = genre;
	
	}
*/
	public String getPublishingCountry() {
		
		return publishingCountry;
	
	}

	public void setPublishingCountry(String publishingCountry) {
	
		this.publishingCountry = publishingCountry;
	
	}

	public String getPublisher() {
	
		return publisher;
	
	}

	public void setPublisher(String publisher) {
	
		this.publisher = publisher;
	
	}

	public long getIsnb() {
	
		return isnb;
	
	}

	public void setIsnb(long isnb) {
	
		this.isnb = isnb;
	
	}

	public Date getDateAdd() {
	
		return dateAdd;
	
	}

	public void setDateAdd(Date dateAdd) {
	
		this.dateAdd = dateAdd;
	
	}

	public String getImg() {
	
		return img;
	
	}

	public void setImg(String img) {
	
		this.img = img;
	
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public User getUploadedBy() {
		return uploadedBy;
	}

	public void setUploadedBy(User uploadedBy) {
		this.uploadedBy = uploadedBy;
	}
	
}
	