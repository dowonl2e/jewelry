package com.jewelry.vender.service;

import java.util.Map;

import com.jewelry.vender.domain.VenderPayTO;
import com.jewelry.vender.domain.VenderPayVO;
import com.jewelry.vender.domain.VenderTO;
import com.jewelry.vender.domain.VenderVO;

public interface VenderService {

	Map<String, Object> findAllVender(VenderTO to);
	
	VenderVO findVenderByNo(Long venderno);
	
	String insertVender(VenderTO to);
	
	String updateVender(VenderTO to);
	
	String updateVenderToDelete(VenderTO to);
	
	Map<String, Object> findAllVenderPay(VenderPayTO to);

	VenderPayVO findVenderPayByNo(Long payNo);
	
	String insertVenderPay(VenderPayTO to);
	
	String updateVenderPay(VenderPayTO to);
	
	String updateVenderPaysToDelete(VenderPayTO to);
	

}
