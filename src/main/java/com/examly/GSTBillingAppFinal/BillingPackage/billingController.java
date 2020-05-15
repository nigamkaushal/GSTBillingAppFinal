package com.examly.GSTBillingAppFinal.BillingPackage;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.examly.GSTBillingAppFinal.ProductPackage.Product;
import com.examly.GSTBillingAppFinal.ProductPackage.productService;

@RestController
public class billingController {
	
	@Autowired
	private productService proService;
	
	@RequestMapping(value="home")
	public ModelAndView home() {
		return new ModelAndView("billingPage");
	}
	
	@GetMapping(value="getAllProducts", produces = MediaType.APPLICATION_JSON_VALUE)
	public List<Product> getProductByCode() {
		return proService.getAllProducts();
	}
	
}
