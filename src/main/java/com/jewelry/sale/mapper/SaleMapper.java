package com.jewelry.sale.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jewelry.main.domain.MainTO;
import com.jewelry.sale.domain.SaleTO;
import com.jewelry.sale.domain.SaleVO;

@Mapper
public interface SaleMapper {
	
	int selectSaleListCount(SaleTO to);
	
	List<SaleVO> selectSaleList(SaleTO to);
	
	int updateSalesToStock(SaleTO to) throws Exception;
	
	/**
	 * 메인화면 - 월별 매출액
	 * @param to
	 * @return
	 */
	List<SaleVO> selectMonthlySalePriceStats(MainTO to);
}
