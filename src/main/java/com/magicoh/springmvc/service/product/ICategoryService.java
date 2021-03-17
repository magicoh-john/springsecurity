package com.magicoh.springmvc.service.product;


import java.util.List;

import com.magicoh.springmvc.dto.Category;
import com.magicoh.springmvc.dto.Client;

public interface ICategoryService
{
	public List<Category> getCategoryList() ;
	public List<Category> getCategorysByName(Category category);
	public List<Category> getCategorysByName2(String category_name);
	public Category getCategory(int category_id);
	public void insertCategory(Category category);
	public void updateCategory(Category category);
	public void deleteCategory(int category_id);
}
