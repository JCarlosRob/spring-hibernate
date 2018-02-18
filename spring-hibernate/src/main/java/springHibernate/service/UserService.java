package springHibernate.service;

import java.util.List;

import springHibernate.entity.User;

public interface UserService {

	User getDataByUserName(String username);

	List<User> getAllUsers();
	
	void create(User user);
	
	void save(User newUser);

	void delete(String username);
	
}
