package com.magicoh.springmvc.controller;

import java.text.SimpleDateFormat;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
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
import com.magicoh.springmvc.dto.QnaBbs;
import com.magicoh.springmvc.service.product.ICategoryService;
import com.magicoh.springmvc.service.product.IProductService;
import com.magicoh.springmvc.service.product.IQnaBbsService;
import com.magicoh.springmvc.util.PageNavigator;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class BbsController
{
	@Autowired
	private IQnaBbsService qnaBbsService;
	
	/***************************************
	 * QnA[qna list] 
	 * 다른 개발자가 수정한 내용입니다.
	 * 개발자 여러분들은 이 내용을 본인의 로컬 저장소에 다운로드하세요.
	 **************************************/
	@RequestMapping(value = "/qna_list", method = RequestMethod.GET)
	public String getQnaList(Model model) throws Exception
	{
		List<QnaBbs> qnaBbsList = qnaBbsService.getQnaBbsList();
		
		model.addAttribute("qnaBbsList", qnaBbsList);
		
		return "/bbs/qnaBbs_list";
	}
	
	/**
	 * 예외테스트 @ControllerAdvice
	 * @param model
	 * @param e
	 * @return
	 */
	@RequestMapping(value = "/exceptionTest")
	public String test() throws SQLException {
		log.info("BbsController test() throw new IOException().......");
		//throw new IOException("occured IOException...");
		throw new SQLException("occured SQLException...");
	}
}
