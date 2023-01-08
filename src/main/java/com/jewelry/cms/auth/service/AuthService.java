package com.jewelry.cms.auth.service;

import java.util.List;
import java.util.Map;

import com.jewelry.cms.auth.domain.AuthMenuTO;
import com.jewelry.cms.auth.domain.AuthMenuVO;
import com.jewelry.user.domain.UserTO;

public interface AuthService {
		
	Map<String, Object> findAllManager(UserTO to);
	
	Map<String, Object> findAllAuthMenu(AuthMenuTO to);

	String updateAuthMenus(AuthMenuTO to);
	
	String updateAuthMenu(AuthMenuTO to);
	
	List<AuthMenuVO> findUserAuthMenus(AuthMenuTO to);
}
