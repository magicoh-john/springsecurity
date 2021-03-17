package com.magicoh.springmvc.dto;

import java.util.Date;

public class InvoiceCommonResult {

	//invoiceHeader
	private Integer invoice_id;   
	private Integer client_id; 
	private String client_name;			//not database column
	private Date invoice_date;
	private String shipping_address;
	private double total_amt; 
	private String description; 
	private Date created_date;
	private Date modified_date;	
	
	//invoiceDetail
	private Integer invoice_detail_id; 
	private Integer product_id;   		
	private String product_name; //not database table column
	private double unit_price;   	
	private Integer quantity;  
	private double sub_total_amt;       	
	
	public InvoiceCommonResult() {
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

	@Override
	public String toString() {
		return "InvoiceCommonResult [invoice_id=" + invoice_id + ", client_id=" + client_id + ", client_name="
				+ client_name + ", invoice_date=" + invoice_date + ", shipping_address=" + shipping_address
				+ ", total_amt=" + total_amt + ", description=" + description + ", created_date=" + created_date
				+ ", modified_date=" + modified_date + ", invoice_detail_id=" + invoice_detail_id + ", product_id="
				+ product_id + ", product_name=" + product_name + ", unit_price=" + unit_price + ", quantity="
				+ quantity + ", sub_total_amt=" + sub_total_amt + "]";
	}


}
