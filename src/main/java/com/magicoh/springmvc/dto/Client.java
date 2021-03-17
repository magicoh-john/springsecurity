package com.magicoh.springmvc.dto;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString	//(exclude={"제외할 값"})
public class Client {

	private int client_id = 0;  		
	private String client_name = "";	
	private String address = "";    	
	private String postal_code = "";	
	private String phone = "";      	
	private String fax = "";        	
	private String email = "";			
	private int is_active = 0;			
	
	
/*	
	public Client() {
	}
	
	public Client(int client_id, String client_name, String address, String postal_code, String phone, String fax,
			String email, int is_active) {
		this.client_id = client_id;
		this.client_name = client_name;
		this.address = address;
		this.postal_code = postal_code;
		this.phone = phone;
		this.fax = fax;
		this.email = email;
		this.is_active = is_active;
	}
	public int getClient_id() {
		return client_id;
	}
	public void setClient_id(int client_id) {
		this.client_id = client_id;
	}
	public String getClient_name() {
		return client_name;
	}
	public void setClient_name(String client_name) {
		this.client_name = client_name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPostal_code() {
		return postal_code;
	}
	public void setPostal_code(String postal_code) {
		this.postal_code = postal_code;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getIs_active() {
		return is_active;
	}
	public void setIs_active(int is_active) {
		this.is_active = is_active;
	}
	
*/	
}
