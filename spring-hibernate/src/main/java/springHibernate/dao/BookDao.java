package springHibernate.dao;

import java.util.List;

import springHibernate.entity.Author;
import springHibernate.entity.Book;
import springHibernate.entity.Genre;
import springHibernate.entity.User;

public interface BookDao {

	List<Book> getAllBooks();
	
	List<Book> getLastAdded(int quantity);
	
	Book getBook(int id);
	
	List<Book> getBooks(String title);
	
	List<Book> getBooks(int isbn);
	
	List<Book> getBooks(Author author);
	
	List<Book> getBooks(Genre genre);
	
	List<Book> getBooks(User uploadadBy);
	
	void save(Book book);
	
	void delete(Book book);
	
}
