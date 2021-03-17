package com.magicoh.springmvc.dao;

import java.util.List;

import com.magicoh.springmvc.dto.Category;
import com.magicoh.springmvc.dto.Client;
import com.magicoh.springmvc.dto.InvoiceDetail;
import com.magicoh.springmvc.dto.InvoiceHeader;
import com.magicoh.springmvc.dto.InvoiceCommonDto;
import com.magicoh.springmvc.dto.Product;
import com.magicoh.springmvc.dto.QnaBbs;

/**
 * Use mapper interFace setting in application-contex.xml
 * **/
@MyMapper 
public interface IQnaBbsMapperDao
{
	public List<QnaBbs> selectQnaBbsList();
}
