package com.examly.GSTBillingAppFinal.ProductPackage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class productController {
	
	private ModelAndView mv;
	
	@Autowired
	private productService proService;
	
	@RequestMapping("productEntry")
	public ModelAndView home() {
		mv = new ModelAndView("productEntry","command", proService.getAllProducts());
//		System.out.println(proService.getProductByName("Laptop").toString());
		return mv;
	}
	
	@PostMapping(value="form1", params={"add=Add"})
	public ModelAndView addProduct(@ModelAttribute Product product) {
		proService.addProduct(product);
		mv = new ModelAndView("productEntry","command", proService.getAllProducts());
		return mv;
	}
	@PostMapping(value="form1", params={"update=Update"})
	public ModelAndView updateProduct(@ModelAttribute Product product) {
		proService.updateProduct(product);
		mv = new ModelAndView("productEntry","command", proService.getAllProducts());
		return mv;
	}
}
