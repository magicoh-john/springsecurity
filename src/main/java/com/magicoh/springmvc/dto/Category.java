package com.magicoh.springmvc.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString	//(exclude={"제외할 값"})
public class Category {

	private int category_id;	
	private String category_name;
	private String description;
	private int is_active;		
	
/*	
	public Category() {
	}
	
	public Category(int category_id, String category_name, String description, int is_active) {
		this.category_id = category_id;
		this.category_name = category_name;
		this.description = description;
		this.is_active = is_active;
	}
	
	public int getCategory_id() {
		return category_id;
	}
	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getIs_active() {
		return is_active;
	}
	public void setIs_active(int is_active) {
		this.is_active = is_active;
	}	
	
*/	
}
