package co.edu.usco.pw.springboot_crud01.security;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;

@Configuration
public class WebSecurityConfig extends WebSecurityConfigurerAdapter{
	
	@Autowired
	private DataSource dataSource;
	
	@Autowired
	private BCryptPasswordEncoder passEncoder;
	
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests().antMatchers("/","/css/**","/js/**","/images/**").permitAll()
		.antMatchers("/list-todos").hasAnyRole("USER")
		.antMatchers("/list-todos").hasAnyRole("ADMIN")
		.antMatchers("/cancel").hasAnyRole("USER")
		.antMatchers("/cancel").hasAnyRole("ADMIN")
		.antMatchers("/add-todo").permitAll()
		.antMatchers("/delete-todo/**").hasAnyRole("ADMIN")
		.antMatchers("/update-todo/**").hasAnyRole("ADMIN")
		.anyRequest().authenticated().and().formLogin().permitAll()
		.and().logout().permitAll();
	}
	
	
	
//	@Override
//	protected void configure(HttpSecurity http) throws Exception {
//		http.authorizeRequests().antMatchers("/","/css/**","/js/**","/images/**").permitAll()
//		.antMatchers("/list-todos").hasAnyRole("USER")
//		.antMatchers("/list-todos").hasAnyRole("ADMIN")
//		.antMatchers("/cancel").hasAnyRole("USER")
//		.antMatchers("/cancel").hasAnyRole("ADMIN")
//		.antMatchers("/add-todo").hasAnyRole("ADMIN")
//		.antMatchers("/delete-todo/**").hasAnyRole("ADMIN")
//		.antMatchers("/update-todo/**").hasAnyRole("ADMIN")
//		.anyRequest().authenticated().and().formLogin().permitAll()
//		.and().logout().permitAll();
//	}

	@Autowired
	public void configurerSecurityGlobal(AuthenticationManagerBuilder builder) throws Exception{
	builder.jdbcAuthentication().dataSource(dataSource).passwordEncoder(passEncoder)
	.usersByUsernameQuery("select username, password, enabled from users where username=?")
	.authoritiesByUsernameQuery("select u.username, r.rol from roles r inner join users u on r.user_id=u.id where u.username =?");
	}
}