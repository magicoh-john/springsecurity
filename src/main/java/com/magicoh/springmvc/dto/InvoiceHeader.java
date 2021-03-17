package com.magicoh.springmvc.dto;

import java.sql.Date;
import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString//(exclude={"product_name"})
public class InvoiceHeader {

	private Integer invoice_id;      	
	private Integer client_id;       		
	private Date invoice_date;       		
	private String shipping_address;	
	private double total_amt;       	
	private String description;    
	private Date created_date;   
	private Date modified_date;	
	
	private List<InvoiceDetail> invoiceDetails;
	
	/*
	public InvoiceHeader() {
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

	public void setClient_id(Integer client_id) {
		this.client_id = client_id;
	}

	public Date getInvoice_date() {
		return invoice_date;
	}

	public void setInvoice_date(Date invoice_date) {
		this.invoice_date = invoice_date;
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

	public List<InvoiceDetail> getInvoiceDetails() {
		return invoiceDetails;
	}

	public void setInvoiceDetails(List<InvoiceDetail> invoiceDetails) {
		this.invoiceDetails = invoiceDetails;
	}

//	public String getInvoice_date_from() {
//		return invoice_date_from;
//	}
//
//	public void setInvoice_date_from(String invoice_date_from) {
//		this.invoice_date_from = invoice_date_from;
//	}
//
//	public String getInvoice_date_to() {
//		return invoice_date_to;
//	}
//
//	public void setInvoice_date_to(String invoice_date_to) {
//		this.invoice_date_to = invoice_date_to;
//	}

	@Override
	public String toString() {
		return "InvoiceHeader [invoice_id=" + invoice_id + ", client_id=" + client_id + ", invoice_date=" + invoice_date
				+ ", shipping_address=" + shipping_address + ", total_amt=" + total_amt + ", description=" + description
				+ ", created_date=" + created_date + ", modified_date=" + modified_date + ", invoiceDetails="
				+ invoiceDetails + "]";
	}

	*/
}
