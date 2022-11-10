package com.jewelry.catalog.domain;

import com.jewelry.common.domain.CommonTO;

public class CatalogTO extends CommonTO {
	
	private Long catalog_no;
	private Long vender_id;
	private String model_id;
	private String model_nm;
	private String stdd_material_cd;
	private String stdd_weight_cd;
	private String stdd_size;
	private String odr_notice;
	private String reg_dt;
	private String del_yn;
	
	private String searchvenderid;
	
	public Long getCatalog_no() {
		return catalog_no;
	}
	public void setCatalog_no(Long catalog_no) {
		this.catalog_no = catalog_no;
	}
	public Long getVender_id() {
		return vender_id;
	}
	public void setVender_id(Long vender_id) {
		this.vender_id = vender_id;
	}
	public String getModel_id() {
		return model_id;
	}
	public void setModel_id(String model_id) {
		this.model_id = model_id;
	}
	public String getModel_nm() {
		return model_nm;
	}
	public void setModel_nm(String model_nm) {
		this.model_nm = model_nm;
	}
	public String getStdd_material_cd() {
		return stdd_material_cd;
	}
	public void setStdd_material_cd(String stdd_material_cd) {
		this.stdd_material_cd = stdd_material_cd;
	}
	public String getStdd_weight_cd() {
		return stdd_weight_cd;
	}
	public void setStdd_weight_cd(String stdd_weight_cd) {
		this.stdd_weight_cd = stdd_weight_cd;
	}
	public String getStdd_size() {
		return stdd_size;
	}
	public void setStdd_size(String stdd_size) {
		this.stdd_size = stdd_size;
	}
	public String getOdr_notice() {
		return odr_notice;
	}
	public void setOdr_notice(String odr_notice) {
		this.odr_notice = odr_notice;
	}
	public String getReg_dt() {
		return reg_dt;
	}
	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}
	public String getDel_yn() {
		return del_yn;
	}
	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}
	public String getSearchvenderid() {
		return searchvenderid;
	}
	public void setSearchvenderid(String searchvenderid) {
		this.searchvenderid = searchvenderid;
	}
	
	
	
}
