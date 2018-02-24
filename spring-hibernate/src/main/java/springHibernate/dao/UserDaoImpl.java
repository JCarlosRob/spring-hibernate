package springHibernate.dao;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import springHibernate.entity.Authoritie;
import springHibernate.entity.User;

@Repository
@Transactional
public class UserDaoImpl implements UserDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public User getUser(String username) {

		
				
		Session session = sessionFactory.getCurrentSession();
		
		User user = session.find(User.class, username);
		
		return user;
	
	}
	
	@Override
	public List<User> getAllUsers() {
		
		Session session = sessionFactory.getCurrentSession();

		Query query = session.createQuery("from User", User.class);
		
		List<User> users = query.getResultList();
		
		return users;
		
	}

	@Override
	public void create(User newUser) {

		Session session = sessionFactory.getCurrentSession();
		
		Authoritie authoritie = new Authoritie();
		//authoritie.setUsername(newUser);
		newUser.setEnabled(true);
		
		session.saveOrUpdate(newUser);
		
	}

	@Override
	public void save(User user) {
		
		Session session = sessionFactory.getCurrentSession();
		
		session.saveOrUpdate(user);
		
	}
	
	@Override
	public void delete(String username) {

		Session session = sessionFactory.getCurrentSession();
		User user = session.get(User.class, username);
		session.delete(user);
		
	}

}
