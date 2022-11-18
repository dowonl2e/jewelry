package com.jewelry.vender.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jewelry.vender.domain.VenderTO;
import com.jewelry.vender.domain.VenderVO;
import com.jewelry.vender.mapper.VenderMapper;
import com.jewelry.vender.service.VenderService;

@Service
public class VenderServiceImpl implements VenderService{

	@Autowired
	private VenderMapper venderMapper;
	
	@Transactional(readOnly = true)
	@Override
	public Map<String, Object> findAllVender(VenderTO to) {
		Map<String, Object> response = new HashMap<>();
		
		int totalcount = venderMapper.selectVenderListCount(to);
		List<VenderVO> list = venderMapper.selectVenderList(to);
		
		to.setTotalcount(totalcount);
		
		response.put("params", to);
		response.put("list", list);
		
		return response;
	}

	@Transactional(readOnly = true)
	@Override
	public VenderVO findVenderByNo(Long venderno) {
		return venderMapper.selectVender(venderno);
	}
	
	@Transactional
	@Override
	public String insertVender(VenderTO to) {
		return venderMapper.insertVender(to) > 0 ? "success" : "fail";
	}

	@Transactional
	@Override
	public String updateVender(VenderTO to) {
		return venderMapper.updateVender(to) > 0 ? "success" : "fail";
	}
	
	@Transactional
	@Override
	public String updateVenderToDelete(VenderTO to) {
		return venderMapper.updateVenderToDelete(to) > 0 ? "success" : "fail";
	}

}
