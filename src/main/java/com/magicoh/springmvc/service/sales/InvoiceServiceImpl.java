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
			//1. 현재 인보이스 Max 추출 + 1 => 다음 인보이스 ID
			int maxInvoiceId = bbsMappger.getMaxInvoiceId();
			int invoice_id = maxInvoiceId + 1;	//seq.nextval
			
			log.info("######### InvoiceServiceImpl > insertInvoice > 트랜잭션 insertInvoiceHeader Start ##############");
			
			//2. 인보이스 헤더 저장
			invoiceHeader.setInvoice_id(invoice_id);	//set invoiceId
			result = bbsMappger.insertInvoiceHeader(invoiceHeader);
			
			//3. 인보이스 디테일 저장 
			if(result > 0) {
				List<InvoiceDetail> invoiceDetails = invoiceHeader.getInvoiceDetails();
				//3-1. 모든 행에 인보이스 ID 세팅
				for(InvoiceDetail detail : invoiceDetails){
					detail.setInvoice_id(invoice_id);
					//detail.setInvoice_id(1000);
				}
				
				//Exception >> RuntimeException >> MyBatisSystemException 의도적 발생
				//invoiceDetails = null;
				
				//3-2. 인보이스 디테일 저장
				bbsMappger.insertInvoiceDetailsMulti(invoiceDetails);
				
				data = true;			
			}

			//throw new SQLException();	//강제 Exception 발생
			
			log.info("######### InvoiceServiceImpl > insertInvoice > 트랜잭션 insertInvoiceDetailsMulti End ##############");
	
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
		
		//1. 헤더 저장
		status_header = bbsMappger.updateInvoiceHeader(invoiceHeader);
		if(status_header > 0) {
			//2. 디테일 저장 준비(수정된행 추가된행 분리처리)
			List<InvoiceDetail> updatedRows = new ArrayList<InvoiceDetail>();
			List<InvoiceDetail> addedRows = new ArrayList<InvoiceDetail>();
			for(InvoiceDetail id : invoiceHeader.getInvoiceDetails()) {
				//2-1. 수정된 행 분리
				if(id.getInvoice_detail_id() != null) {
					 updatedRows.add(id);
				}else {	//2-2. 추가된 행 분리
					addedRows.add(id);
				}
			}
			
			//3. 수정된 행 update 
			if(updatedRows.size() > 0) {
				bbsMappger.updateInvoiceDetailsMulti(updatedRows);
			}
			
			//4. 추가된 행 insert(수정된 행이 없어도 추가된 행은 처리해야)
			if(addedRows.size() > 0) {
				bbsMappger.insertInvoiceDetailsMulti(addedRows);
			}
			status = true;
		}
		
		return status;
	}
}
