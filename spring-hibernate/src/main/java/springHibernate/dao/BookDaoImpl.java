package springHibernate.dao;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import springHibernate.entity.Book;

@Repository
@Transactional
public class BookDaoImpl implements BookDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Book> getAllBooks() {

		Session session = sessionFactory.getCurrentSession();
		
		Query query = session.createQuery("from Book", Book.class);
		
		List<Book> allBooks = query.getResultList();
		
		return allBooks;
	
	}

	@Override
	public List<Book> getLastAdded(int quantity) {

		Session session = sessionFactory.getCurrentSession();
		
		Query query = session.createQuery("from Book order by dateAdd desc", Book.class);
		query.setMaxResults(quantity);
		
		List<Book> lastAdded = query.getResultList();
		
		return lastAdded;
	
	}

}
