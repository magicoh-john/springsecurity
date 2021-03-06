package com.magicoh.springmvc.service.sales;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.magicoh.springmvc.dao.IProductMapperDao;
import com.magicoh.springmvc.dto.InvoiceDetail;
import com.magicoh.springmvc.dto.InvoiceHeader;

import lombok.extern.slf4j.Slf4j;

import com.magicoh.springmvc.dto.InvoiceCommonDto;

@Service
//@Service("IProductService")
@Slf4j
//@Transactional(propagation = Propagation.REQUIRED, rollbackFor = {RuntimeException.class, Exception.class})
public class InvoiceServiceImpl implements IInvoiceService
{
	@Autowired
	private IProductMapperDao bbsMappger;

	@Override
	public List<InvoiceCommonDto> getInvoiceList() {
		List<InvoiceCommonDto> invoiceListView = bbsMappger.getInvoiceList();
		return invoiceListView;
	}

	@Override
	public List<InvoiceCommonDto> getInvoiceListByCon(InvoiceCommonDto invoiceCommonResult) {
		List<InvoiceCommonDto> invoiceListView = bbsMappger.getInvoiceListByCon(invoiceCommonResult);
		return invoiceListView;
	}
	
	@Override
	public List<InvoiceCommonDto> getInvoiceDetail(int invoice_id)
	{
		List<InvoiceCommonDto> invoiceDetailList = bbsMappger.getInvoiceDetail(invoice_id);
		return invoiceDetailList;
	}

	@Override
	public void insertInvoiceDetail(InvoiceDetail invoiceDetail)
	{
		bbsMappger.insertInvoiceDetail(invoiceDetail);
	}

	
	@Override
	//@Transactional(rollbackFor = {RuntimeException.class, SQLException.class}, propagation = Propagation.REQUIRED)
	public Boolean insertInvoice(InvoiceHeader invoiceHeader) throws SQLException 
	{
		boolean data = false;
		int result = 0;
		
//		try {
			//1. ?????? ???????????? Max ?????? + 1 => ?????? ???????????? ID
			int maxInvoiceId = bbsMappger.getMaxInvoiceId();
			int invoice_id = maxInvoiceId + 1;	//seq.nextval
			
			log.info("######### InvoiceServiceImpl > insertInvoice > ???????????? insertInvoiceHeader Start ##############");
			
			//2. ???????????? ?????? ??????
			invoiceHeader.setInvoice_id(invoice_id);	//set invoiceId
			result = bbsMappger.insertInvoiceHeader(invoiceHeader);
			
			//3. ???????????? ????????? ?????? 
			if(result > 0) {
				List<InvoiceDetail> invoiceDetails = invoiceHeader.getInvoiceDetails();
				//3-1. ?????? ?????? ???????????? ID ??????
				for(InvoiceDetail detail : invoiceDetails){
					detail.setInvoice_id(invoice_id);
					//detail.setInvoice_id(1000);
				}
				
				//Exception >> RuntimeException >> MyBatisSystemException ????????? ??????
				//invoiceDetails = null;
				
				//3-2. ???????????? ????????? ??????
				bbsMappger.insertInvoiceDetailsMulti(invoiceDetails);
				
				data = true;			
			}

			//throw new SQLException();	//?????? Exception ??????
			
			log.info("######### InvoiceServiceImpl > insertInvoice > ???????????? insertInvoiceDetailsMulti End ##############");
	
//		}
//		catch(DataIntegrityViolationException e) {
//			log.info("InvoiceServiceImpl >> Exceptoin type getErrorCode/getMessage() : " + e.getMessage());
//			//TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
//			//throw e;
//			data = false;			
//		}
		return data;		
	}

	@Override
	public InvoiceCommonDto getInvoiceHeader(int invoice_no)
	{
		InvoiceCommonDto invoiceHeader = bbsMappger.selectInvoiceHeader(invoice_no);
		return invoiceHeader;
	}

	@Override
	public InvoiceHeader getInvoiceHeaderForUpdate(int invoice_id) {
		InvoiceHeader invoiceHeader = bbsMappger.getInvoiceHeaderForUpdate(invoice_id);
		return invoiceHeader;
	}

	@Override
	//@Transactional(propagation = Propagation.REQUIRED)
	public boolean updateInvoiceHeader(InvoiceHeader invoiceHeader) {
		boolean status = false;
		int status_header = 0;
		
		//1. ?????? ??????
		status_header = bbsMappger.updateInvoiceHeader(invoiceHeader);
		if(status_header > 0) {
			//2. ????????? ?????? ??????(???????????? ???????????? ????????????)
			List<InvoiceDetail> updatedRows = new ArrayList<InvoiceDetail>();
			List<InvoiceDetail> addedRows = new ArrayList<InvoiceDetail>();
			for(InvoiceDetail id : invoiceHeader.getInvoiceDetails()) {
				//2-1. ????????? ??? ??????
				if(id.getInvoice_detail_id() != null) {
					 updatedRows.add(id);
				}else {	//2-2. ????????? ??? ??????
					addedRows.add(id);
				}
			}
			
			//3. ????????? ??? update 
			if(updatedRows.size() > 0) {
				bbsMappger.updateInvoiceDetailsMulti(updatedRows);
			}
			
			//4. ????????? ??? insert(????????? ?????? ????????? ????????? ?????? ????????????)
			if(addedRows.size() > 0) {
				bbsMappger.insertInvoiceDetailsMulti(addedRows);
			}
			status = true;
		}
		
		return status;
	}
}
