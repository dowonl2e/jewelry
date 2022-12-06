package com.jewelry.user.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jewelry.user.domain.UserTO;
import com.jewelry.user.mapper.UserMapper;
import com.jewelry.user.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public void addUser(UserTO to) {
		userMapper.insertUser(to);
	}

}
