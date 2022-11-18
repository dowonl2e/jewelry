package com.jewelry.vender.service;

import java.util.Map;

import com.jewelry.customer.domain.CustomerTO;
import com.jewelry.vender.domain.VenderTO;
import com.jewelry.vender.domain.VenderVO;

public interface VenderService {

	Map<String, Object> findAllVender(VenderTO to);
	
	VenderVO findVenderByNo(Long venderno);
	
	String insertVender(VenderTO to);
	
	String updateVender(VenderTO to);
	
	String updateVenderToDelete(VenderTO to);
	
}
