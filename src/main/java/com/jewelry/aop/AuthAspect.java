package com.jewelry.aop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.jewelry.cms.menu.domain.MenuTO;
import com.jewelry.cms.menu.service.MenuService;
import com.jewelry.user.domain.CustomUserDetails;

@Aspect
@Component
public class AuthAspect {

	@Autowired
	private HttpSession session;
	
	@Autowired
	private MenuService menuService;
	
	@Pointcut(
		"(" +
			"execution(* com.jewelry..*PageController.*(..)) || " +
			"execution(* com.jewelry.cms..*PageController.*(..))" +
		") && " + 
//		"!execution(* com.jewelry.*.UserController.*(..)) && " +
//		"!execution(* com.jewelry.*.FileController.*(..)) && " +
//		"!execution(* com.jewelry.ErrorController.*(..)) && " +
//		"!execution(* com.jewelry.*.*ApiController.*(..)) && " +
//		"!execution(* com.jewelry.cms.*.*ApiController.*(..)) && " +
		"!execution(* com.jewelry..*PageController.*Popup(..)) && " + 
		"!execution(* com.jewelry.cms..*PageController.*Popup(..)) "
	)
	private void menuPointCut() {}
	
	//메뉴
	@Before("menuPointCut()")
	public void beforeAdvice(JoinPoint joinPoint) throws Exception {
		System.out.println("[****************************** 메뉴 조회 AOP ***********************************");
		
		ServletRequestAttributes attr = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
		HttpServletRequest request = attr.getRequest();
		
		CustomUserDetails userInfo = (CustomUserDetails)session.getAttribute("USER_INFO");
		String userRole = userInfo.getUserrole();

		MenuTO menuto = new MenuTO();
		menuto.setUse_yn("Y");
		menuto.setMenu_depth(1);
		if(userRole.equals("ADMIN")) {
			request.setAttribute("menus", menuService.selectMenuListAll(menuto));
			menuto.setMenu_depth(2);
			request.setAttribute("submenus", menuService.selectMenuListAll(menuto));
		}
		else {
			menuto.setUser_id(userInfo.getUsername());
			request.setAttribute("menus", menuService.selectMenuList(menuto));
			menuto.setMenu_depth(2);
			request.setAttribute("submenus", menuService.selectMenuList(menuto));
		}
	}
}
