package com.jewelry;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

@SpringBootApplication
@EnableAspectJAutoProxy(proxyTargetClass=true)
public class JewelryApplication extends SpringBootServletInitializer {

	public static void main(String[] args) {
		SpringApplication.run(JewelryApplication.class, args);
	}
	
	// 배포 시 동작하지 않는 경우 해당 주석을 풀고 다시 빌드
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(JewelryApplication.class);
    }
}
