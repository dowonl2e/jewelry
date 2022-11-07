package com.jewelry.cms.code;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jewelry.cms.code.domain.CodeTO;
import com.jewelry.cms.code.service.CodeService;
import com.jewelry.user.domain.CustomUserDetails;

@RestController
@RequestMapping("/api/code")
public class CodeApiController {

	@Autowired
	private CodeService codeService;
	
	@Autowired
    private HttpSession session;
	
	@GetMapping("/list")
	public Map<String, Object> codeList(final CodeTO params){
		return codeService.getCodeList(params);
	}
	
	@PostMapping("/write")
	public String codeWrite(@RequestBody final CodeTO params) throws Exception {
		try {
			params.setInpt_id(((CustomUserDetails)session.getAttribute("USER_INFO")).getUsername());
			return codeService.insertCode(params);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@PostMapping("/modify")
	public Map<String, Object> codeModify(final CodeTO params, HttpServletRequest request){
		params.setInpt_id(((CustomUserDetails)session.getAttribute("USER_INFO")).getUsername());
		return codeService.getCodeList(params);
	}
	
}
