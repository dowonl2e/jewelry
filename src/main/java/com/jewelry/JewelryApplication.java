package com.jewelry;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
//@EnableAspectJAutoProxy(proxyTargetClass=true) spring-boot-starter-aop 의존성이 있을 경우 SpringBoot에서는 기본은 true를 설정하고 있다
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
