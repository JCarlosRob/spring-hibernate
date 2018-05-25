package springHibernate.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springHibernate.dao.BookDao;
import springHibernate.entity.Author;
import springHibernate.entity.Book;
import springHibernate.entity.Genre;
import springHibernate.entity.User;

@Service
public class BooksServiceImpl implements BookService{

	@Autowired
	private BookDao bookDao;
	
	@Override
	public List<Book> getAllBooks() {

		return bookDao.getAllBooks();
	
	}

	@Override
	public List<Book> getLastAdded(int quantity) {

		return bookDao.getLastAdded(quantity);
	
	}

	@Override
	public Book getBook(int id) {
		
		return bookDao.getBook(id);
		
	}
	
	@Override
	public List<Book> getBooks(String title) {
		
		return bookDao.getBooks(title);
		
	}

	@Override
	public List<Book> getBooks(int isbn) {

		return bookDao.getBooks(isbn);
	
	}

	@Override
	public List<Book> getBooks(Author author) {

		return bookDao.getBooks(author);
	
	}

	@Override
	public List<Book> getBooks(Genre genre) {

		return bookDao.getBooks(genre);
	
	}

	@Override
	public List<Book> getBooks(User uploadadBy) {

		return bookDao.getBooks(uploadadBy);
	
	}

	@Override
	public void save(Book book) {
		
		bookDao.save(book);
		
	}

	@Override
	public void delete(Book book) {

		bookDao.delete(book);
		
	}

}
