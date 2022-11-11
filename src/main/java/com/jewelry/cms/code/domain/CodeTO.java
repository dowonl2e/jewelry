package com.jewelry.cms.code.domain;

import com.jewelry.common.domain.CommonTO;

public class CodeTO extends CommonTO {

	private String cd_id;
	private String cd_nm;
	private Integer cd_ord;
	private String up_cd_id;
	private Integer cd_depth;
	private String use_yn;
	
	private String[] up_cd_id_arr;
	
	public String getCd_id() {
		return cd_id;
	}
	public void setCd_id(String cd_id) {
		this.cd_id = cd_id;
	}
	public String getCd_nm() {
		return cd_nm;
	}
	public void setCd_nm(String cd_nm) {
		this.cd_nm = cd_nm;
	}
	public Integer getCd_ord() {
		return cd_ord;
	}
	public void setCd_ord(Integer cd_ord) {
		this.cd_ord = cd_ord;
	}
	public String getUp_cd_id() {
		return up_cd_id;
	}
	public void setUp_cd_id(String up_cd_id) {
		this.up_cd_id = up_cd_id;
	}
	public Integer getCd_depth() {
		return cd_depth;
	}
	public void setCd_depth(Integer cd_depth) {
		this.cd_depth = cd_depth;
	}
	public String getUse_yn() {
		return use_yn;
	}
	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
	}
	public String[] getUp_cd_id_arr() {
		return up_cd_id_arr;
	}
	public void setUp_cd_id_arr(String[] up_cd_id_arr) {
		this.up_cd_id_arr = up_cd_id_arr;
	}
	
}
