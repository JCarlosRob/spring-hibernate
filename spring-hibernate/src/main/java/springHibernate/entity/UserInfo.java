package springHibernate.entity;

import java.util.ArrayList;
import java.util.List;

public class UserInfo {

	private String username;
	
	private String password;
	
	private String email;
	
	private boolean enabled;
	
	private ArrayList<String> role;
	
	public UserInfo() {
		
	}
	
	public UserInfo(User user) {
		
		setUsername(user.getUsername());
		setPassword(user.getPassword());
		setEmail(user.getEmail());
		setEnabled(user.getEnabled());
		
		setRoles(user.getRoles());
		
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

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public ArrayList<String> getRole() {
		return role;
	}

	public void setRole(String role) {
		
		if (this.role == null) {
			
			this.role = new ArrayList<>();
			
		}
		
		this.role.add(role);
	}
	
	public void setRoles(List<Authoritie> authorities) {
		
		for(Authoritie role: authorities) {
			
			setRole(role.getAuthority());
			
		}
		
	}

}
