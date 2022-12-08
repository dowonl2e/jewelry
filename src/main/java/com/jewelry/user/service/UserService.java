package com.jewelry.user.service;

import java.util.Map;

import com.jewelry.user.domain.UserTO;
import com.jewelry.user.domain.UserVO;

public interface UserService {
	
	Map<String, Object> findAllUser(UserTO to);
	
	String insertUser(UserTO to);
	
	UserVO findUser(String userid);

	String updateUser(UserTO to);
	
	
}
