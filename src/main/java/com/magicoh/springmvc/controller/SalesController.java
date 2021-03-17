package com.magicoh.springmvc.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.magicoh.springmvc.dto.Category;
import com.magicoh.springmvc.dto.Client;
import com.magicoh.springmvc.dto.InvoiceDetail;
import com.magicoh.springmvc.dto.InvoiceHeader;
import com.magicoh.springmvc.dto.InvoiceCommonDto;
import com.magicoh.springmvc.dto.Product;
import com.magicoh.springmvc.dto.User;
import com.magicoh.springmvc.service.product.ICategoryService;
import com.magicoh.springmvc.service.product.IClientService;
import com.magicoh.springmvc.service.product.IProductService;
import com.magicoh.springmvc.service.sales.IInvoiceService;
import com.magicoh.springmvc.service.sales.InvoiceServiceImpl;

import lombok.extern.slf4j.Slf4j;

@Controller//("/sales")
@Slf4j
public class SalesController {
	@Autowired
	private IInvoiceService invoiceService;
	
	@Autowired
	private IClientService clientService;
	
	@Autowired
	private ICategoryService categoryService;
	
	@Autowired
	private IProductService productService;

	
	/***************************************
	 *카테고리 등록/조회/수정/삭제
	 **************************************/
	
	//select all invoice list
	@RequestMapping(value = "/sales/invoice_list", method = RequestMethod.GET)
	public String getInvoiceList(Model model) throws Exception
	{
		List<InvoiceCommonDto> invoiceList = invoiceService.getInvoiceList();
		
		// default setting invoice date from ~ to 
		SimpleDateFormat format1 = new SimpleDateFormat ("yyyy-MM-dd");
		Date today = new Date();
		String strToday = format1.format(today);
		
		model.addAttribute("invoice_date_from", strToday);
		model.addAttribute("invoice_date_to", strToday);		
		model.addAttribute("invoiceList", invoiceList);
		
		return "/sales/invoice_list";
	}

	//[invoice list] searching through ajax 
	@ResponseBody
	@RequestMapping(value = "/sales/invoice_list_search", method = RequestMethod.POST)
	public List<InvoiceCommonDto> getProductListSearch(Model model, @RequestBody InvoiceCommonDto InvoiceCommonDto)
	{
		List<InvoiceCommonDto> invoiceList = invoiceService.getInvoiceListByCon(InvoiceCommonDto);
		model.addAttribute("invoiceList", invoiceList);
		return invoiceList;
	}	
	
	
	//invoice insert form
	@RequestMapping(value = "/sales/invoice_insertform", method = RequestMethod.GET)
	public ModelAndView invoiceInsertForm(Model model)
	{
		//initialize insert from
		List<Category> categoryList = categoryService.getCategoryList(); //Category
		List<Client> clientList = clientService.getClientList(); //Client
		List<Product> productList = productService.getProductList(); //product

		//InvoiceHeader invoiceHeader = invoiceService.getInvoiceHeader(invoice_id);
		
		//setting invoice date today 
		SimpleDateFormat format1 = new SimpleDateFormat ("yyyy-MM-dd");
		Date today = new Date();
		String strToday = format1.format(today);
		
		int invoice_id = 0; //dummy invoice id 
		List<InvoiceCommonDto> invoiceDetailList = invoiceService.getInvoiceDetail(invoice_id);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("categoryList", categoryList);
		map.put("clientList", clientList);
		map.put("productList", productList);
		map.put("invoice_date", strToday);
		//map.put("invoiceHeader", new InvoiceHeader());
		map.put("invoiceDetailList", invoiceDetailList);

		return new ModelAndView("/sales/invoice_insertform", "map", map);
	}
	
	//Save Invoice
	//@Transactional
	@ResponseBody
	@RequestMapping(value = "/sales/invoice_insert", method = RequestMethod.POST)
	public String insertInvoice(@RequestBody InvoiceHeader invoiceHeader, HttpSession session) throws SQLException //throws SQLException
	{
		String  data = "fail";;
		
		if(invoiceHeader != null)
		{
			//1. 화면에서 넘어온 정보를 service에 전달
			try {
				data = invoiceService.insertInvoice(invoiceHeader) == true ? "success" : "fail";
			} catch (Exception e) {
				throw new RuntimeException();
			}
			
		}
		return data;		
	}

	//Invoice update form
	@RequestMapping(value = "/sales/invoice_updateform", method = RequestMethod.GET)
	public ModelAndView invoiceUpdateForm(@RequestParam(value="invoice_id", defaultValue="0") int invoice_id, Model model)
	{
		List<Client> clientList = clientService.getClientList(); //Client

		//setting invoice date today 
		SimpleDateFormat format1 = new SimpleDateFormat ("yyyy-MM-dd");
		Date today = new Date();
		String strToday = format1.format(today);

		/**
		 * get one invoice header for update
		 * InvoiceHeader에는 거래처명 필드가 없기 때문에 InvoiceCommonDto 사용
		 */
		InvoiceCommonDto invoiceHeader = invoiceService.getInvoiceHeader(invoice_id);
		
		/**
		 * get invoice detail list
		 * InvoiceHeader에는 제품명 필드가 없기 때문에 InvoiceCommonDto 사용
		 */
		List<InvoiceCommonDto> invoiceDetailList = invoiceService.getInvoiceDetail(invoice_id);

		Map<String, Object> map = new HashMap<String, Object>();
		//map.put("productList", productList);
		map.put("clientList", clientList);
		map.put("invoice_date", strToday);
		map.put("invoiceHeader", invoiceHeader);
		map.put("invoiceDetailList", invoiceDetailList);

		return new ModelAndView("/sales/invoice_updateform", "map", map);
	}	
	
