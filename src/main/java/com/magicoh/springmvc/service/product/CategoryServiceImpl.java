package com.magicoh.springmvc.service.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.magicoh.springmvc.dao.IProductMapperDao;
import com.magicoh.springmvc.dto.Category;
import com.magicoh.springmvc.dto.Client;

@Service//("IBbsService")
public class CategoryServiceImpl implements ICategoryService
{
	@Autowired
	private IProductMapperDao bbsMapper;

	@Override
	public List<Category> getCategoryList()
	{
		List<Category> bbsList = bbsMapper.selectCategoryList();
		return bbsList;
	}

	@Override
	public List<Category> getCategorysByName(Category category) {
		List<Category> categoryList = bbsMapper.selectCategorysByName(category);
		return categoryList;
	}

	@Override
	public List<Category> getCategorysByName2(String category_name) {
		List<Category> categoryList = bbsMapper.selectCategorysByName2(category_name);
		return categoryList;
	}

	
	@Override
	public Category getCategory(int category_id)
	{
		Category dto = bbsMapper.selectCategory(category_id);
		return dto;
	}

	@Override
	public void insertCategory(Category category)
	{
		bbsMapper.insertCategory(category);
	}

	@Override
	public void updateCategory(Category category)
	{
		bbsMapper.updateCategory(category);
	}

	@Override
	public void deleteCategory(int category_id)
	{
		bbsMapper.deleteCategory(category_id);
	}


	
	
}
