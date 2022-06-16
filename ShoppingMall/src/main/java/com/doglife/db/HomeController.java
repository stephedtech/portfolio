package com.doglife.db;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


import com.doglife.db.service.ShopService;

@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private ShopService sServ;
	
	@GetMapping("/")
	public String home() {
		logger.info("home()");
		return "home";
	}
	
	@GetMapping("shoppinglist")
	public String shoppinglist() {
		logger.info("shoppinglist()");
		return "shoppinglist";
	}

	@GetMapping("toNew")
	public String toNew() {
		logger.info("toNew()");
		return "new";
	}
	@GetMapping("toNewCart")
	public String toNewCart() {
		logger.info("toNewCart()");
		return "newcart";
	}
	
	@GetMapping("CartPractice")
	public String CartPractice() {
		logger.info("CartPractice");
		return "CartPractice";
	}
/*	

	@GetMapping("toProductInfo")
	public String toProductInfo() {
		logger.info("toProductInfo()");
		return "productInfo";
	}
	@GetMapping("toProductList")
	public String toProductList() {
		logger.info("toProductList()");
		return "productList";
	}

*/
}