	//Save Invoice
	//@Transactional
	@ResponseBody
	@RequestMapping(value = "/sales/invoice_update", method = RequestMethod.POST)
	public Boolean updateInvoice(@RequestBody InvoiceHeader invoiceHeader, HttpSession session)
	{
		//result of processing
		boolean data = false ;
		
		if(invoiceHeader != null)
		{
			int invoice_id = invoiceHeader.getInvoice_id();
			
			//1. 기존 정보 가져오기 
			//get invoice header
			InvoiceHeader oldHeader = invoiceService.getInvoiceHeaderForUpdate(invoice_id);
			InvoiceHeader newHeader = new InvoiceHeader();
			newHeader = oldHeader ;		//불러온 값을 새로 객체에 Assign

			//2. 화면에서 넘어온 헤더 데이터를 저장할 객체에 세팅
			newHeader.setInvoice_date(invoiceHeader.getInvoice_date());
			newHeader.setDescription(invoiceHeader.getDescription());
			newHeader.setClient_id(invoiceHeader.getClient_id());
			newHeader.setTotal_amt(invoiceHeader.getTotal_amt());
			// 2-1 화면에서 넘어온 invoice details setting
			newHeader.setInvoiceDetails(invoiceHeader.getInvoiceDetails());
			
			//3. 세팅된 헤더(디테일)정보를 service로 전달
			data = invoiceService.updateInvoiceHeader(newHeader);
		}
		return data;
	}
	
	
	
	//used invoice insert form screen
	@RequestMapping(value = "/sales/product_modal", method = RequestMethod.GET)
	public String getProductList(ModelMap model, @RequestParam(value="pageNum", defaultValue="1") String pageNum, 
												@RequestParam("product_name") String product_name, 
												@RequestParam("parentsLowNo") String parentsLowNo) throws Exception
	{
		List<Product> productList = productService.getProductsByName(product_name);
		//System.out.println("조회 게시물  건수 : " + productList.size());
		model.addAttribute("productList", productList);
		model.addAttribute("parentsLowNo", parentsLowNo);
		
		return "/shared/product_modal";
	}

	//used invoice list screen
	@RequestMapping(value = "/sales/product_modal_general", method = RequestMethod.GET)
	public String getProductListGeneral(ModelMap model, @RequestParam(value="product_name", required = false) String product_name) throws Exception
	{
		List<Product> productList = productService.getProductsByName(product_name);
		System.out.println("조회 게시물 건수 : sales/product_modal_general " + productList.size());
		model.addAttribute("productList", productList);
		
		return "/shared/product_modal_general";
	}

	//modal search in a product modal general
	@ResponseBody
	@RequestMapping(value = "/sales/product_modal_search_general", method = RequestMethod.GET)
	public List<Product> getProductListSearchGeneral(ModelMap model, @RequestParam("product_name") String product_name) throws Exception
	{
		List<Product> productList = productService.getProductsByName(product_name);
		System.out.println("product_modal_search_general 모달 내 검색된 결과수(POST) : " + productList.size());
		model.addAttribute("productList", productList);
	
		return productList;
	}	

	//modal search in a product modal
	@ResponseBody
	@RequestMapping(value = "/product_modal_search", method = RequestMethod.GET)
	public List<Product> getProductListInModal(ModelMap model, @RequestParam("product_name") String product_name) throws Exception
	{
		//System.out.println("getProductListInModal product_name : " + product_name);
		List<Product> productList = productService.getProductsByName(product_name);
		//System.out.println("모달 내 검색된 결과수(POST) : " + productList.size());
		model.addAttribute("productList", productList);
	
		return productList;
	}	
	
	//[client modal] called from parent screen 
	@RequestMapping(value = "/sales/client_modal", method = RequestMethod.GET)
	public String getClientList(ModelMap model, @RequestParam(value="pageNum", defaultValue="1") String pageNum, 
												@RequestParam("client_name") String client_name) throws Exception
	{
		//넘어온 검색어 + 페이지 번호로 원하는 게시물 얻어온다.
		
		List<Client> clientList = clientService.getClientsByName(client_name);
		//System.out.println("검색된 거래처  건수(GET) : " + clientList.size());
		model.addAttribute("clientList", clientList);
		
		return "/shared/client_modal";
	}
	
	//[client modal] search in a client modal
	@ResponseBody
	@RequestMapping(value = "/client_modal_search", method = RequestMethod.GET)
	public List<Client> getClientListInModal(ModelMap model, @RequestParam("client_name") String client_name) throws Exception
	{
		//System.out.println("Param : client_name : " + client_name);
		List<Client> clientList = clientService.getClientsByName(client_name);
		//System.out.println("모달 내 검색된 결과수(POST) : " + clientList.size());
		model.addAttribute("clientList", clientList);
	
		return clientList;
	}
	
	//[category modal] when called for the first time
	@RequestMapping(value = "/sales/category_modal", method = RequestMethod.GET)
	public String getCategoryList(ModelMap model, @RequestParam("category_name") String category_name) throws Exception
	{
		List<Category> categoryList = categoryService.getCategorysByName2(category_name);
		model.addAttribute("categoryList", categoryList);
		return "/shared/category_modal";
	}
	
	//[category modal] when search in a category modal 
	@ResponseBody
	@RequestMapping(value = "/sales/category_modal_search", method = RequestMethod.POST)
	public List<Category> getCategoryListInModal(ModelMap model, @RequestBody Category category) throws Exception
	{
		List<Category> categoryList = categoryService.getCategorysByName(category);
		return categoryList;
	}


//	@ExceptionHandler(RuntimeException.class)
//	public String exceptionHandler(Model model, Exception e) {
//		log.info("SalesController 에서 exception 처리 : " + e.getMessage());
//		model.addAttribute("exception", e);
//		return "error/exception";
//
//	}

}
