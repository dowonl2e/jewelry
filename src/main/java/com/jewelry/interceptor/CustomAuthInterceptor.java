package com.jewelry.interceptor;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;
import org.springframework.util.ObjectUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.jewelry.cms.auth.domain.AuthMenuTO;
import com.jewelry.cms.auth.domain.AuthMenuVO;
import com.jewelry.cms.auth.service.AuthService;
import com.jewelry.user.domain.CustomUserDetails;

public class CustomAuthInterceptor implements HandlerInterceptor {
	
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private AuthService authService;
	
	/**
	 * 컨트롤러의 메서드에 매핑된 특정 URI를 호출했을 때 컨트롤러를 접근하기 전 실행되는 메서드
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		// 요청 URL 
		String url = request.getRequestURI();
		
		if(!url.contains("image/display")) {
			System.out.println("==================== AUTH BEGIN ====================");
			System.out.println("Request URI(PreHandle) ==> " + url);
			System.out.println("====================================================");
		}
		HttpSession session = request.getSession();
        
		//권한 체크
		if(!url.contains("signin")
				&& !url.contains("main")
				&& !url.startsWith("/error")
				&& !url.startsWith("/api")
				&& !url.contains("image/display")
				) {
			//권한이 없으면 튕겨내기
			CustomUserDetails userInfo = (CustomUserDetails)session.getAttribute("USER_INFO");
			String userId = userInfo.getUsername();
			String userRole = userInfo.getUserrole();

			if(!ObjectUtils.nullSafeEquals(userRole, "ADMIN")) {

				String transUrl = url.substring(1, url.length());
				
				List<String> menuIdList = new ArrayList<>();
				int startIdx = 0;
				String subStrUrl = null;
				for(int i = 0 ; i < transUrl.length() ; i++) {
					if(transUrl.charAt(i) == '/') {
						subStrUrl = transUrl.substring(startIdx, i);
						if(!ObjectUtils.nullSafeEquals(subStrUrl,"popup")) {
							menuIdList.add(subStrUrl);
							startIdx = i+1;
						}
						
						if(menuIdList.size() == 2)
							break;
					}
				}
				
				List<AuthMenuVO> authList = authService.findUserAuthMenus(new AuthMenuTO(userId, menuIdList.get(0)));
				AuthMenuVO authvo = null;
				String oneDepthPath = menuIdList.size() > 0 ? menuIdList.get(0) : "";
				String twoDepthPath = menuIdList.size() > 1 ? (oneDepthPath+"/"+menuIdList.get(1)) : (oneDepthPath);
				if(!CollectionUtils.isEmpty(authList)) {
					for(AuthMenuVO tempvo : authList){
						if(menuIdList.size() > 1 && ObjectUtils.nullSafeEquals(twoDepthPath, tempvo.getMenuId())) {
							authvo = tempvo;
							break;
						}
						
						if(ObjectUtils.nullSafeEquals(oneDepthPath, tempvo.getMenuId()))
							authvo = tempvo;	
					}
				}

				boolean accessAuth = authvo == null || ObjectUtils.nullSafeEquals(authvo.getAccessAuth(), "N") ? false : true;

				if(!accessAuth) {
					System.out.println("===============================================");
					System.out.println("=================== No Auth ===================");
					System.out.println("===============================================");
					response.sendRedirect(request.getContextPath() + "/error/access-denied");
					return false;
				}
				
				session.setAttribute("WRITE_AUTH", (authvo.getWriteAuth() == null ? "N" : authvo.getWriteAuth()));
				session.setAttribute("VIEW_AUTH", (authvo.getViewAuth() == null ? "N" : authvo.getViewAuth()));
				session.setAttribute("MODIFY_AUTH", (authvo.getModifyAuth() == null ? "N" : authvo.getModifyAuth()));
				session.setAttribute("REMOVE_AUTH", (authvo.getRemoveAuth() == null ? "N" : authvo.getRemoveAuth()));
			}
			else {
				session.setAttribute("WRITE_AUTH", "Y");
				session.setAttribute("VIEW_AUTH", "Y");
				session.setAttribute("MODIFY_AUTH", "Y");
				session.setAttribute("REMOVE_AUTH", "Y");
			}
		}
		
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
	
	/**
	 * 컨트롤러를 실행한 다음, 화면(View)으로 결과를 전달하기 전에 실행되는 메서드
	 */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		if(!request.getRequestURI().contains("image/display")) {
			System.out.println("====================================================");
			System.out.println("Request URI(PostHandle) ==> " + request.getRequestURI());
			System.out.println("===================== AUTH END =====================");
		}
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}
}
