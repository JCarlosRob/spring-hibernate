package springHibernate.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import springHibernate.entity.User;
import springHibernate.service.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private UserService userService;
	
	@GetMapping("/showAllUsers")
	public String showUsers(Model model) {
		
		List<User> users = userService.getAllUsers();
		
		model.addAttribute("users", users);
		
		return "admin/show_users";
		
	}
	
}
