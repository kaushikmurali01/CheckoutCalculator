package org;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

public class ProductManagement 
{
	
	private ArrayList<Product> products;
	
	public ArrayList<Product> getProducts() {
		return products;
	}

	public void setProducts(ArrayList<Product> products) {
		this.products = products;
	}
	
	@SuppressWarnings("unchecked")
	public void addProduct(Product product,HttpSession session)
	{
		products =  (ArrayList<Product>)session.getAttribute("PRODUCTS");
		products.add(product);
		session.removeAttribute("PRODUCTS");
		session.setAttribute("PRODUCTS", products);
	}
	
	public void removeProduct(Product product)
	{
		products.remove(product);
		
	}
	
	@SuppressWarnings("unchecked")
	public void initList(HttpSession session) {
		ArrayList<Product> myProducts =  (ArrayList<Product>)session.getAttribute("PRODUCTS");
		if(myProducts == null) {
			products = new ArrayList<Product>();
			products.add(new Product(101,"TV Samsung 28 Inch",200));
			products.add(new Product(101,"TV Samsung 28 Inch",1200.00));
			products.add(new Product(102,"TV Lenovo 32 Inch",1290.00));
			products.add(new Product(103,"TV TCL 26 Inch",900.00));
			products.add(new Product(104,"TV Sony 28 Inch",1000.00));
			products.add(new Product(105,"Laptop Accer icor7",900.00));
			session.setAttribute("PRODUCTS",products);
			
		}else {
			products =  myProducts;
		}
	}
	
	
	

}
