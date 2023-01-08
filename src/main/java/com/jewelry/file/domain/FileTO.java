package com.jewelry.file.domain;

public class FileTO {

	private Long file_no;
	private Long ref_no;
	private String ref_info;
	private String file_path;
	private String origin_nm;
	private String file_nm;
	private Integer file_ord;
	private String file_ext;
	private Long file_size;
	private String version_id;
	private String del_yn;
	private String inpt_id;
	private String updt_id;
	
	public FileTO() {}
	
	public FileTO(Long ref_no, String ref_info) {
		this.ref_no = ref_no;
		this.ref_info = ref_info;
	}
	
	public FileTO(Long ref_no, String ref_info, Integer file_ord) {
		this(ref_no, ref_info);
		this.file_ord = file_ord;
	}
	
	public Long getFile_no() {
		return file_no;
	}
	public void setFile_no(Long file_no) {
		this.file_no = file_no;
	}
	public Long getRef_no() {
		return ref_no;
	}
	public void setRef_no(Long ref_no) {
		this.ref_no = ref_no;
	}
	public String getRef_info() {
		return ref_info;
	}
	public void setRef_info(String ref_info) {
		this.ref_info = ref_info;
	}
	public String getFile_path() {
		return file_path;
	}
	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}
	public String getOrigin_nm() {
		return origin_nm;
	}
	public void setOrigin_nm(String origin_nm) {
		this.origin_nm = origin_nm;
	}
	public String getFile_nm() {
		return file_nm;
	}
	public void setFile_nm(String file_nm) {
		this.file_nm = file_nm;
	}
	public Integer getFile_ord() {
		return file_ord;
	}
	public void setFile_ord(Integer file_ord) {
		this.file_ord = file_ord;
	}
	public String getFile_ext() {
		return file_ext;
	}
	public void setFile_ext(String file_ext) {
		this.file_ext = file_ext;
	}
	public Long getFile_size() {
		return file_size;
	}
	public void setFile_size(Long file_size) {
		this.file_size = file_size;
	}
	public String getDel_yn() {
		return del_yn;
	}
	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}
	public String getVersion_id() {
		return version_id;
	}
	public void setVersion_id(String version_id) {
		this.version_id = version_id;
	}
	public String getInpt_id() {
		return inpt_id;
	}
	public void setInpt_id(String inpt_id) {
		this.inpt_id = inpt_id;
	}
	public String getUpdt_id() {
		return updt_id;
	}
	public void setUpdt_id(String updt_id) {
		this.updt_id = updt_id;
	}
	
}
