package org;

import static org.junit.Assert.*;

import java.util.ArrayList;

import org.junit.Test;

public class ProductManagementTest extends ProductManagement {

	@Test
	public void test() {
		Product p = new Product(1, "apple", 5.0);
		ProductManagement pm = new ProductManagement();
		ArrayList<Product> products = new ArrayList<Product>();
		products.add(p);
		pm.setProducts(products);
		assert(pm.getProducts().size()==1);
	}

}
