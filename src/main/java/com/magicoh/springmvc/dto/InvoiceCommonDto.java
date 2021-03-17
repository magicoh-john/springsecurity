package com.magicoh.springmvc.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString//(exclude={"product_name"})
public class InvoiceCommonDto {

	//invoiceHeader
	private Integer invoice_id;   
	private Integer client_id; 
	private Date invoice_date;
	private String shipping_address;
	private double total_amt; 
	private String description; 
	private Date created_date;
	private Date modified_date;	
	
	//invoiceDetail
	private Integer invoice_detail_id; 
	private Integer product_id;   		
	private Integer category_id;   		
	private double unit_price;   	
	private Integer quantity;  
	private double sub_total_amt;       	
	
	//only data transfer
	private String product_name; 		//not database column
	private String client_name;			//not database column
	private String category_name;		//not database column
	private String invoice_date_from;	//not database column   	
	private String invoice_date_to;	  	//not database column
	
	/*
	public InvoiceCommonDto() {
	}

	public Integer getInvoice_id() {
		return invoice_id;
	}

	public void setInvoice_id(Integer invoice_id) {
		this.invoice_id = invoice_id;
	}

	public Integer getClient_id() {
		return client_id;
	}
	
	public Date getInvoice_date() {
		return invoice_date;
	}

	public void setInvoice_date(Date invoice_date) {
		this.invoice_date = invoice_date;
	}

	public void setClient_id(Integer client_id) {
		this.client_id = client_id;
	}

	public String getClient_name() {
		return client_name;
	}

	public void setClient_name(String client_name) {
		this.client_name = client_name;
	}

	public String getShipping_address() {
		return shipping_address;
	}

	public void setShipping_address(String shipping_address) {
		this.shipping_address = shipping_address;
	}

	public double getTotal_amt() {
		return total_amt;
	}

	public void setTotal_amt(double total_amt) {
		this.total_amt = total_amt;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getCreated_date() {
		return created_date;
	}

	public void setCreated_date(Date created_date) {
		this.created_date = created_date;
	}

	public Date getModified_date() {
		return modified_date;
	}

	public void setModified_date(Date modified_date) {
		this.modified_date = modified_date;
	}

	public Integer getInvoice_detail_id() {
		return invoice_detail_id;
	}

	public void setInvoice_detail_id(Integer invoice_detail_id) {
		this.invoice_detail_id = invoice_detail_id;
	}

	public Integer getProduct_id() {
		return product_id;
	}

	public void setProduct_id(Integer product_id) {
		this.product_id = product_id;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public double getUnit_price() {
		return unit_price;
	}

	public void setUnit_price(double unit_price) {
		this.unit_price = unit_price;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public double getSub_total_amt() {
		return sub_total_amt;
	}

	public void setSub_total_amt(double sub_total_amt) {
		this.sub_total_amt = sub_total_amt;
	}
	
	public Integer getCategory_id() {
		return category_id;
	}

	public void setCategory_id(Integer category_id) {
		this.category_id = category_id;
	}

	public String getCategory_name() {
		return category_name;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	
	public String getInvoice_date_from() {
		return invoice_date_from;
	}

	public void setInvoice_date_from(String invoice_date_from) {
		this.invoice_date_from = invoice_date_from;
	}

	public String getInvoice_date_to() {
		return invoice_date_to;
	}

	public void setInvoice_date_to(String invoice_date_to) {
		this.invoice_date_to = invoice_date_to;
	}
	*/
	
}
