package com.talos.utrend.core.product;

import de.hybris.platform.core.model.product.ProductModel;
import de.hybris.platform.product.ProductService;

import java.util.List;


public interface UtrendProductService extends ProductService
{
	/**
	 * Obtains all the existing products.
	 *
	 * @return a list of all the products in the system
	 */
	List<ProductModel> getAllProducts();
}
