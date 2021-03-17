package com.magicoh.springmvc.dto;

import org.springframework.security.core.GrantedAuthority;

public class UserRole implements GrantedAuthority {

	private static final long serialVersionUID = 7464267597005842862L;
	
	private Integer user_role_id;
	private String user_id;
	private String role_id;
	
	@Override
	public String getAuthority() {
		return this.role_id;
	}
	
	public Integer getUser_role_id() {
		return user_role_id;
	}
	public void setUser_role_id(Integer user_role_id) {
		this.user_role_id = user_role_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getRole_id() {
		return role_id;
	}
	public void setRole_id(String role_id) {
		this.role_id = role_id;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Role [user_role_id=" + user_role_id + ", user_id=" + user_id + ", role_id=" + role_id + "]";
	}
}