package com.jewelry.aop;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.jewelry.cms.menu.domain.MenuTO;
import com.jewelry.cms.menu.domain.MenuVO;
import com.jewelry.cms.menu.service.MenuService;

@Aspect
@Component
public class AuthAspect {

	@Autowired
	private MenuService menuService;
	
	@After(
//		  "execution(* com.jewelry.*.*Controller.*(..)) && " + 
//		  "!execution(* com.ineast.manager..*.UserController.*(..))"
		"(" +
		"execution(* com.jewelry.*.*Controller.*(..)) || " + 
		"execution(* com.jewelry.cms.*.*Controller.*(..))" + 
		") && " + 
		"!execution(* com.jewelry.*.UserController.*(..)) && " +
		"!execution(* com.jewelry.*.*ApiController.*(..)) && " +
		"!execution(* com.jewelry.cms.*.*ApiController.*(..))"
	)
	public void afterAdvice(JoinPoint joinPoint) throws Exception {
		System.out.println("[****************************** 메뉴 조회 AOP ***********************************");
		
		ServletRequestAttributes attr = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
		HttpServletRequest request = attr.getRequest();
		
		MenuTO menuto = new MenuTO();
		menuto.setUse_yn("Y");
		request.setAttribute("menus", menuService.getMenuList(menuto));
	}
}
