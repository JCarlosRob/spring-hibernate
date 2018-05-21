package springHibernate.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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

}
