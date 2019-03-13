package com.talos.utrend.core.product;

import de.hybris.platform.core.model.product.ProductModel;
import de.hybris.platform.product.daos.ProductDao;

import java.util.List;


public interface UtrendProductDAO extends ProductDao
{
	List<ProductModel> getAllProducts();
}
