package com.jewelry.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

import com.jewelry.handler.CustomLogoutSuccessHandler;

@EnableWebSecurity        //spring security 를 적용한다는 Annotation
@Configuration
public class SecurityConfig {

//    AuthenticationManager authenticationManager;

	@Autowired
	private UserDetailsService userDetailsService;

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Bean
	public LogoutSuccessHandler logoutSuccessHandler() {
		return new CustomLogoutSuccessHandler();
	}
	
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		http
			.csrf().disable()
	        .authorizeRequests()
            .antMatchers(
        			"/signin", "/access-denied",
        			"/css/**", "/html/**", "/img/**", "/js/**", "/scss/**", "/vendor/**", "/plugin/**", "/erd/**",
        			"/**.js",  "/**.json"
			).permitAll() // 로그인 권한은 누구나, resources파일도 모든권한
            .antMatchers("/api/**").hasAnyRole("ADMIN","MANAGER")	// => /admin으로 시작하는 경로는 ADMIN,MANAGER권한만 가능
            .anyRequest().authenticated()
            .and()
            .formLogin()
            	.usernameParameter("user_id")
            	.passwordParameter("user_pwd")
                .loginPage("/signin")
                .loginProcessingUrl("/signin-proc")
                .defaultSuccessUrl("/main", true)
                .failureUrl("/signin?error=true") // 인증에 실패했을 때 보여주는 화면 url, 로그인 form으로 파라미터값 error=true로 보낸다.
            .and()
                .logout()
                .logoutUrl("/signout")
                .logoutSuccessHandler(logoutSuccessHandler())
                .deleteCookies("JSESSIONID")
            .and()
            .csrf().disable()
            .userDetailsService(userDetailsService)		//로그인 창
            .sessionManagement()
            	.sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED)
            	.maximumSessions(3)
            	.expiredUrl("/access-denied");
        return http.build();
	}
	
}
