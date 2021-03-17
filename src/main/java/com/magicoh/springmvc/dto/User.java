package com.magicoh.springmvc.dto;

import java.sql.Date;

public class User {

	private int user_no;   
	private String user_id;   
	private String user_pw;
	private String user_name; 
	private String email;     
	private String phone;     
	private String fax;      
	private String zip_num;      
	private String address1;      
	private String address2;      
	private String dept_id;   
	private String role_id;   
	private String image_path;
	private int enabled;   
	private Date regdate;   
	
	public User() {
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getZip_num() {
		return zip_num;
	}

	public void setZip_num(String zip_num) {
		this.zip_num = zip_num;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getDept_id() {
		return dept_id;
	}

	public void setDept_id(String dept_id) {
		this.dept_id = dept_id;
	}

	public String getRole_id() {
		return role_id;
	}

	public void setRole_id(String role_id) {
		this.role_id = role_id;
	}

	public String getImage_path() {
		return image_path;
	}

	public void setImage_path(String image_path) {
		this.image_path = image_path;
	}

	public int getEnabled() {
		return enabled;
	}

	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "User [user_no=" + user_no + ", user_id=" + user_id + ", user_pw=" + user_pw + ", user_name=" + user_name
				+ ", email=" + email + ", phone=" + phone + ", fax=" + fax + ", zip_num=" + zip_num + ", address1="
				+ address1 + ", address2=" + address2 + ", dept_id=" + dept_id + ", role_id=" + role_id
				+ ", image_path=" + image_path + ", enabled=" + enabled + ", regdate=" + regdate + "]";
	}
		
}
