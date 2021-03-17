package com.magicoh.springmvc.dto;

public class UserSec {
	
	private String username;
	private String password;
	private int enabled;
	
	public UserSec() {}
	
	public UserSec(String username, String password, int enabled) {
		this.username = username;
		this.password = password;
		this.enabled = enabled;
	}

	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	
	@Override
	public String toString() {
		return String.format("Users [username=%s, password=%s, enabled=%s]", username, password, enabled);
	}
}
