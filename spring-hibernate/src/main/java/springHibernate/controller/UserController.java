package springHibernate.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import springHibernate.service.UserInfoService;
import springHibernate.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserInfoService userInfoService;
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/info")
	public String home(Model model, Authentication authentication) {
		
		authentication.getPrincipal();
		model.addAttribute("user", userInfoService.setUserInfo(authentication.getName()));
		
		return "user/info";
		
	}
	
	@GetMapping("/delete") 
	public String delete(@RequestParam("userDelete") String username) {
		
		userService.delete(username);
		
		return "redirect:/";
		
	}

}
