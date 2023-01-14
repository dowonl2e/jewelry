package com.jewelry.cash.domain;

import com.jewelry.common.domain.CommonTO;

public class CashTO extends CommonTO {
	
	private Long cash_no;
	private String reg_dt;
	private String store_cd;
	private String cash_type_cd;
	private String cash_type_cd2;
	private String bankbook_cd;
	private Long vender_no;
	private String vender_nm;
	private String history_desc;
	private String material_cd;
	private Double weight_gram;
	private Integer quantity;
	private Integer unit_price;
	
	private Long[] cash_no_arr;
	
	private String searchstore;
	private String searchcashtype;
	private String searchcashtype2;
	private String searchbankbook;
	private String searchmaterial;
	private String today;
	private String yesterday;
	private String befYesterday;
	
	private String[] cash_type_cd_arr;
	private String[] cash_type_cd2_arr;
	private String[] bankbook_cd_arr;
	private String[] vender_nm_arr;
	private String[] history_desc_arr;
	private String[] material_cd_arr;
	private Double[] weight_gram_arr;
	private Integer[] quantity_arr;
	private Integer[] unit_price_arr;
	
	public Long getCash_no() {
		return cash_no;
	}

	public void setCash_no(Long cash_no) {
		this.cash_no = cash_no;
	}

	public String getReg_dt() {
		return reg_dt;
	}

	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}

	public String getStore_cd() {
		return store_cd;
	}

	public void setStore_cd(String store_cd) {
		this.store_cd = store_cd;
	}

	public String getCash_type_cd() {
		return cash_type_cd;
	}

	public void setCash_type_cd(String cash_type_cd) {
		this.cash_type_cd = cash_type_cd;
	}

	public String getCash_type_cd2() {
		return cash_type_cd2;
	}

	public void setCash_type_cd2(String cash_type_cd2) {
		this.cash_type_cd2 = cash_type_cd2;
	}
	
	public String getBankbook_cd() {
		return bankbook_cd;
	}

	public void setBankbook_cd(String bankbook_cd) {
		this.bankbook_cd = bankbook_cd;
	}

	public Long getVender_no() {
		return vender_no;
	}

	public void setVender_no(Long vender_no) {
		this.vender_no = vender_no;
	}

	public String getVender_nm() {
		return vender_nm;
	}

	public void setVender_nm(String vender_nm) {
		this.vender_nm = vender_nm;
	}

	public String getHistory_desc() {
		return history_desc;
	}

	public void setHistory_desc(String history_desc) {
		this.history_desc = history_desc;
	}

	public String getMaterial_cd() {
		return material_cd;
	}

	public void setMaterial_cd(String material_cd) {
		this.material_cd = material_cd;
	}

	public Double getWeight_gram() {
		return weight_gram;
	}

	public void setWeight_gram(Double weight_gram) {
		this.weight_gram = weight_gram;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Integer getUnit_price() {
		return unit_price;
	}

	public void setUnit_price(Integer unit_price) {
		this.unit_price = unit_price;
	}

	public Long[] getCash_no_arr() {
		return cash_no_arr;
	}

	public void setCash_no_arr(Long[] cash_no_arr) {
		this.cash_no_arr = cash_no_arr;
	}

	public String getSearchstore() {
		return searchstore;
	}

	public void setSearchstore(String searchstore) {
		this.searchstore = searchstore;
	}

	public String getSearchcashtype() {
		return searchcashtype;
	}

	public void setSearchcashtype(String searchcashtype) {
		this.searchcashtype = searchcashtype;
	}

	public String getSearchcashtype2() {
		return searchcashtype2;
	}

	public void setSearchcashtype2(String searchcashtype2) {
		this.searchcashtype2 = searchcashtype2;
	}

	public String getSearchbankbook() {
		return searchbankbook;
	}

	public void setSearchbankbook(String searchbankbook) {
		this.searchbankbook = searchbankbook;
	}

	public String getSearchmaterial() {
		return searchmaterial;
	}

	public void setSearchmaterial(String searchmaterial) {
		this.searchmaterial = searchmaterial;
	}

	public String[] getCash_type_cd_arr() {
		return cash_type_cd_arr;
	}

	public void setCash_type_cd_arr(String[] cash_type_cd_arr) {
		this.cash_type_cd_arr = cash_type_cd_arr;
	}

	public String[] getCash_type_cd2_arr() {
		return cash_type_cd2_arr;
	}

	public void setCash_type_cd2_arr(String[] cash_type_cd2_arr) {
		this.cash_type_cd2_arr = cash_type_cd2_arr;
	}

	public String[] getBankbook_cd_arr() {
		return bankbook_cd_arr;
	}

	public void setBankbook_cd_arr(String[] bankbook_cd_arr) {
		this.bankbook_cd_arr = bankbook_cd_arr;
	}

	public String[] getVender_nm_arr() {
		return vender_nm_arr;
	}

	public void setVender_nm_arr(String[] vender_nm_arr) {
		this.vender_nm_arr = vender_nm_arr;
	}

	public String[] getHistory_desc_arr() {
		return history_desc_arr;
	}

	public void setHistory_desc_arr(String[] history_desc_arr) {
		this.history_desc_arr = history_desc_arr;
	}

	public String[] getMaterial_cd_arr() {
		return material_cd_arr;
	}

	public void setMaterial_cd_arr(String[] material_cd_arr) {
		this.material_cd_arr = material_cd_arr;
	}

	public Double[] getWeight_gram_arr() {
		return weight_gram_arr;
	}

	public void setWeight_gram_arr(Double[] weight_gram_arr) {
		this.weight_gram_arr = weight_gram_arr;
	}

	public Integer[] getQuantity_arr() {
		return quantity_arr;
	}

	public void setQuantity_arr(Integer[] quantity_arr) {
		this.quantity_arr = quantity_arr;
	}

	public Integer[] getUnit_price_arr() {
		return unit_price_arr;
	}

	public void setUnit_price_arr(Integer[] unit_price_arr) {
		this.unit_price_arr = unit_price_arr;
	}

	public String getToday() {
		return today;
	}

	public void setToday(String today) {
		this.today = today;
	}

	public String getYesterday() {
		return yesterday;
	}

	public void setYesterday(String yesterday) {
		this.yesterday = yesterday;
	}

	public String getBefYesterday() {
		return befYesterday;
	}

	public void setBefYesterday(String befYesterday) {
		this.befYesterday = befYesterday;
	}

	
}
