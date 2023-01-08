package com.jewelry.cms.auth.domain;

import com.jewelry.common.domain.CommonTO;

public class AuthMenuTO extends CommonTO {

	private String user_id;
	private String menu_id;
	private String access_auth;
	private String write_auth;
	private String view_auth;
	private String modify_auth;
	private String remove_auth;
	
	private Integer menu_depth;
	
	private String[] menuIdArr;
	private String[] accessAuthArr;
	private String[] writeAuthArr;
	private String[] viewAuthArr;
	private String[] modifyAuthArr;
	private String[] removeAuthArr;

	public AuthMenuTO() {}

	public AuthMenuTO(String userId) {
		this.user_id = userId;
	}
	
	public AuthMenuTO(String userId, String menuId) {
		this(userId);
		this.menu_id = menuId;
	}
	
	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getMenu_id() {
		return menu_id;
	}

	public void setMenu_id(String menu_id) {
		this.menu_id = menu_id;
	}

	public String getAccess_auth() {
		return access_auth;
	}

	public void setAccess_auth(String access_auth) {
		this.access_auth = access_auth;
	}

	public String getWrite_auth() {
		return write_auth;
	}

	public void setWrite_auth(String write_auth) {
		this.write_auth = write_auth;
	}

	public String getView_auth() {
		return view_auth;
	}

	public void setView_auth(String view_auth) {
		this.view_auth = view_auth;
	}

	public String getModify_auth() {
		return modify_auth;
	}

	public void setModify_auth(String modify_auth) {
		this.modify_auth = modify_auth;
	}

	public String getRemove_auth() {
		return remove_auth;
	}

	public void setRemove_auth(String remove_auth) {
		this.remove_auth = remove_auth;
	}

	public String[] getMenuIdArr() {
		return menuIdArr;
	}

	public void setMenuIdArr(String[] menuIdArr) {
		this.menuIdArr = menuIdArr;
	}

	public Integer getMenu_depth() {
		return menu_depth;
	}

	public void setMenu_depth(Integer menu_depth) {
		this.menu_depth = menu_depth;
	}

	public String[] getAccessAuthArr() {
		return accessAuthArr;
	}

	public void setAccessAuthArr(String[] accessAuthArr) {
		this.accessAuthArr = accessAuthArr;
	}

	public String[] getWriteAuthArr() {
		return writeAuthArr;
	}

	public void setWriteAuthArr(String[] writeAuthArr) {
		this.writeAuthArr = writeAuthArr;
	}

	public String[] getViewAuthArr() {
		return viewAuthArr;
	}

	public void setViewAuthArr(String[] viewAuthArr) {
		this.viewAuthArr = viewAuthArr;
	}

	public String[] getModifyAuthArr() {
		return modifyAuthArr;
	}

	public void setModifyAuthArr(String[] modifyAuthArr) {
		this.modifyAuthArr = modifyAuthArr;
	}

	public String[] getRemoveAuthArr() {
		return removeAuthArr;
	}

	public void setRemoveAuthArr(String[] removeAuthArr) {
		this.removeAuthArr = removeAuthArr;
	}
	
}
