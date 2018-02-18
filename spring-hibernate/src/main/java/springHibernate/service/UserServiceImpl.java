package springHibernate.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springHibernate.dao.UserDao;
import springHibernate.entity.User;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	
	@Override
	public User getDataByUserName(String username) {
		
		return userDao.getUser(username);
	
	}

	@Override
	public void save(User newUser) {

		userDao.save(newUser);
		
	}

	@Override
	public void delete(String username) {
		
		userDao.delete(username);
		
	}
	
}