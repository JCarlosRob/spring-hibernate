package springHibernate.dao;

import java.util.List;

import springHibernate.entity.User;

public interface UserDao {

	User getUser(String username);
	
	List<User> getAllUsers();
	
	void create(User newUser);
	
	void save(User user);
	
	void delete(String username);
	
}
