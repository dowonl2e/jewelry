package com.jewelry.user;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jewelry.exception.ErrorCode;
import com.jewelry.user.domain.CustomUserDetails;
import com.jewelry.user.domain.UserTO;
import com.jewelry.user.domain.UserVO;
import com.jewelry.user.service.UserService;

@RestController
@RequestMapping("/api/user")
public class UserApiController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private HttpSession session;
	
	@GetMapping("/list")
	public Map<String, Object> findAllUser(final UserTO to){
		return userService.findAllUser(to);
	}
	
	@PostMapping("/write")
	public ResponseEntity<Object> write(@RequestBody final UserTO to) {
		PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		to.setInpt_id(((CustomUserDetails)session.getAttribute("USER_INFO")).getUsername());
		to.setUser_pwd(passwordEncoder.encode(to.getUser_pwd()));
		to.setUser_role("MANAGER");
		String result = userService.insertUser(to);
		
		ErrorCode response = result.equals("success") ? ErrorCode.SUCCESS : ErrorCode.FAIL;
		return new ResponseEntity<>(response.getStatus());
	}
	
	@GetMapping("/{userid}")
	public UserVO findUser(@PathVariable final String userid) {
		return userService.findUser(userid);
	}
	
	@PatchMapping("/modify/{userid}")
	public ResponseEntity<Object> modify(@PathVariable final String userid, @RequestBody final UserTO to) {
		PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		to.setUser_pwd(ObjectUtils.isEmpty(to.getUser_pwd()) ? null : passwordEncoder.encode(to.getUser_pwd()));
		to.setUpdt_id(((CustomUserDetails)session.getAttribute("USER_INFO")).getUsername());
		to.setUser_id(userid);
		String result = userService.updateUser(to);
		
		ErrorCode response = result.equals("success") ? ErrorCode.SUCCESS : ErrorCode.FAIL;
		return new ResponseEntity<>(response.getStatus());
	}
}
