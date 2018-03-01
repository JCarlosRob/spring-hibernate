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


@Entity
@Table(name="authorities")
public class Authoritie {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@ManyToMany(fetch=FetchType.EAGER,
			cascade= CascadeType.ALL)
	@JoinTable(
			name="user_authorities",
			joinColumns=@JoinColumn(name="id_auth"),
			inverseJoinColumns=@JoinColumn(name="username"))
	private List<User> username;
	
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

	public List<User> getUsername() {
		return username;
	}

	public void setUsername(List<User> username) {
		this.username = username;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}
	
}