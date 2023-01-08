package com.jewelry.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.jewelry.interceptor.CustomAuthInterceptor;
import com.jewelry.interceptor.SessionInterceptor;

@Configuration
public class WebConfig implements WebMvcConfigurer {

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		String[] excludePathPatterns = {"/css/**", 
				"/signin","/access-denied",
				"/error",
				"/html/**", 
				"/img/**", 
				"/js/**",
				"/scss/**", 
				"/fonts/**", 
				"/plugin/**", 
				"/vendor/**",
				"/erd/**",
				"/**.js",
				"/**.json",
				"/favicon**"
		};
		
		registry
			.addInterceptor(sessionInterceptor())
			.excludePathPatterns(excludePathPatterns);
		registry
			.addInterceptor(customAuthInterceptor())
			.excludePathPatterns(excludePathPatterns);
		
		WebMvcConfigurer.super.addInterceptors(registry);
	}
	
	/**
	 * 인터셉터의 의존성 주입을 위해 빈 등록
	 * @return
	 */
	@Bean
	public SessionInterceptor sessionInterceptor() {
		return new SessionInterceptor();
	}
	
	/**
	 * 인터셉터의 의존성 주입을 위해 빈 등록
	 * @return
	 */
	@Bean
	public CustomAuthInterceptor customAuthInterceptor() {
		return new CustomAuthInterceptor();
	}
	
	
//	@Bean
//	public CommonsMultipartResolver multipartResolver() {
//		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
//		multipartResolver.setDefaultEncoding("UTF-8");
//		multipartResolver.setMaxUploadSizePerFile(10 * 1024 * 1024); // 10MB
//		return multipartResolver;
//	}

}
