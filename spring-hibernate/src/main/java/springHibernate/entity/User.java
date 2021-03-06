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
import javax.persistence.OneToMany;
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
	
	@ManyToMany(fetch = FetchType.EAGER,
			cascade = CascadeType.ALL)
	@JoinTable(
			name="user_authorities",
			joinColumns=@JoinColumn(name="username"),
			inverseJoinColumns=@JoinColumn(name="id_auth"))
	private List<Authoritie> roles;

	@OneToMany(mappedBy="user",
				cascade=CascadeType.ALL)
	private List<OwnedBooks> ownedBooks;

	@OneToMany(mappedBy="user",
			    cascade=CascadeType.ALL)
	private List<LoansBorrowedBooks> loansBorrowedBooks;
	
	@OneToMany(mappedBy="uploadedBy",
			 	cascade={CascadeType.DETACH, CascadeType.MERGE,
			 			CascadeType.PERSIST, CascadeType.REFRESH})
	private List<Book> booksUploaded;

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

	public List<OwnedBooks> getOwnedBooks() {
		return ownedBooks;
	}

	public void setOwnedBooks(List<OwnedBooks> ownedBooks) {
		this.ownedBooks = ownedBooks;
	}

	public List<LoansBorrowedBooks> getLoansBorrowedBooks() {
		return loansBorrowedBooks;
	}

	public void setLoansBorrowedBooks(List<LoansBorrowedBooks> loansBorrowedBooks) {
		this.loansBorrowedBooks = loansBorrowedBooks;
	}

	public List<Book> getBooksUploaded() {
		return booksUploaded;
	}

	public void setBooksUploaded(List<Book> booksUploaded) {
		this.booksUploaded = booksUploaded;
	}

}
