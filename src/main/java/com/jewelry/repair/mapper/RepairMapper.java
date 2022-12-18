package com.jewelry.repair.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jewelry.repair.domain.RepairTO;
import com.jewelry.repair.domain.RepairVO;

@Mapper
public interface RepairMapper {
	
	int selectRepairListCount(RepairTO to);
	
	List<RepairVO> selectRepairList(RepairTO to);
	
	RepairVO selectRepair(Long repairno);
	
	int insertRepair(RepairTO to);
	
	int updateRepair(RepairTO to);
	
	int updateRepairToDelete(RepairTO to);
	
	int updateRepairsToDelete(RepairTO to);
	
	int updateRepairsToComplete(RepairTO to);
	
	int selectCustomerRepairListCount(RepairTO to);
	
	List<RepairVO> selectCustomerRepairList(RepairTO to);

}
