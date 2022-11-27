package com.jewelry.sale.domain;

import com.jewelry.common.domain.CommonTO;

public class SaleTO extends CommonTO {

	private String searchstore;
	private String searchsaletype;
	private String searchmaterial;
	private Long searchcustomer;
	
	private Long[] sale_no_arr;
	private String[] sale_type_arr;
	
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
	
	
}
