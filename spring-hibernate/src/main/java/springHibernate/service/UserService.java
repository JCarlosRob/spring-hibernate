package springHibernate.service;

import springHibernate.entity.User;

public interface UserService {

	User getDataByUserName(String username);
	
	void save(User newUser);

	void delete(String username);
	
}
