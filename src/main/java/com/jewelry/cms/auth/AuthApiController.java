package com.jewelry.cms.auth;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jewelry.cms.auth.domain.AuthMenuTO;
import com.jewelry.cms.auth.service.AuthService;
import com.jewelry.exception.ErrorCode;
import com.jewelry.user.domain.CustomUserDetails;
import com.jewelry.user.domain.UserTO;

@RestController
@RequestMapping("/api/auth")
public class AuthApiController {
	
	@Autowired
	private HttpSession session;

	@Autowired
	private AuthService authService;
	
	@GetMapping("/managers")
	public Map<String, Object> managers(final UserTO to){
		return authService.findAllManager(to);
	}
	
	@GetMapping("/menus/{userId}")
	public Map<String, Object> menus(@PathVariable final String userId, final AuthMenuTO to){
		to.setUser_id(userId);
		return authService.findAllAuthMenu(to);
	}
	
	@PostMapping("/menus")
	public ResponseEntity<Object> writeAuthMenus(final AuthMenuTO to) {
		String userId = ((CustomUserDetails)session.getAttribute("USER_INFO")).getUsername();
		to.setInpt_id(userId);
		to.setUpdt_id(userId);
		String result = authService.updateAuthMenus(to);
		
		ErrorCode response = result.equals("success") ? ErrorCode.SUCCESS : ErrorCode.FAIL;
		return  new ResponseEntity<>(response.getStatus());

	}
	
	@PostMapping("/menu")
	public ResponseEntity<Object> writeAuthMenu(final AuthMenuTO to) {
		String userId = ((CustomUserDetails)session.getAttribute("USER_INFO")).getUsername();
		to.setInpt_id(userId);
		to.setUpdt_id(userId);
		String result = authService.updateAuthMenu(to);
		
		ErrorCode response = result.equals("success") ? ErrorCode.SUCCESS : ErrorCode.FAIL;
		return  new ResponseEntity<>(response.getStatus());

	}
}
