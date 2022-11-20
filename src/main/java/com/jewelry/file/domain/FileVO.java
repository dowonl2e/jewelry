package com.jewelry.file.domain;

public class FileVO {
	
	private Long fileno;
	private Long refno;
	private String refinfo;
	private String filepath;
	private String originnm;
	private String filenm;
	private Integer fileord;
	private String fileext;
	private Long filesize;
	private String versionid;
	private String delyn;
	
	public Long getFileno() {
		return fileno;
	}
	public void setFileno(Long fileno) {
		this.fileno = fileno;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public String getOriginnm() {
		return originnm;
	}
	public void setOriginnm(String originnm) {
		this.originnm = originnm;
	}
	public String getFilenm() {
		return filenm;
	}
	public void setFilenm(String filenm) {
		this.filenm = filenm;
	}
	public Integer getFileord() {
		return fileord;
	}
	public void setFileord(Integer fileord) {
		this.fileord = fileord;
	}
	public String getFileext() {
		return fileext;
	}
	public void setFileext(String fileext) {
		this.fileext = fileext;
	}
	public Long getFilesize() {
		return filesize;
	}
	public void setFilesize(Long filesize) {
		this.filesize = filesize;
	}
	public String getVersionid() {
		return versionid;
	}
	public void setVersionid(String versionid) {
		this.versionid = versionid;
	}
	public Long getRefno() {
		return refno;
	}
	public void setRefno(Long refno) {
		this.refno = refno;
	}
	public String getRefinfo() {
		return refinfo;
	}
	public void setRefinfo(String refinfo) {
		this.refinfo = refinfo;
	}
	public String getDelyn() {
		return delyn;
	}
	public void setDelyn(String delyn) {
		this.delyn = delyn;
	}
	
}
