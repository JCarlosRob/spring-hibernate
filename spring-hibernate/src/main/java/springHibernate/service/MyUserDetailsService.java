package springHibernate.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import springHibernate.entity.UserInfo;

@Service
public class MyUserDetailsService implements UserDetailsService{
	
	@Autowired
	private UserInfoService userInfoService;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		UserInfo userInfo = userInfoService.setUserInfo(username);
		
		List<GrantedAuthority> authorities = new ArrayList<>();
		for(String role: userInfo.getRole()) {
		
			authorities.add(new SimpleGrantedAuthority(role));
		
		}
		
		UserDetails userDetails = new User(userInfo.getUsername(), userInfo.getPassword(),
											authorities);
		
		return userDetails;
	
	}

}
