package springHibernate.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springHibernate.dao.BookDao;
import springHibernate.entity.Book;

@Service
public class BooksServiceImpl implements BookService{

	@Autowired
	private BookDao bookDao;
	
	@Override
	public List<Book> getAllBooks() {

		return bookDao.getAllBooks();
	
	}

}
