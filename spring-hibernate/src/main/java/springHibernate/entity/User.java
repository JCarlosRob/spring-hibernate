package springHibernate.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Entity
@Table(name="users")
public class User {

	@Id
	@Column(name="username")
	private String username;
	
	@Column(name="password")
	private String password;
	
	@Column(name="email")
	private String email;
	
	@Column(name="enabled", columnDefinition="tinyint")
	private boolean enabled;
	
	@ManyToMany(fetch = FetchType.LAZY,
			cascade = CascadeType.ALL)
	@JoinTable(
			name="user_authorities",
			joinColumns=@JoinColumn(name="username"),
			inverseJoinColumns=@JoinColumn(name="id_auth"))
	private List<Authoritie> roles;
	
	public User() {
		
	}
	
	public String getUsername() {
		
		return username;
	
	}

	public void setUsername(String username) {
		
		this.username = username;
	
	}

	public String getPassword() {
		
		return password;
	
	}

	public String getEmail() {
		
		return email;
	
	}

	public void setEmail(String email) {
	
		this.email = email;
	
	}

	public void setPassword(String password) {
		
		BCryptPasswordEncoder bcrypt = new BCryptPasswordEncoder();
		
		this.password = bcrypt.encode(password);
	
	}

	public boolean getEnabled() {
		
		return enabled;
	
	}

	public void setEnabled(boolean enabled) {
		
		this.enabled = enabled;
	
	}

	public List<Authoritie> getRoles() {
		
		return roles;
	
	}

	public void setRoles(List<Authoritie> roles) {
		
		for(Authoritie role: roles) {
			
			if(getRoles().contains(role) == false) {
				
				addRole(role);
				
			}
			
		}
		
	}
	
	public void addRole(Authoritie role) {
		
		if (this.roles == null) {
			
			this.roles = new ArrayList<>();
			
		}
		
		this.roles.add(role);
		
	}
	
}
