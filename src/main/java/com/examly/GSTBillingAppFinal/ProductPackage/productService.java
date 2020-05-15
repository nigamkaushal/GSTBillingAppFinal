package com.examly.GSTBillingAppFinal.ProductPackage;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class productService {

	@Autowired
	private productRepo proRepo;
	
	public List<Product> getAllProducts(){
		List<Product> pro = new ArrayList<>();
		proRepo.findAll().forEach(pro::add);
		return pro;
	}
	
	public Product getProductByCode(String code){
		return proRepo.findById(code).orElse(new Product());
	}
	
	public Set<Product> getProductByName(String name){
		List<Product> temp = new ArrayList<>();
		Set<Product> pro = new HashSet<>();
		proRepo.findAll().forEach(temp::add);
		temp.stream().filter(t->t.getProduct_name().equals(name)).allMatch(pro::add);
		return pro;
	}
	
	public void addProduct(Product pro) {
		proRepo.save(pro);
	}
	
	public void updateProduct(Product pro) {
		proRepo.save(pro);
	}
	
}
