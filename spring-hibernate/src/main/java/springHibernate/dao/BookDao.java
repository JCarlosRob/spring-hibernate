package springHibernate.dao;

import java.util.List;

import springHibernate.entity.Book;

public interface BookDao {

	List<Book> getAllBooks();
	
}
