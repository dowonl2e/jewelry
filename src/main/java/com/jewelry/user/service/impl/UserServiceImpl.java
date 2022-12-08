package com.jewelry.user.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.jewelry.user.domain.UserTO;
import com.jewelry.user.domain.UserVO;
import com.jewelry.user.mapper.UserMapper;
import com.jewelry.user.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper userMapper;
	

	@Transactional(readOnly = true)
	@Override
	public Map<String, Object> findAllUser(UserTO to) {
		Map<String, Object> response = new HashMap<>();

		to.setTotalcount(userMapper.selectUserListCount(to));
		response.put("list", userMapper.selectUserList(to));
		response.put("params", to);

		return response;
	}
	
	@Transactional
	@Override
	public String insertUser(UserTO to) {
		String result = "fail";
		try {
			result = userMapper.insertUser(to) > 0 ? "success" : "fail";
		}
		catch (Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			result = "fail";
		}
		return result;
	}
	
	@Transactional(readOnly = true)
	@Override
	public UserVO findUser(String userid) {
		return userMapper.selectUser(userid);
	}

	@Transactional
	@Override
	public String updateUser(UserTO to) {
		String result = "fail";
		try {
			result = userMapper.updateUser(to) > 0 ? "success" : "fail";
		}
		catch (Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			result = "fail";
		}
		return result;
	}
}
