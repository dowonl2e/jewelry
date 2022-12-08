package com.jewelry.user.domain;

import com.jewelry.common.domain.CommonTO;

public class UserTO extends CommonTO {

	private String user_id;
	private String user_pwd;
	private String user_name;
	private String user_role;
	private String email;
	private String celnum;
	private String gender;
	private String use_yn;
	private String inpt_id;
	private String inpt_dt;
	private String updt_id;
	private String updt_dt;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pwd() {
		return user_pwd;
	}
	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_role() {
		return user_role;
	}
	public void setUser_role(String user_role) {
		this.user_role = user_role;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCelnum() {
		return celnum;
	}
	public void setCelnum(String celnum) {
		this.celnum = celnum;
	}
	public String getUse_yn() {
		return use_yn;
	}
	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
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
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
}
