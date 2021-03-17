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
public class InvoiceDetail {

	private Integer invoice_detail_id;   	
	private Integer invoice_id;   	
	private Integer product_id;   		
	private String product_name;   		
	private double unit_price;   	
	private Integer quantity;     		
	private double total_amt;    	
	private Date created_date; 		
	private Date modified_date;		
	
	/*
	public InvoiceDetail() {
	}

	public Integer getInvoice_detail_id() {
		return invoice_detail_id;
	}

	public void setInvoice_detail_id(Integer invoice_detail_id) {
		this.invoice_detail_id = invoice_detail_id;
	}

	public Integer getInvoice_id() {
		return invoice_id;
	}

	public void setInvoice_id(Integer invoice_id) {
		this.invoice_id = invoice_id;
	}

	public Integer getProduct_id() {
		return product_id;
	}

	public void setProduct_id(Integer product_id) {
		this.product_id = product_id;
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

	public double getTotal_amt() {
		return total_amt;
	}

	public void setTotal_amt(double total_amt) {
		this.total_amt = total_amt;
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

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	@Override
	public String toString() {
		return "InvoiceDetail [invoice_detail_id=" + invoice_detail_id + ", invoice_id=" + invoice_id + ", product_id="
				+ product_id + ", product_name=" + product_name + ", unit_price=" + unit_price + ", quantity="
				+ quantity + ", total_amt=" + total_amt + ", created_date=" + created_date + ", modified_date="
				+ modified_date + "]";
	}

	*/
}
