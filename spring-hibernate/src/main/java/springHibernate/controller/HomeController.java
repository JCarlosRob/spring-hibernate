package springHibernate.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import springHibernate.entity.Book;
import springHibernate.service.BookService;

@Controller
public class HomeController {

	@Autowired
	private BookService bookService;
	
	@RequestMapping("/")
	public String showHome(Model model) {
		
		List<Book> books = bookService.getLastAdded(12);
		
		model.addAttribute("books", books);
		
		return "home/home";
		
	} 
	
}
