package com.jewelry.user.service.impl;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.jewelry.user.domain.CustomUserDetails;
import com.jewelry.user.mapper.UserMapper;

@Service
public class CustomUserDetailsServiceImpl implements UserDetailsService {

	@Autowired
    private UserMapper userMapper;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		CustomUserDetails vo = userMapper.selectUserWithLogin(username);
		if (vo == null) {
			System.out.println("**************Not Found User***************");
			throw new UsernameNotFoundException("아이디/비밀번호가 일치하지 않습니다.");
		}
		
		System.out.println("**************Found User***************");
		ServletRequestAttributes attr = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
		HttpSession session = attr.getRequest().getSession(true); // true == allow create
		session.setAttribute("USER_INFO", vo);
		
		return vo;
	}

}
