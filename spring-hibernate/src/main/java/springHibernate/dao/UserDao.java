package springHibernate.dao;

import springHibernate.entity.User;

public interface UserDao {

	User getUser(String username);
	
	void save(User newUser);
	
	void delete(String username);
	
}
