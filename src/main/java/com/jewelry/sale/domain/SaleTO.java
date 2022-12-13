package com.jewelry.sale.domain;

import com.jewelry.common.domain.CommonTO;

public class SaleTO extends CommonTO {

	private String searchstore;
	private String searchsaletype;
	private String searchmaterial;
	private Long searchcustomer;
	
	private Long[] sale_no_arr;
	private String[] sale_type_arr;
	private String[] sale_arr;
	
	private Long customer_no;
	private String customer_nm;
	private String customer_cel;
	
	private String sale_dt;
	
	public String getSearchstore() {
		return searchstore;
	}
	public void setSearchstore(String searchstore) {
		this.searchstore = searchstore;
	}
	public String getSearchsaletype() {
		return searchsaletype;
	}
	public void setSearchsaletype(String searchsaletype) {
		this.searchsaletype = searchsaletype;
	}
	public String getSearchmaterial() {
		return searchmaterial;
	}
	public void setSearchmaterial(String searchmaterial) {
		this.searchmaterial = searchmaterial;
	}
	public Long getSearchcustomer() {
		return searchcustomer;
	}
	public void setSearchcustomer(Long searchcustomer) {
		this.searchcustomer = searchcustomer;
	}
	public Long[] getSale_no_arr() {
		return sale_no_arr;
	}
	public void setSale_no_arr(Long[] sale_no_arr) {
		this.sale_no_arr = sale_no_arr;
	}
	public String[] getSale_type_arr() {
		return sale_type_arr;
	}
	public void setSale_type_arr(String[] sale_type_arr) {
		this.sale_type_arr = sale_type_arr;
	}
	public String[] getSale_arr() {
		return sale_arr;
	}
	public void setSale_arr(String[] sale_arr) {
		this.sale_arr = sale_arr;
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
	public String getSale_dt() {
		return sale_dt;
	}
	public void setSale_dt(String sale_dt) {
		this.sale_dt = sale_dt;
	}
	
}
