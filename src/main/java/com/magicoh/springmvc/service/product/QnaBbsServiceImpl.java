package com.magicoh.springmvc.service.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.magicoh.springmvc.dao.IProductMapperDao;
import com.magicoh.springmvc.dao.IQnaBbsMapperDao;
import com.magicoh.springmvc.dto.Product;
import com.magicoh.springmvc.dto.QnaBbs;

import lombok.extern.slf4j.Slf4j;

/**
 * =============================================
 * Mapper Interface Dao
 *=============================================
 */
@Service
@Slf4j
public class QnaBbsServiceImpl implements IQnaBbsService
{
	@Autowired
	private IQnaBbsMapperDao mapperDao;

	@Override
	public List<QnaBbs> getQnaBbsList() {
		List<QnaBbs> qnaBbsList = mapperDao.selectQnaBbsList();
		return qnaBbsList;

	}


}
