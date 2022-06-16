package com.doglife.db;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.doglife.db.dto.CartDto;
import com.doglife.db.dto.ProductListDto;
import com.doglife.db.service.ShopService;

@Controller
public class ShopController {
	private static final Logger logger = LoggerFactory.getLogger(ShopController.class);

	@Autowired
	private ShopService shopServ;
	
	private ModelAndView mv;
	
	
	// ShopMainPage
	@GetMapping("toShopMain")
	public ModelAndView toShopMain(ProductListDto list, 
			HttpSession session) {
		logger.info("toShopMain()");
		
		//DB에서 게시글의 목록을 가져와서 페이지로 전달
		mv = shopServ.toShopMain(list, session);
		
		return mv;
	}
/*	
	// Shop Category Page
	@GetMapping("toProductList")
	public String toProductList() {
		logger.info("toProductList()");
		return "productList";
	}
*/	
	@GetMapping("/toProductList")
	public ModelAndView showProductList(ProductListDto list, 
			HttpSession session) {
		logger.info("showProductList()");
		
		//DB에서 게시글의 목록을 가져와서 페이지로 전달
		mv = shopServ.showProductList(list, session);
		
		return mv;
	}
	
	@GetMapping("/toCLothesList")
	public ModelAndView toCLothesList(ProductListDto list, 
			HttpSession session) {
		logger.info("toCLothesList()");
		
		//DB에서 게시글의 목록을 가져와서 페이지로 전달
		mv = shopServ.showClothesList(list, session);
		
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	@GetMapping("/productInfo")
	public ModelAndView showProductInfo(Integer pnum) {
		logger.info("showProductInfo() : pnum - " + pnum);
		
		mv = shopServ.showProductInfo(pnum);
				
		return mv;
	}
	
	@GetMapping("/toCart")
	public ModelAndView showCartList(String customerID) {
		logger.info("toCart()");
		
		//DB에서 게시글의 목록을 가져와서 페이지로 전달
		mv = shopServ.showCartList(customerID);
		
		return mv;
	}	
	

	
	
	
	
	
	
	
	

	
	
}
