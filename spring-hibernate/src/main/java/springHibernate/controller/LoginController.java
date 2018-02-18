package springHibernate.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import springHibernate.entity.User;
import springHibernate.service.UserService;

@Controller
@RequestMapping("/login")
public class LoginController {

	@Autowired
	private UserService userService;
	
	@GetMapping("/login")
	public String login() {
		
		return "login/login";
		
	}
	
	@GetMapping("/signup")
	public String signin(@ModelAttribute("newUser") User user) {
		
		return "login/signup";
		
	}
	
	@PostMapping("/save")
	public String save(@ModelAttribute("newUser") User user) {

		userService.save(user);
		
		return "redirect:/";
		
	}
	
}
