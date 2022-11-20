package com.jewelry.stock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jewelry.stock.domain.StockTO;
import com.jewelry.stock.domain.StockVO;

@Mapper
public interface StockMapper {
	
	int selectStockListCount(StockTO to);
	
	List<StockVO> selectStockList(StockTO to);

	int insertStock(StockTO to) throws Exception;
	
	StockVO selectStock(Long stockno);
	
	int updateStock(StockTO to) throws Exception;

	int updateStockToDelete(StockTO to) throws Exception;

}
