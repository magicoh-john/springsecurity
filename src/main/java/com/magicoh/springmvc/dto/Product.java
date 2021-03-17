package com.magicoh.springmvc.dto;
import java.io.Serializable;
import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
/****************************************************************
 * 
 * This is a Product Model Object
 * [1] temporary variables for the convenience of query work
 * [2] conversion of date type between Oracle and model object
 *     setReceipt_date_from(), setReceipt_date_to()
 * Created by : 
 * Date : 2020.11.04
 *   
 ****************************************************************/
@Getter
@Setter
@NoArgsConstructor
@ToString//(exclude={"product_name"})
public class Product implements Serializable{

	
	private static final long serialVersionUID = 8775250577999383759L;
	/**
	 * product id 
	 **/
	private int product_id;			
	/**
	 * product name 
	 * 
	 **/
	private String product_name;
	/**
	 * brand name 
	 **/
	private String brand;        	
	/**
	 * category id 
	 **/
	private int category_id; 		
	private String category_name;  	
	private String description;  	
	private double unit_price;   	
	private int is_active;	   	
	private Date receipt_date;	
	//[for query works] These two variables are temporary variables for the convenient query works.
	private String receipt_date_from;	   	
	private String receipt_date_to;	   	
	
	/*
	public Product() {
	}
	
	public Date getReceipt_date() {
		return receipt_date;
	}

	public void setReceipt_date(Date receipt_date) {
		this.receipt_date = receipt_date;
	}

	public String getReceipt_date_from() {
		return receipt_date_from;
	}

	public void setReceipt_date_from(String receipt_date_from) {
		this.receipt_date_from = receipt_date_from;	//.substring(0, 10);	//.replace("-", "");
	}

	public String getReceipt_date_to() {
		return receipt_date_to;
	}

	public void setReceipt_date_to(String receipt_date_to) {
		this.receipt_date_to = receipt_date_to;	//.substring(0, 10);	//.replace("-", "");;
	}

	public int getProduct_id() {
		return product_id;
	}


	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}


	public String getProduct_name() {
		return product_name;
	}


	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}


	public String getBrand() {
		return brand;
	}


	public void setBrand(String brand) {
		this.brand = brand;
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


	public double getUnit_price() {
		return unit_price;
	}


	public void setUnit_price(double unit_price) {
		this.unit_price = unit_price;
	}


	public int getIs_active() {
		return is_active;
	}


	public void setIs_active(int is_active) {
		this.is_active = is_active;
	}


	@Override
	public String toString() {
		return "Product [product_id=" + product_id + ", product_name=" + product_name + ", brand=" + brand
				+ ", category_id=" + category_id + ", category_name=" + category_name + ", description=" + description
				+ ", unit_price=" + unit_price + ", is_active=" + is_active + ", receipt_date=" + receipt_date
				+ ", receipt_date_from=" + receipt_date_from + ", receipt_date_to=" + receipt_date_to
				+ ", getReceipt_date()=" + getReceipt_date() + ", getReceipt_date_from()=" + getReceipt_date_from()
				+ ", getReceipt_date_to()=" + getReceipt_date_to() + ", getProduct_id()=" + getProduct_id()
				+ ", getProduct_name()=" + getProduct_name() + ", getBrand()=" + getBrand() + ", getCategory_id()="
				+ getCategory_id() + ", getCategory_name()=" + getCategory_name() + ", getDescription()="
				+ getDescription() + ", getUnit_price()=" + getUnit_price() + ", getIs_active()=" + getIs_active()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}

	*/
	
}
