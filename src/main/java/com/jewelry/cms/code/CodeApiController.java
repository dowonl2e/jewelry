package com.jewelry.cms.code;

import java.util.Map;

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
	public Map<String, Object> findAll(final CodeTO to){
		return codeService.findAllCode(to);
	}
	
	@PostMapping("/write")
	public ResponseEntity<Object> write(@RequestBody final CodeTO to) {
		to.setInpt_id(((CustomUserDetails)session.getAttribute("USER_INFO")).getUsername());
		String result = codeService.insertCode(to);
		
		ErrorCode response = result.equals("success") ? ErrorCode.SUCCESS : ErrorCode.FAIL;
		return  new ResponseEntity<>(response.getStatus());

	}

	@GetMapping("/{cdid}")
	public CodeVO findCodeByCdId(@PathVariable final String cdid) {
		return codeService.findCodeByCdId(cdid);
	}
	
	@PatchMapping("/{cdid}")
	public ResponseEntity<Object> modify(@PathVariable final String cdid, @RequestBody final CodeTO to){
		to.setUpdt_id(((CustomUserDetails)session.getAttribute("USER_INFO")).getUsername());
		to.setCd_id(cdid);
		String result = codeService.updateCode(to);
		
		ErrorCode response = result.equals("success") ? ErrorCode.SUCCESS : ErrorCode.FAIL;
		return new ResponseEntity<>(response.getStatus());
	}

	@DeleteMapping("/{cdid}")
	public String remove(@PathVariable final String cdid) {
		return codeService.deleteCode(cdid);
	}
}
