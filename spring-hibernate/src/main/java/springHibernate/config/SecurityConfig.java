package springHibernate.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import springHibernate.service.MyUserDetailsService;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(securedEnabled=true)
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	
	@Autowired
	private MyUserDetailsService myUserDetailsService;
	
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		
		auth.userDetailsService(myUserDetailsService)
			.passwordEncoder(passwordEncoder());
		
	}
	
	@Bean
	protected PasswordEncoder passwordEncoder() {
		
		return new BCryptPasswordEncoder();
		
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {

		http.authorizeRequests()
			.antMatchers("/home/**")
				.permitAll()
			.antMatchers("/login/**")
				.permitAll()
			.antMatchers("/error/**")
				.permitAll()
			.antMatchers("/user/**")
				.hasAnyRole("USER", "ADMIN")
			.antMatchers("/admin/**")
				.hasRole("ADMIN")
			.and()
			.formLogin()
				.loginPage("/login/login")
				.loginProcessingUrl("/appLogin")
				.usernameParameter("username")
				.passwordParameter("password")
				.defaultSuccessUrl("/")
				.permitAll()
			.and()
			.logout()
				.logoutUrl("/appLogout")
				.logoutSuccessUrl("/")
				.permitAll()
			.and()
			.exceptionHandling()
				.accessDeniedPage("/error/access-denied");
		
	}

}
