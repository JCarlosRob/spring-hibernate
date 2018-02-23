package springHibernate.service;

import java.util.List;

import springHibernate.entity.Book;

public interface BookService {

	List<Book> getAllBooks();
	
}
