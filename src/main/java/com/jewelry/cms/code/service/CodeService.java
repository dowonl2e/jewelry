package com.jewelry.cms.code.service;

import java.util.Map;

import com.jewelry.cms.code.domain.CodeTO;
import com.jewelry.cms.code.domain.CodeVO;

public interface CodeService {
	
	Map<String, Object> getCodeList(CodeTO to);
	
	CodeVO getCode(CodeTO to);
	
	String insertCode(CodeTO to);
	
	String updateCode(CodeTO to);
	
	String deleteCode(CodeTO to);
}
