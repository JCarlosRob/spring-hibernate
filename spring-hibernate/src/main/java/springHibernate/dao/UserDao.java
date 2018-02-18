package springHibernate.dao;

import java.util.List;

import springHibernate.entity.User;

public interface UserDao {

	User getUser(String username);
	
	List<User> getAllUsers();
	
	void save(User newUser);
	
	void delete(String username);
	
}
