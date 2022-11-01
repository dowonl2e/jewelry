package com.jewelry.config;

import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class SiteMeshConfig extends ConfigurableSiteMeshFilter {
	
	@Bean 
	public FilterRegistrationBean<SiteMeshConfig> siteMeshFilter() {//빈등록 
		FilterRegistrationBean<SiteMeshConfig> filter = new FilterRegistrationBean<SiteMeshConfig>(); 
		filter.setFilter(new SiteMeshConfig()); 
		return filter; 
	}
	
	@Override
	protected void applyCustomConfiguration(SiteMeshFilterBuilder builder) {
		builder 
		// Map decorators to path patterns.		
		.addDecoratorPath("/*", "/WEB-INF/decorators/admin_default_panel.jsp")
		//.addDecoratorPath("**/popup/*", "/WEB-INF/decorators/popup.jsp")
		// Exclude path from decoration.
		.addExcludedPath("**/signin")
		.addExcludedPath("**/download/*")
		.addExcludedPath("**/ajax/*")
		.addExcludedPath("**/api/*")
		.addExcludedPath("**/*.html")
		.setMimeTypes("text/html");		
	}
	
}
