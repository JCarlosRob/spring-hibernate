package springHibernate.dao;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import springHibernate.entity.Author;
import springHibernate.entity.Book;
import springHibernate.entity.Genre;
import springHibernate.entity.User;

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

	@Override
	public Book getBook(int id) {
		
		Session session = sessionFactory.getCurrentSession();
		
		Book book = session.find(Book.class, id);
		
		return book;
		
	}
	
	@Override
	public List<Book> getBooks(String title) {
		
		Session session = sessionFactory.getCurrentSession();
		
		Query query = session.createQuery("from Book where title =:title", Book.class);
		query.setParameter("title", title);
		
		List<Book> books = query.getResultList();
		
		return books;
		
	}

	@Override
	public List<Book> getBooks(int isbn) {
		
		Session session = sessionFactory.getCurrentSession();
		
		Query query = session.createQuery("from Book where isbn =:isbn", Book.class);
		query.setParameter("isbn", isbn);
		
		List<Book> books = query.getResultList();
		
		return books;
		
	}

	@Override
	public List<Book> getBooks(Author author) {
		
		Session session = sessionFactory.getCurrentSession();
		
		Query query = session.createQuery("from Book where author =:author", Book.class);
		query.setParameter("author", author);
		
		List<Book> books = query.getResultList();
		
		return books;
		
	}

	@Override
	public List<Book> getBooks(Genre genre) {
		
		Session session = sessionFactory.getCurrentSession();
		
		Query query = session.createQuery("from Book where genre =:genre", Book.class);
		query.setParameter("genre", genre);
		
		List<Book> books = query.getResultList();
		
		return books;
		
	}

	@Override
	public List<Book> getBooks(User uploadadBy) {
		
		Session session = sessionFactory.getCurrentSession();
		
		Query query = session.createQuery("from Book where uploadadBy =:uploadadBy", Book.class);
		query.setParameter("uploadadBy", uploadadBy);
		
		List<Book> books = query.getResultList();
		
		return books;
		
	}

	@Override
	public void save(Book book) {
		
		Session session = sessionFactory.getCurrentSession();
		
		session.saveOrUpdate(book);
		
	}

	@Override
	public void delete(Book book) {

		Session session = sessionFactory.getCurrentSession();
		
		session.delete(book);
		
	}

}
