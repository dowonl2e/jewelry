package com.jewelry.cms.code.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jewelry.cms.code.domain.CodeTO;
import com.jewelry.cms.code.domain.CodeVO;
import com.jewelry.cms.code.mapper.CodeMapper;
import com.jewelry.cms.code.service.CodeService;

@Service
public class CodeServiceImpl implements CodeService {
	
	@Autowired
	private CodeMapper codeMapper;

	@Override
	public Map<String, Object> getCodeList(CodeTO to) {
		Map<String, Object> response = new HashMap<>();

		int totalcount = codeMapper.selectCodeListCount(to);
		List<CodeVO> list = codeMapper.selectCodeList(to);

		to.setTotalcount(totalcount);
		
		response.put("params", to);
		response.put("list", list);
		
		return response;
	}

	@Override
	public CodeVO getCode(String cdid) {
		return codeMapper.selectCode(cdid);
	}

	@Override
	public String insertCode(CodeTO to) {
		return codeMapper.insertCode(to) > 0 ? "success" : "fail";
	}

	@Override
	public String updateCode(CodeTO to) {
		return codeMapper.updateCode(to) > 0 ? "success" : "fail";
	}

	@Override
	public String deleteCode(String cdid) {
		return codeMapper.deleteCode(cdid) > 0 ? "success" : "fail";
	}
	
	
}
