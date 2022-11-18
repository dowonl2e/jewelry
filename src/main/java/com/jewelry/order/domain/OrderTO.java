package com.jewelry.order.domain;

import org.springframework.web.multipart.MultipartFile;

import com.jewelry.common.domain.CommonTO;

public class OrderTO extends CommonTO {

	private Long order_no;
	private String store_cd;
	private String receipt_dt;
	private String expected_ord_dt;
	private Long customer_no;
	private String customer_nm;
	private String customer_cel;
	private String del_yn;

	private MultipartFile catalogfile;
	
	private String[] serial_id_arr;
	private Long[] catalog_no_arr;
	private Long[] vender_no_arr;
	private String[] material_cd_arr;
	private String[] color_cd_arr;
	private Integer[] quantity_arr;
	private String[] main_stone_type_arr;
	private String[] sub_stone_type_arr;
	private String[] size_arr;
	private String[] order_desc_arr;
	
	private String searchstore;
	private String searchmaterial;
	private String searchstartdate;
	private String searchendfate;
	private String searchstep;
	
	public MultipartFile getCatalogfile() {
		return catalogfile;
	}
	public void setCatalogfile(MultipartFile catalogfile) {
		this.catalogfile = catalogfile;
	}
	public Long getOrder_no() {
		return order_no;
	}
	public void setOrder_no(Long order_no) {
		this.order_no = order_no;
	}
	public String getStore_cd() {
		return store_cd;
	}
	public void setStore_cd(String store_cd) {
		this.store_cd = store_cd;
	}
	public String getReceipt_dt() {
		return receipt_dt;
	}
	public void setReceipt_dt(String receipt_dt) {
		this.receipt_dt = receipt_dt;
	}
	public String getExpected_ord_dt() {
		return expected_ord_dt;
	}
	public void setExpected_ord_dt(String expected_ord_dt) {
		this.expected_ord_dt = expected_ord_dt;
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
	public String getDel_yn() {
		return del_yn;
	}
	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}
	public String[] getSerial_id_arr() {
		return serial_id_arr;
	}
	public void setSerial_id_arr(String[] serial_id_arr) {
		this.serial_id_arr = serial_id_arr;
	}
	public Long[] getCatalog_no_arr() {
		return catalog_no_arr;
	}
	public void setCatalog_no_arr(Long[] catalog_no_arr) {
		this.catalog_no_arr = catalog_no_arr;
	}
	public Long[] getVender_no_arr() {
		return vender_no_arr;
	}
	public void setVender_no_arr(Long[] vender_no_arr) {
		this.vender_no_arr = vender_no_arr;
	}
	public String[] getMaterial_cd_arr() {
		return material_cd_arr;
	}
	public void setMaterial_cd_arr(String[] material_cd_arr) {
		this.material_cd_arr = material_cd_arr;
	}
	public String[] getColor_cd_arr() {
		return color_cd_arr;
	}
	public void setColor_cd_arr(String[] color_cd_arr) {
		this.color_cd_arr = color_cd_arr;
	}
	public Integer[] getQuantity_arr() {
		return quantity_arr;
	}
	public void setQuantity_arr(Integer[] quantity_arr) {
		this.quantity_arr = quantity_arr;
	}
	public String[] getMain_stone_type_arr() {
		return main_stone_type_arr;
	}
	public void setMain_stone_type_arr(String[] main_stone_type_arr) {
		this.main_stone_type_arr = main_stone_type_arr;
	}
	public String[] getSub_stone_type_arr() {
		return sub_stone_type_arr;
	}
	public void setSub_stone_type_arr(String[] sub_stone_type_arr) {
		this.sub_stone_type_arr = sub_stone_type_arr;
	}
	public String[] getSize_arr() {
		return size_arr;
	}
	public void setSize_arr(String[] size_arr) {
		this.size_arr = size_arr;
	}
	public String[] getOrder_desc_arr() {
		return order_desc_arr;
	}
	public void setOrder_desc_arr(String[] order_desc_arr) {
		this.order_desc_arr = order_desc_arr;
	}
	public String getSearchstore() {
		return searchstore;
	}
	public void setSearchstore(String searchstore) {
		this.searchstore = searchstore;
	}
	public String getSearchmaterial() {
		return searchmaterial;
	}
	public void setSearchmaterial(String searchmaterial) {
		this.searchmaterial = searchmaterial;
	}
	public String getSearchstartdate() {
		return searchstartdate;
	}
	public void setSearchstartdate(String searchstartdate) {
		this.searchstartdate = searchstartdate;
	}
	public String getSearchendfate() {
		return searchendfate;
	}
	public void setSearchendfate(String searchendfate) {
		this.searchendfate = searchendfate;
	}
	public String getSearchstep() {
		return searchstep;
	}
	public void setSearchstep(String searchstep) {
		this.searchstep = searchstep;
	}
}
