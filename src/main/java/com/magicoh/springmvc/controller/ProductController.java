package com.magicoh.springmvc.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.magicoh.springmvc.dto.Category;
import com.magicoh.springmvc.dto.Client;
import com.magicoh.springmvc.dto.Product;
import com.magicoh.springmvc.service.product.ICategoryService;
import com.magicoh.springmvc.service.product.IProductService;
import com.magicoh.springmvc.util.PageNavigator;

@Controller	//("/product")
public class ProductController 
{
	@Autowired
	private ICategoryService categoryService;
	
	@Autowired
	private IProductService productService;

	@RequestMapping(value = {"/", "/home", "/index"}, method = RequestMethod.GET)
	public String home() 
	{
		return "home";
	}
	
	/***************************************
	 * Category
	 **************************************/
	
	@RequestMapping(value = "/product/category_list", method = RequestMethod.GET)
	public String getCategoryList(Model model) throws Exception
	{
		List<Category> categoryList = categoryService.getCategoryList();
		model.addAttribute("categoryList", categoryList);
		return "/product/category_list";
	}
	
	@RequestMapping(value = "/product/category_view", method = RequestMethod.GET)
	public ModelAndView getCategory(@RequestParam int category_id) 
	{
		Category category = categoryService.getCategory(category_id);
		return new ModelAndView("/product/category_view", "category", category);
	}
	
	@RequestMapping(value = "/product/category_insertform", method = RequestMethod.GET)
	public ModelAndView categoryInsertForm(Model model)
	{
		return new ModelAndView("/product/category_insertform");
	}

	@RequestMapping(value = "/product/category_insert", method = RequestMethod.POST)
	public String categoryInsert(@ModelAttribute Category category)
	{
		if(category != null)
		{
			categoryService.insertCategory(category);
		}
		return "redirect:category_list";
	}
	
	@RequestMapping(value = "/product/category_updateform", method = RequestMethod.GET)
	public ModelAndView categoryUpdateForm(@RequestParam int category_id)
	{
		Category category = categoryService.getCategory(category_id);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("category", category);
		return new ModelAndView("/product/category_updateform", "map", map);
	}
	
	@RequestMapping(value = "/product/category_update", method = RequestMethod.POST)
	public String categoryUpdate(@ModelAttribute Category category)
	{
		categoryService.updateCategory(category);
		return "redirect:category_list";
	}
	
	@RequestMapping(value = "/product/category_delete", method = RequestMethod.GET)
	public String categoryDelete(@RequestParam int category_id)
	{
		categoryService.deleteCategory(category_id);
		return "redirect:category_list";
	}
	
	//[category modal] when called from parent screen for the first time
	@RequestMapping(value = "/product/category_modal", method = RequestMethod.GET)
	public String getCategoryList(ModelMap model, @RequestParam("category_name") String category_name) throws Exception
	{
		List<Category> categoryList = categoryService.getCategorysByName2(category_name);
		model.addAttribute("categoryList", categoryList);
		return "/shared/category_modal";
	}
	
	//[category modal] when searching in a category modal 
	@ResponseBody
	@RequestMapping(value = "/product/category_modal_search", method = RequestMethod.POST)
	public List<Category> getCategoryListInModal(ModelMap model, @RequestBody Category category) throws Exception
	{
		List<Category> categoryList = categoryService.getCategorysByName(category);
		return categoryList;
	}
	
	
	
	/***************************************
	 * Product
	 **************************************/
	//[product list] searching when the screen is first opened.
	@RequestMapping(value = "/product/product_list", method = RequestMethod.GET)
	public String getProductList(Model model) throws Exception
	{
		List<Product> productList = productService.getProductList();
		
		//setting product receipt date today 
		SimpleDateFormat format1 = new SimpleDateFormat ("yyyy-MM-dd");
		Date today = new Date();
		String strToday = format1.format(today);
		
		model.addAttribute("receipt_date_from", strToday);
		model.addAttribute("receipt_date_to", strToday);
		model.addAttribute("productList", productList);
		
		return "/product/product_list";
	}
	
	//[product list] searching through ajax with various search conditions after the screen is first opened
	@ResponseBody
	@RequestMapping(value = "/product/product_list_search", method = RequestMethod.POST)
	public List<Product> getProductListSearch(Model model, @RequestBody Product product)
	{
		List<Product> productList = productService.getProductsByName2(product);
		model.addAttribute("productList", productList);
		return productList;
	}	
	
	//[product list] searching when the screen is first opened.
	@RequestMapping(value = "/product/product_list_datatable", method = RequestMethod.GET)
	public String getProductListDatatable(Model model) throws Exception
	{
		List<Product> productList = productService.getProductList();
		//setting product receipt date today 
		SimpleDateFormat format1 = new SimpleDateFormat ("yyyy-MM-dd");
		Date today = new Date();
		String strToday = format1.format(today);
		
		model.addAttribute("receipt_date_from", strToday);
		model.addAttribute("receipt_date_to", strToday);
		model.addAttribute("productList", productList);
		
		return "/product/product_list_datatable";
	}
	
	//[product list] searching through ajax with 
	@ResponseBody
	@RequestMapping(value = "/product/product_list_search_datatable", method = RequestMethod.POST)
	public List<Product> getProductListSearchDatatable(Model model, @RequestBody Product product)
	{
		List<Product> productList = productService.getProductsByName2(product);
		
		model.addAttribute("productList", productList);
		
		return productList;
	}	
	
	//product detail view
	@RequestMapping(value = "/product/product_view", method = RequestMethod.GET)
	public ModelAndView getProduct(@RequestParam int product_id) 
	{
		Product product = productService.getProduct(product_id);
		return new ModelAndView("/product/product_view", "product", product);
	}
	
	@RequestMapping(value = "/product/product_insertform", method = RequestMethod.GET)
	public ModelAndView productInsertForm(Model model)
	{
		List<Category> categoryList = categoryService.getCategoryList();
				
		//setting product receipt date today 
		SimpleDateFormat format1 = new SimpleDateFormat ("yyyy-MM-dd");
		Date today = new Date();
		String strToday = format1.format(today);
		
		model.addAttribute("receipt_date", strToday);
		
		return new ModelAndView("/product/product_insertform", "categoryList", categoryList);
	}

	
	@RequestMapping(value = "/product/product_insert", method = RequestMethod.POST)
	public String insertProduct(@ModelAttribute Product product) 
	{
		if(product != null)
		{
			productService.insertProduct(product);
		}
		return "redirect:product_list_datatable";
	}
	
	
	@RequestMapping(value = "/product/product_updateform", method = RequestMethod.GET)
	public ModelAndView updateForm(@RequestParam int product_id)
	{
		//get product info
		Product product = productService.getProduct(product_id);
				
		//get category info
		List<Category> categoryList = categoryService.getCategoryList();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("product", product);
		map.put("categoryList", categoryList);
		
		System.out.println(product.getUnit_price());
		
		return new ModelAndView("/product/product_updateform", "map", map);
	}

	@RequestMapping(value = "/product/product_update", method = RequestMethod.POST)
	public String productUpdate(@ModelAttribute Product product)
	{
		productService.updateProduct(product);
		
		return "redirect:product_list";
	}

	@RequestMapping(value = "/product/product_delete", method = RequestMethod.GET)
	public String productDelete(@ModelAttribute Product product)
	{
		productService.deleteProduct(product.getProduct_id());
		
		return "redirect:product_list";
	}
	
	public String handleExString(Exception e)
	{
		return "viewError";
	}
}
