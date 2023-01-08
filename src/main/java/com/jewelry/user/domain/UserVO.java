package com.jewelry.user.domain;

import java.util.List;

import com.jewelry.common.domain.CommonVO;

public class UserVO extends CommonVO {

	private List<UserVO> list;
	
	private String userid;
	private String userpwd;
	private String username;
	private String email;
	private String celnum;
	private String gender;
	private String userrole;
	private String useyn;
	private String inptid;
	private String inptdt;
	private String updtid;
	private String updtdt;
	
	public List<UserVO> getList() {
		return list;
	}
	public void setList(List<UserVO> list) {
		this.list = list;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpwd() {
		return userpwd;
	}
	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
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
	public String getUseyn() {
		return useyn;
	}
	public void setUseyn(String useyn) {
		this.useyn = useyn;
	}
	public String getInptid() {
		return inptid;
	}
	public void setInptid(String inptid) {
		this.inptid = inptid;
	}
	public String getInptdt() {
		return inptdt;
	}
	public void setInptdt(String inptdt) {
		this.inptdt = inptdt;
	}
	public String getUpdtid() {
		return updtid;
	}
	public void setUpdtid(String updtid) {
		this.updtid = updtid;
	}
	public String getUpdtdt() {
		return updtdt;
	}
	public void setUpdtdt(String updtdt) {
		this.updtdt = updtdt;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getUserrole() {
		return userrole;
	}
	public void setUserrole(String userrole) {
		this.userrole = userrole;
	}
}
