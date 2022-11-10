package com.jewelry.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.jewelry.interceptor.SessionInterceptor;

@Configuration
public class WebConfig implements WebMvcConfigurer {

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry
			.addInterceptor(new SessionInterceptor())
			.excludePathPatterns(
					"/css/**", 
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
			);
		WebMvcConfigurer.super.addInterceptors(registry);
	}

//	@Bean
//	public CommonsMultipartResolver multipartResolver() {
//		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
//		multipartResolver.setDefaultEncoding("UTF-8");
//		multipartResolver.setMaxUploadSizePerFile(10 * 1024 * 1024); // 10MB
//		return multipartResolver;
//	}

}
