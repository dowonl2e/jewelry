package com.jewelry.repair.domain;

import org.springframework.web.multipart.MultipartFile;

import com.jewelry.common.domain.CommonTO;

public class RepairTO extends CommonTO {
	
	private Long repair_no;
	private String repair_nm;
	private String repair_req_dt;
	private String repair_due_dt;
	private String repair_res_dt;
	private String repair_desc;
	
	private Long customer_no;
	private String customer_nm;
	private String customer_cel;

	private String del_yn;
	
	private MultipartFile repairfile;
	
	private Long[] repair_no_arr;
	
	public RepairTO() {
		setRecordcount(16);
	}

	public Long getRepair_no() {
		return repair_no;
	}

	public void setRepair_no(Long repair_no) {
		this.repair_no = repair_no;
	}

	public String getRepair_nm() {
		return repair_nm;
	}

	public void setRepair_nm(String repair_nm) {
		this.repair_nm = repair_nm;
	}
	
	public String getRepair_req_dt() {
		return repair_req_dt;
	}

	public void setRepair_req_dt(String repair_req_dt) {
		this.repair_req_dt = repair_req_dt;
	}
	
	public String getRepair_res_dt() {
		return repair_res_dt;
	}

	public void setRepair_res_dt(String repair_res_dt) {
		this.repair_res_dt = repair_res_dt;
	}

	public String getRepair_desc() {
		return repair_desc;
	}

	public void setRepair_desc(String repair_desc) {
		this.repair_desc = repair_desc;
	}

	public String getDel_yn() {
		return del_yn;
	}

	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}

	public MultipartFile getRepairfile() {
		return repairfile;
	}

	public void setRepairfile(MultipartFile repairfile) {
		this.repairfile = repairfile;
	}

	public Long[] getRepair_no_arr() {
		return repair_no_arr;
	}

	public void setRepair_no_arr(Long[] repair_no_arr) {
		this.repair_no_arr = repair_no_arr;
	}

	public Long getCustomer_no() {
		return customer_no;
	}

	public void setCustomer_no(Long customer_no) {
		this.customer_no = customer_no;
	}

	public String getCustomer_nm() {
		return customer_nm;
	}

	public void setCustomer_nm(String customer_nm) {
		this.customer_nm = customer_nm;
	}

	public String getCustomer_cel() {
		return customer_cel;
	}

	public void setCustomer_cel(String customer_cel) {
		this.customer_cel = customer_cel;
	}

	public String getRepair_due_dt() {
		return repair_due_dt;
	}

	public void setRepair_due_dt(String repair_due_dt) {
		this.repair_due_dt = repair_due_dt;
	}
	
	
}


