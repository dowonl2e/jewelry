package com.jewelry.catalog.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.util.ObjectUtils;

import com.jewelry.catalog.domain.CatalogTO;
import com.jewelry.catalog.domain.CatalogVO;
import com.jewelry.catalog.domain.StoneTO;
import com.jewelry.catalog.mapper.CatalogMapper;
import com.jewelry.catalog.service.CatalogService;
import com.jewelry.common.mapper.FileMapper;
import com.jewelry.common.s3.domain.FileTO;
import com.jewelry.common.s3.service.AmazonS3Service;

@Service
public class CatalogServiceImpl implements CatalogService {

	@Autowired
	private CatalogMapper catalogMapper;
	
	@Autowired
	private AmazonS3Service amazonS3Service;
	
	@Autowired
	private FileMapper fileMapper;
	
	
	@Transactional(readOnly = true)
	@Override
	public Map<String, Object> findAllCatalog(CatalogTO to) {
		Map<String, Object> response = new HashMap<>();

		int totalcount = catalogMapper.selectCatalogListCount(to);
		List<CatalogVO> list = catalogMapper.selectCatalogList(to);

		to.setTotalcount(totalcount);
		
		response.put("params", to);
		response.put("list", list);
		
		return response;
	}

	@Transactional(readOnly = true)
	@Override
	public CatalogVO findCatalogById(Long catalogid) {
		return catalogMapper.selectCatalog(catalogid);
	}

	@Transactional
	@Override
	public String insertCatalog(CatalogTO to) {
		String result = "success";

		try {
			FileTO fileto = amazonS3Service.upload(to.getCatalogfile(), "catalog", "CAT");
			
			int res = catalogMapper.insertCatalog(to);
			if(res > 0) {
				Long catalogno = to.getCatalog_no();
				if(catalogno != null && catalogno > 0) {

					String[] stone_nm_arr = to.getStone_nm_arr();
					if(stone_nm_arr != null && stone_nm_arr.length > 0) {
						List<StoneTO> stoneList = new ArrayList<>();

						String[] stone_type_arr = to.getStone_type_arr();
						String[] stone_desc_arr = to.getStone_desc_arr();
						Integer[] bead_cnt_arr = to.getBead_cnt_arr();
						String[] purchase_price_arr = to.getPurchase_price_arr();

						StoneTO stoneto = new StoneTO();
						stoneto.setCatalog_no(catalogno);
						stoneto.setInpt_id(to.getInpt_id());
						
						int i = 0;
						for(String stone_nm : stone_nm_arr) {
							if(!ObjectUtils.isEmpty(stone_nm)) {
								stoneto.setStone_type(stone_type_arr[i]);
								stoneto.setStone_nm(stone_nm);
								stoneto.setBead_cnt(bead_cnt_arr[i]);
								stoneto.setPurchase_price(purchase_price_arr[i]);
								stoneto.setStone_desc(stone_desc_arr[i]);
								stoneList.add(stoneto);
							}
							i++;
						}

						if(stoneList.size() > 0) {
							catalogMapper.insertStone(stoneList);
						}
					}
					
					if(!ObjectUtils.isEmpty(fileto.getOrigin_nm())) {
						fileto.setInpt_id(to.getInpt_id());
						fileto.setRef_no(catalogno);
						fileMapper.insertFile(fileto);
					}
				}

				result = "success";
			}
			else {
				result = "fail";
			}
		}
		catch (Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			result = "fail";
		}

		return result;
	}

	@Transactional
	@Override
	public String updateCatalog(CatalogTO to) {
		// TODO Auto-generated method stub
		return null;
	}

	@Transactional
	@Override
	public String updateCatalogToDelete(String cdid) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
