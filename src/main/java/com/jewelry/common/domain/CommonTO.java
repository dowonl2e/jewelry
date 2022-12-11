package com.jewelry.common.domain;

import com.jewelry.common.paging.Pagination;

public class CommonTO extends Pagination {

	private String user_id;
	private String inpt_id;
	private String inpt_dt;
	private String updt_id;
	private String updt_dt;
	
	private String searchrecordcnt;
	private String searchtype;
	private String searchword;
	private String searchstdt;
	private String searcheddt;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getInpt_id() {
		return inpt_id;
	}
	public void setInpt_id(String inpt_id) {
		this.inpt_id = inpt_id;
	}
	public String getInpt_dt() {
		return inpt_dt;
	}
	public void setInpt_dt(String inpt_dt) {
		this.inpt_dt = inpt_dt;
	}
	public String getUpdt_id() {
		return updt_id;
	}
	public void setUpdt_id(String updt_id) {
		this.updt_id = updt_id;
	}
	public String getUpdt_dt() {
		return updt_dt;
	}
	public void setUpdt_dt(String updt_dt) {
		this.updt_dt = updt_dt;
	}
	public String getSearchtype() {
		return searchtype;
	}
	public void setSearchtype(String searchtype) {
		this.searchtype = searchtype;
	}
	public String getSearchword() {
		return searchword;
	}
	public void setSearchword(String searchword) {
		this.searchword = searchword;
	}
	public String getSearchstdt() {
		return searchstdt;
	}
	public void setSearchstdt(String searchstdt) {
		this.searchstdt = searchstdt;
	}
	public String getSearcheddt() {
		return searcheddt;
	}
	public void setSearcheddt(String searcheddt) {
		this.searcheddt = searcheddt;
	}
	public String getSearchrecordcnt() {
		return searchrecordcnt;
	}
	public void setSearchrecordcnt(String searchrecordcnt) {
		this.searchrecordcnt = searchrecordcnt;
		if(searchrecordcnt != null && searchrecordcnt.length() > 0) {
			System.out.println("333 : " + searchrecordcnt);
			setRecordcount(Integer.parseInt(searchrecordcnt));
		}
	}
	
	
}
