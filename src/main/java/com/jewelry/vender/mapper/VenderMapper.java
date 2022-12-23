package com.jewelry.vender.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jewelry.vender.domain.VenderPayTO;
import com.jewelry.vender.domain.VenderPayVO;
import com.jewelry.vender.domain.VenderTO;
import com.jewelry.vender.domain.VenderVO;

@Mapper
public interface VenderMapper {

	int selectVenderListCount(VenderTO to); // *PAGING이 있을 때 > TOTAL COUNT
	
	List<VenderVO> selectVenderList(VenderTO to); // LIST 가져오는 것
	
	VenderVO selectVender(Long venderno); // KEY를 통해서 parameter는 1개 정도 long 이나 string이 파라미터
	
	int insertVender(VenderTO to) throws Exception; 	// insert to용 담아야할 용도
	
	int updateVender(VenderTO to) throws Exception;  // update to용 담아야할 용도
	
	int updateVenderToDelete(VenderTO to) throws Exception; 	// delete 사용할지 안할지 key로 결정하기 위한 것

	
	/*
	 * ------------
	 * 제조사 결제 현황
	 * ------------
	 */
	int selectVenderPayListCount(VenderPayTO to);
	
	List<VenderPayVO> selectVenderPayList(VenderPayTO to);
	
	VenderPayVO selectVenderPay(Long payNo);
	
	int insertVenderPay(VenderPayTO to) throws Exception;
	
	int updateVenderPay(VenderPayTO to) throws Exception;
	
	int updateVenderPaysToDelete(VenderPayTO to) throws Exception;

}
