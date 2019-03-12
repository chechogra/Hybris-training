package com.talos.utrend.core.product.dao;

import de.hybris.platform.core.model.product.ProductModel;
import de.hybris.platform.product.daos.ProductDao;

import java.util.List;


public interface UtrendProductDao extends ProductDao
{
	/**
	 * Finds all the existing products.
	 *
	 * @return a list of all the products in the system
	 */
	List<ProductModel> findAllProducts();
}
