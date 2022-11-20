package com.jewelry.cms.code.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jewelry.cms.code.domain.CodeTO;
import com.jewelry.cms.code.domain.CodeVO;
import com.jewelry.cms.code.mapper.CodeMapper;
import com.jewelry.cms.code.service.CodeService;

@Service
public class CodeServiceImpl implements CodeService {
	
	@Autowired
	private CodeMapper codeMapper;

	@Transactional(readOnly = true)
	@Override
	public Map<String, Object> findAllCode(CodeTO to) {
		Map<String, Object> response = new HashMap<>();

		to.setTotalcount(codeMapper.selectCodeListCount(to));
		response.put("list", codeMapper.selectCodeList(to));
		response.put("params", to);
		
		return response;
	}

	@Transactional(readOnly = true)
	@Override
	public CodeVO findCodeByCdId(String cdid) {
		return codeMapper.selectCode(cdid);
	}

	@Transactional
	@Override
	public String insertCode(CodeTO to) {
		int res = 0;
		try {
			res = codeMapper.insertCode(to);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return res > 0 ? "success" : "fail";
	}

	@Transactional
	@Override
	public String updateCode(CodeTO to) {
		int res = 0;
		try {
			res = codeMapper.updateCode(to);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return res > 0 ? "success" : "fail";
	}

	@Transactional
	@Override
	public String deleteCode(String cdid) {
		int res = 0;
		try {
			res = codeMapper.deleteCode(cdid);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return res > 0 ? "success" : "fail";
	}

	@Transactional(readOnly = true)
	@Override
	public List<CodeVO> findAllByUpCdId(String upcdid, Integer cddepth) {
		CodeTO to = new CodeTO();
		to.setUp_cd_id(upcdid);
		to.setCd_depth(cddepth);
		return codeMapper.selectCodeListByUpCdId(to);
	}

	@Transactional(readOnly = true)
	@Override
	public List<CodeVO> findAllByUpCdId(String[] upcdid, Integer cddepth) {
		CodeTO to = new CodeTO();
		to.setUp_cd_id_arr(upcdid);
		to.setCd_depth(cddepth);
		return codeMapper.selectCodeListByUpCdIdArr(to);
	}

	@Transactional(readOnly = true)
	@Override
	public Map<String, Object> findAllSubCode(String upcdid, Integer cddepth) {
		CodeTO to = new CodeTO();
		to.setUp_cd_id(upcdid);
		to.setCd_depth(cddepth);

		Map<String, Object> response = new HashMap<>();
		CodeVO vo = codeMapper.selectCode(upcdid);
		response.put("vo", vo);
		response.put("list", codeMapper.selectSubCodeList(to));
		
		return response;
	}
	
	
}
