package com.jewelry.cash.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jewelry.cash.domain.CashTO;
import com.jewelry.cash.domain.CashVO;

@Mapper
public interface CashMapper {
	
	int selectCashListCount(CashTO to);
	
	List<CashVO> selectCashList(CashTO vo);

	List<CashVO> selectCashStatsList(CashTO vo);
	
	List<CashVO> selectCashMaterialStatsList(CashTO vo);

	int insertCash(CashTO to) throws Exception;
	
	CashVO selectCash(Long cashno);
	
	int updateCash(CashTO to) throws Exception;
	
	int updateCashToDelete(CashTO to) throws Exception;
	
	int updateCashesToDelete(CashTO to) throws Exception;

}
