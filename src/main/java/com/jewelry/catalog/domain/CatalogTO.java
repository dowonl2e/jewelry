package com.jewelry.catalog.domain;

import org.springframework.web.multipart.MultipartFile;

import com.jewelry.common.domain.CommonTO;

public class CatalogTO extends CommonTO {
	
	private Long catalog_no;
	private Long vender_no;
	private String model_id;
	private String model_nm;
	private String stdd_material_cd;
	private String stdd_weight;
	private String stdd_color_cd;
	private String stdd_size;
	private String odr_notice;
	private String reg_dt;
	private Integer basic_idst;
	private Integer main_price;
	private Integer sub_price;
	private Integer total_price;
	private String del_yn;
		
	private Integer searchvender;
	
	private Long[] catalog_no_arr;
	private String[] stone_type_cd_arr;
	private String[] stone_nm_arr;
	private Integer[] bead_cnt_arr;
	private String[] purchase_price_arr;
	private String[] stone_desc_arr;
	
	private MultipartFile catalogfile;
	
	public CatalogTO() {
		setRecordcount(16);
	}
	
	public Long getCatalog_no() {
		return catalog_no;
	}
	public void setCatalog_no(Long catalog_no) {
		this.catalog_no = catalog_no;
	}
	public Long getVender_no() {
		return vender_no;
	}
	public void setVender_no(Long vender_no) {
		this.vender_no = vender_no;
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
	public String getStdd_weight() {
		return stdd_weight;
	}
	public void setStdd_weight(String stdd_weight) {
		this.stdd_weight = stdd_weight;
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
	public Integer getSearchvender() {
		return searchvender;
	}
	public void setSearchvender(Integer searchvender) {
		this.searchvender = searchvender;
	}
	public Long[] getCatalog_no_arr() {
		return catalog_no_arr;
	}
	public void setCatalog_no_arr(Long[] catalog_no_arr) {
		this.catalog_no_arr = catalog_no_arr;
	}
	public String[] getStone_type_cd_arr() {
		return stone_type_cd_arr;
	}
	public void setStone_type_cd_arr(String[] stone_type_cd_arr) {
		this.stone_type_cd_arr = stone_type_cd_arr;
	}
	public String[] getStone_nm_arr() {
		return stone_nm_arr;
	}
	public void setStone_nm_arr(String[] stone_nm_arr) {
		this.stone_nm_arr = stone_nm_arr;
	}
	public Integer[] getBead_cnt_arr() {
		return bead_cnt_arr;
	}
	public void setBead_cnt_arr(Integer[] bead_cnt_arr) {
		this.bead_cnt_arr = bead_cnt_arr;
	}
	public String[] getPurchase_price_arr() {
		return purchase_price_arr;
	}
	public void setPurchase_price_arr(String[] purchase_price_arr) {
		this.purchase_price_arr = purchase_price_arr;
	}
	public String[] getStone_desc_arr() {
		return stone_desc_arr;
	}
	public void setStone_desc_arr(String[] stone_desc_arr) {
		this.stone_desc_arr = stone_desc_arr;
	}
	public MultipartFile getCatalogfile() {
		return catalogfile;
	}
	public void setCatalogfile(MultipartFile catalogfile) {
		this.catalogfile = catalogfile;
	}
	public String getStdd_color_cd() {
		return stdd_color_cd;
	}
	public void setStdd_color_cd(String stdd_color_cd) {
		this.stdd_color_cd = stdd_color_cd;
	}
	public Integer getBasic_idst() {
		return basic_idst;
	}

	public void setBasic_idst(Integer basic_idst) {
		this.basic_idst = basic_idst;
	}

	public Integer getMain_price() {
		return main_price;
	}

	public void setMain_price(Integer main_price) {
		this.main_price = main_price;
	}

	public Integer getSub_price() {
		return sub_price;
	}

	public void setSub_price(Integer sub_price) {
		this.sub_price = sub_price;
	}

	public Integer getTotal_price() {
		return total_price;
	}

	public void setTotal_price(Integer total_price) {
		this.total_price = total_price;
	}
}
