package com.examly.GSTBillingAppFinal.ProductPackage;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Product {
	
	@Id
	@Column(name = "product_code")
	private String product_code;

	@Column(name = "product_name")
	private String product_name;
	
	@Column(name = "product_price")
	private String product_price;
	
	@Column(name = "product_gst")
	private String product_gst;

	public String getProduct_code() {
		return product_code;
	}
	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_price() {
		return product_price;
	}
	public void setProduct_price(String product_price) {
		this.product_price = product_price;
	}
	public String getProduct_gst() {
		return product_gst;
	}
	public void setProduct_gst(String product_gst) {
		this.product_gst = product_gst;
	}
	@Override
	public String toString() {
		return "Product [product_code=" + product_code + ", product_name=" + product_name + ", product_price="
				+ product_price + ", product_gst=" + product_gst + "]";
	}
	public Product(String product_code, String product_name, String product_price, String product_gst) {
		super();
		this.product_code = product_code;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_gst = product_gst;
	}
	public Product() {
		this.product_code = "";
		this.product_name = "";
		this.product_price = "";
		this.product_gst = "";
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((product_code == null) ? 0 : product_code.hashCode());
		result = prime * result + ((product_gst == null) ? 0 : product_gst.hashCode());
		result = prime * result + ((product_name == null) ? 0 : product_name.hashCode());
		result = prime * result + ((product_price == null) ? 0 : product_price.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Product other = (Product) obj;
		if (product_code == null) {
			if (other.product_code != null)
				return false;
		} else if (!product_code.equals(other.product_code))
			return false;
		if (product_gst == null) {
			if (other.product_gst != null)
				return false;
		} else if (!product_gst.equals(other.product_gst))
			return false;
		if (product_name == null) {
			if (other.product_name != null)
				return false;
		} else if (!product_name.equals(other.product_name))
			return false;
		if (product_price == null) {
			if (other.product_price != null)
				return false;
		} else if (!product_price.equals(other.product_price))
			return false;
		return true;
	}
	
	
}
