package com.jewelry.repair.domain;

import java.util.List;

import com.jewelry.common.domain.CommonVO;
import com.jewelry.file.domain.FileVO;

public class RepairVO extends CommonVO {

	private Long repairno;
	private String repairnm;
	private String repairreqdt;
	private String repairduedt;
	private String repairresdt;
	private String repairdesc;
	private String delyn;

	private Long customerno;
	private String customernm;
	private String customercel;
	
	private String filepath;
	private String originnm;
	private String filenm;
	
	private List<RepairVO> list;
	private List<FileVO> filelist;
	
	public Long getRepairno() {
		return repairno;
	}

	public void setRepairno(Long repairno) {
		this.repairno = repairno;
	}

	public String getRepairnm() {
		return repairnm;
	}

	public void setRepairnm(String repairnm) {
		this.repairnm = repairnm;
	}

	public String getRepairreqdt() {
		return repairreqdt;
	}

	public void setRepairreqdt(String repairreqdt) {
		this.repairreqdt = repairreqdt;
	}

	public String getRepairresdt() {
		return repairresdt;
	}

	public void setRepairresdt(String repairresdt) {
		this.repairresdt = repairresdt;
	}

	public String getRepairdesc() {
		return repairdesc;
	}

	public void setRepairdesc(String repairdesc) {
		this.repairdesc = repairdesc;
	}

	public String getDelyn() {
		return delyn;
	}

	public void setDelyn(String delyn) {
		this.delyn = delyn;
	}

	public List<RepairVO> getList() {
		return list;
	}

	public void setList(List<RepairVO> list) {
		this.list = list;
	}

	public List<FileVO> getFilelist() {
		return filelist;
	}

	public void setFilelist(List<FileVO> filelist) {
		this.filelist = filelist;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	public String getOriginnm() {
		return originnm;
	}

	public void setOriginnm(String originnm) {
		this.originnm = originnm;
	}

	public String getFilenm() {
		return filenm;
	}

	public void setFilenm(String filenm) {
		this.filenm = filenm;
	}

	public Long getCustomerno() {
		return customerno;
	}

	public void setCustomerno(Long customerno) {
		this.customerno = customerno;
	}

	public String getCustomernm() {
		return customernm;
	}

	public void setCustomernm(String customernm) {
		this.customernm = customernm;
	}

	public String getCustomercel() {
		return customercel;
	}

	public void setCustomercel(String customercel) {
		this.customercel = customercel;
	}

	public String getRepairduedt() {
		return repairduedt;
	}

	public void setRepairduedt(String repairduedt) {
		this.repairduedt = repairduedt;
	}
	
}
