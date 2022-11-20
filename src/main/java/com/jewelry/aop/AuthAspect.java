package com.jewelry.aop;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.jewelry.cms.menu.domain.MenuTO;
import com.jewelry.cms.menu.service.MenuService;

@Aspect
@Component
public class AuthAspect {

	@Autowired
	private MenuService menuService;
	
	@Before(
//		  "execution(* com.jewelry.*.*Controller.*(..)) && " + 
//		  "!execution(* com.ineast.manager..*.UserController.*(..))"
		"(" +
		"execution(* com.jewelry.*.*Controller.*(..)) || " + 
		"execution(* com.jewelry.cms.*.*Controller.*(..))" + 
		") && " + 
		"!execution(* com.jewelry.*.UserController.*(..)) && " +
		"!execution(* com.jewelry.*.FileController.*(..)) && " +
		"!execution(* com.jewelry.*.*Controller.*Popup(..)) && " +
		"!execution(* com.jewelry.*.*ApiController.*(..)) && " +
		"!execution(* com.jewelry.cms.*.*ApiController.*(..)) && " +
		"!execution(* com.jewelry.cms.*.*Controller.*Popup(..))"
	)
	public void afterAdvice(JoinPoint joinPoint) throws Exception {
		System.out.println("[****************************** 메뉴 조회 AOP ***********************************");
		
		ServletRequestAttributes attr = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
		HttpServletRequest request = attr.getRequest();
		
		MenuTO menuto = new MenuTO();
		menuto.setUse_yn("Y");
		menuto.setMenu_depth(1);
		request.setAttribute("menus", menuService.getMenuList(menuto));
		menuto.setMenu_depth(2);
		request.setAttribute("submenus", menuService.getMenuList(menuto));
	}
}
