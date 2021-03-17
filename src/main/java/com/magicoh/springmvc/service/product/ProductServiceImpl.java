package com.magicoh.springmvc.service.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.magicoh.springmvc.controller.error.NotFoundException;
import com.magicoh.springmvc.dao.IProductMapperDao;
import com.magicoh.springmvc.dto.Product;

import lombok.extern.slf4j.Slf4j;

@Service
//@Service("IProductService")
@Slf4j
public class ProductServiceImpl implements IProductService
{
	@Autowired
	private IProductMapperDao mapperDao;

	@Override
	public List<Product> getProductList()
	{
		List<Product> productList = mapperDao.selectProductList();
		return productList;
	}

	@Override
	public List<Product> getProductsByName(String product_name)
	{
		List<Product> productList = mapperDao.selectProductsByName(product_name);
		return productList;
	}
	
	@Override
	public List<Product> getProductsByName2(Product product) {
		
		List<Product> productList = mapperDao.selectProductsByName2(product);

		return productList;
	}

	@Override
	public Product getProduct(int product_id)
	{
		Product product = mapperDao.selectProduct(product_id);
		return product;
	}

	@Override
	public void insertProduct(Product product) 
	{
		//try {
			mapperDao.insertProduct(product);
		//}catch(RuntimeException e) {
		//	throw new NotFoundException();
		//}
	}

	@Override
	public void updateProduct(Product product)
	{
		mapperDao.updateProduct(product);
	}

	@Override
	public void deleteProduct(int product_id)
	{
		mapperDao.deleteProduct(product_id);
	}

}
