package com.jewelry.cms.code;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jewelry.cms.code.domain.CodeTO;
import com.jewelry.cms.code.domain.CodeVO;
import com.jewelry.cms.code.service.CodeService;
import com.jewelry.exception.ErrorCode;
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
	public ResponseEntity<Object> codeWrite(@RequestBody final CodeTO params) {
		params.setInpt_id(((CustomUserDetails)session.getAttribute("USER_INFO")).getUsername());
		String result = codeService.insertCode(params);
		
		ErrorCode response = result.equals("success") ? ErrorCode.SUCCESS : ErrorCode.FAIL;
		return  new ResponseEntity<>(response.getStatus());

	}

	@GetMapping("/{cdid}")
	public CodeVO findById(@PathVariable final String cdid) {
		return codeService.getCode(cdid);
	}
	
	@PatchMapping("/{cdid}")
	public ResponseEntity<Object> codeModify(@PathVariable final String cdid, @RequestBody final CodeTO params){
		params.setUpdt_id(((CustomUserDetails)session.getAttribute("USER_INFO")).getUsername());
		params.setCd_id(cdid);
		String result = codeService.updateCode(params);
		
		ErrorCode response = result.equals("success") ? ErrorCode.SUCCESS : ErrorCode.FAIL;
		return new ResponseEntity<>(response.getStatus());
	}

	@DeleteMapping("/{cdid}")
	public String delete(@PathVariable final String cdid) {
		return codeService.deleteCode(cdid);
	}
}
