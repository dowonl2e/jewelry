package com.jewelry.user.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.jewelry.user.domain.CustomUserDetails;
import com.jewelry.user.domain.UserTO;

@Mapper
public interface UserMapper {
	
	CustomUserDetails selectUserWithLogin(String user_id);
	
	CustomUserDetails selectUser(String user_id);
	
	void insertUser(UserTO to);
}
