package com.magicoh.springmvc;

import static org.junit.Assert.*;

import org.apache.ibatis.session.SqlSession;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.magicoh.springmvc.dao.IProductMapperDao;
import com.magicoh.springmvc.dto.InvoiceHeader;

import lombok.extern.slf4j.Slf4j;

import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
        "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
        "file:src/main/webapp/WEB-INF/spring/application-context.xml"
      })
@WebAppConfiguration // Spring 4.3.x 이후로는 필히 첨부 !
@Slf4j
public class insertMapperTest {
	
	@Autowired
	SqlSession sqlSession;
	
	InvoiceHeader invoiceHeader;

	@Before
	public void setUp() throws Exception {
		//setting product receipt date today 

		java.sql.Date invoice_date = java.sql.Date.valueOf("2020-12-10");
		
		log.info("invoice_date.toString : " + invoice_date.toString());
		
		invoiceHeader = new InvoiceHeader();
		invoiceHeader.setInvoice_id(113);
		invoiceHeader.setClient_id(1);
		invoiceHeader.setInvoice_date(invoice_date);
		invoiceHeader.setShipping_address("shipping_address");
		invoiceHeader.setTotal_amt(30000);
		invoiceHeader.setDescription("description");
	}

	@Test
	@Transactional(propagation = Propagation.REQUIRED)
	@Rollback(false)	//스프링 차원의 강제 롤백 금지
	public void test() {
		sqlSession.getMapper(IProductMapperDao.class).insertInvoiceHeader(invoiceHeader);
	}

}
