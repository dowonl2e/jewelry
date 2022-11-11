package com.jewelry.cms.code.service;

import java.util.List;
import java.util.Map;

import com.jewelry.cms.code.domain.CodeTO;
import com.jewelry.cms.code.domain.CodeVO;

public interface CodeService {
	
	Map<String, Object> findAllCode(CodeTO to);
	
	CodeVO findCodeByCdId(String cdid);
	
	String insertCode(CodeTO to);
	
	String updateCode(CodeTO to);
	
	String deleteCode(String cdid);
	
	List<CodeVO> findAllByUpCdId(String upcdidarr, Integer cddepth);
}
