package com.magicoh.springmvc.service.sales;


import java.sql.SQLException;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.magicoh.springmvc.dto.InvoiceDetail;
import com.magicoh.springmvc.dto.InvoiceHeader;
import com.magicoh.springmvc.dto.InvoiceCommonDto;

//@Transactional
public interface IInvoiceService
{
	public List<InvoiceCommonDto> getInvoiceList();
	public List<InvoiceCommonDto> getInvoiceListByCon(InvoiceCommonDto invoiceCommonResult);
	public List<InvoiceCommonDto> getInvoiceDetail(int invoice_id);
	public InvoiceCommonDto getInvoiceHeader(int invoice_no);
	public Boolean insertInvoice(InvoiceHeader invoiceHeader) throws Exception;
	public void insertInvoiceDetail(InvoiceDetail invoiceDetail);
	//public int getMaxInvoiceId();
	public InvoiceHeader getInvoiceHeaderForUpdate(int invoice_id);
	public boolean updateInvoiceHeader(InvoiceHeader invoiceHeader);
}
