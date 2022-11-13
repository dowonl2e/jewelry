package com.jewelry.cms.code.domain;

import java.util.List;

import com.jewelry.common.domain.CommonVO;

public class CodeVO extends CommonVO {
	
	private List<CodeVO> list;
	private String cdid;
	private String cdnm;
	private String cdord;
	private String upcdid;
	private Integer cddepth;
	private String useyn;
	
	private Integer childcnt;
	
	public CodeVO(String cdid, String cdnm) {
		this.cdid = cdid;
		this.cdnm = cdnm;
	}
	
	public List<CodeVO> getList() {
		return list;
	}
	public void setList(List<CodeVO> list) {
		this.list = list;
	}
	public String getCdid() {
		return cdid;
	}
	public void setCdid(String cdid) {
		this.cdid = cdid;
	}
	public String getCdnm() {
		return cdnm;
	}
	public void setCdnm(String cdnm) {
		this.cdnm = cdnm;
	}
	public String getCdord() {
		return cdord;
	}
	public void setCdord(String cdord) {
		this.cdord = cdord;
	}
	public String getUpcdid() {
		return upcdid;
	}
	public void setUpcdid(String upcdid) {
		this.upcdid = upcdid;
	}
	public String getUseyn() {
		return useyn;
	}
	public void setUseyn(String useyn) {
		this.useyn = useyn;
	}
	public Integer getCddepth() {
		return cddepth;
	}
	public void setCddepth(Integer cddepth) {
		this.cddepth = cddepth;
	}
	public Integer getChildcnt() {
		return childcnt;
	}
	public void setChildcnt(Integer childcnt) {
		this.childcnt = childcnt;
	}
	
	
}
