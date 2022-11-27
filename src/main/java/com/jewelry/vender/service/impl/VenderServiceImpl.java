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
		
		to.setTotalcount(venderMapper.selectVenderListCount(to));
		response.put("list", venderMapper.selectVenderList(to)); 
		response.put("params", to);
		
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
		String result = "fail";
		try {
			result = venderMapper.insertVender(to) > 0 ? "success" : "fail";
		}
		catch(Exception e) {
			e.printStackTrace();
			result = "fail";
		}
		return result;
	}

	@Transactional
	@Override
	public String updateVender(VenderTO to) {
		String result = "fail";
		try {
			result = venderMapper.updateVender(to) > 0 ? "success" : "fail";
		}
		catch(Exception e) {
			e.printStackTrace();
			result = "fail";
		}
		return result;
	}
	
	@Transactional
	@Override
	public String updateVenderToDelete(VenderTO to) {
		String result = "fail";
		try {
			result = venderMapper.updateVenderToDelete(to) > 0 ? "success" : "fail";
		}
		catch(Exception e) {
			e.printStackTrace();
			result = "fail";
		}
		return result;
	}

}
