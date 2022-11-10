package com.jewelry.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class SessionInterceptor implements HandlerInterceptor {
	
	/**
	 * 컨트롤러의 메서드에 매핑된 특정 URI를 호출했을 때 컨트롤러를 접근하기 전 실행되는 메서드
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		// 요청 URL 
		String url = request.getRequestURI();
		
		System.out.println("==================== BEGIN ====================");
		System.out.println("Request URI ===> " + url);
		System.out.println("===============================================");
		HttpSession session = request.getSession();
		
    	// UserDto는 User에 대한 Dto인데 로직 흐름을 참고만 하셔도 됩니다.
        
		if(!url.contains("signin")) {
	        // 로그인 정보가 없으면 튕겨내기
			if(session.getAttribute("USER_INFO") == null) {
				System.out.println("===============================================");
				System.out.println("================== No Session =================");
				System.out.println("===============================================");
				response.sendRedirect(request.getContextPath() + "/signin");
				return false;
			}
		}
		
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
	
	/**
	 * 컨트롤러를 실행한 다음, 화면(View)으로 결과를 전달하기 전에 실행되는 메서드
	 */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		System.out.println("===================== END =====================");
		System.out.println("Request URI ===> " + request.getRequestURI());
		System.out.println("===================== END =====================");
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}

	
}
