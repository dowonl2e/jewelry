package com.jewelry.repair.service;

import java.util.Map;

import com.jewelry.repair.domain.RepairTO;
import com.jewelry.repair.domain.RepairVO;

public interface RepairService {

	Map<String, Object> findAllRepair(RepairTO to);
	
	RepairVO findRepair(Long repairno);
	
	String insertRepair(RepairTO to);
	
	String updateRepair(RepairTO to);
	
	String updateRepairToDelete(RepairTO to);
	
	String updateRepairsToDelete(RepairTO to);
	
	String updateRepairsToComplete(RepairTO to);

	Map<String, Object> findAllCustomerRepair(RepairTO to);

}
