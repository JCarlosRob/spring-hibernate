package springHibernate.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="authorities")
public class Authoritie {

	@Id
	@Column(name="id")
	private int id;
	
	@ManyToOne(fetch=FetchType.EAGER,
			cascade= CascadeType.ALL)
	@JoinColumn(name="username")
	private User username;
	
	@Column(name="authority")
	private String authority;

	public Authoritie() {
		
		setAuthority("ROLE_USER");
		
	}
	
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

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}
	
}