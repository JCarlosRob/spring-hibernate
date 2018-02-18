package springHibernate.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springHibernate.dao.UserDao;
import springHibernate.entity.User;
import springHibernate.entity.UserInfo;

@Service
public class UserInfoServiceImpl implements UserInfoService{

	@Autowired
	private UserDao userDao;
	
	@Override
	public UserInfo setUserInfo(String username) {
		
		User user = userDao.getUser(username);
		
		UserInfo userInfo = new UserInfo(user);
		
		return userInfo;
	
	}

}
