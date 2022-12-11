package com.jewelry.main.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ObjectUtils;

import com.jewelry.main.domain.MainTO;
import com.jewelry.main.service.MainService;
import com.jewelry.order.mapper.OrderMapper;
import com.jewelry.sale.domain.SaleVO;
import com.jewelry.sale.mapper.SaleMapper;
import com.jewelry.stock.mapper.StockMapper;
import com.jewelry.util.Utils;

@Service
public class MainServiceImpl implements MainService {

	@Autowired
	private SaleMapper saleMapper;

	@Autowired
	private OrderMapper orderMapper;

	@Autowired
	private StockMapper stockMapper;
	
	
	@Transactional(readOnly = true)
	@Override
	public Map<String, Object> findAllStats(MainTO to) {
		Map<String, Object> response = new HashMap<>();
		
		to.setSearchyear(Utils.getTodayDateFormat("yyyy"));
		
		//월별 매출 현황
		List<Integer> salePriceList = new ArrayList<>();
		List<SaleVO> monthSaleList = saleMapper.selectMonthlySalePriceStats(to);
		if(monthSaleList == null || monthSaleList.size() == 0) {
			for(int i = 0 ; i < 12 ; i++) salePriceList.add(0);
		}
		else {
			for(int i = 0 ; i < 12 ; i++) {
				int salePrice = 0;
				for(SaleVO monthvo : monthSaleList) {
					if(!ObjectUtils.isEmpty(monthvo.getSalemonth()) && monthvo.getSalemonth() == (i+1)) {
						salePrice = monthvo.getSaleprice();
						break;
					}
				}
				salePriceList.add(salePrice);
			}
		}
		response.put("salePriceMonthly", salePriceList);
		
		//재질별 주문개수
		response.put("materialOrders", orderMapper.selectNumOfOrdersPerMaterial(to));
		
		//재질별 현 재고현황
		response.put("materialStocks", stockMapper.selectNumOfStocksPerMaterial(to));
		return response;
	}
	
	@Transactional(readOnly = true)
	@Override
	public Map<String, Object> findMonthlySalePrice(MainTO to) {
		Map<String, Object> response = new HashMap<>();

		List<Integer> salePriceList = new ArrayList<>();
		List<SaleVO> monthSaleList = saleMapper.selectMonthlySalePriceStats(to);
		if(monthSaleList == null || monthSaleList.size() == 0) {
			for(int i = 0 ; i < 12 ; i++) salePriceList.add(0);
		}
		else {
			for(int i = 0 ; i < 12 ; i++) {
				int salePrice = 0;
				for(SaleVO monthvo : monthSaleList) {
					if(!ObjectUtils.isEmpty(monthvo.getSalemonth()) && monthvo.getSalemonth() == (i+1)) {
						salePrice = monthvo.getSaleprice();
						break;
					}
				}
				salePriceList.add(salePrice);
			}
		}
		response.put("salePriceMonthly", salePriceList);
		
		return response;
	}
	
	@Transactional(readOnly = true)
	@Override
	public Map<String, Object> findMaterialOrders(MainTO to) {
		Map<String, Object> response = new HashMap<>();

		//재질별 주문개수
		response.put("materialOrders", orderMapper.selectNumOfOrdersPerMaterial(to));
		return response;
		
	}
	
	@Transactional(readOnly = true)
	@Override
	public Map<String, Object> findMaterialStocks(MainTO to) {
		Map<String, Object> response = new HashMap<>();

		//재질별 주문개수
		response.put("materialStocks", stockMapper.selectNumOfStocksPerMaterial(to));
		return response;
		
	}

	
}
