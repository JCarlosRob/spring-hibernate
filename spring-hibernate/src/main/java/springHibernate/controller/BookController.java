package springHibernate.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import springHibernate.entity.Book;
import springHibernate.service.BookService;

@Controller
@RequestMapping("/book")
public class BookController {

	@Autowired
	private BookService bookService;
	
	@GetMapping("/show")
	String showBook(Model model, @RequestParam("idBook") int idBook) {
		
		Book book = bookService.getBook(idBook);
		
		model.addAttribute("book",book);
		
		return "book/show";
		
	}
	
}
