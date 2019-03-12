package com.talos.utrend.core.product.impl;

import com.talos.utrend.core.product.UtrendProductService;
import com.talos.utrend.core.product.dao.UtrendProductDao;
import de.hybris.platform.core.model.product.ProductModel;
import de.hybris.platform.product.impl.DefaultProductService;
import org.springframework.beans.factory.annotation.Required;

import java.util.List;


public class DefaultUtrendProductService extends DefaultProductService implements UtrendProductService
{
	UtrendProductDao productDao;

	@Override
	public List<ProductModel> getAllProducts()
	{
		return getUtrendProductDao().findAllProducts();
	}


	public UtrendProductDao getUtrendProductDao()
	{
		return productDao;
	}

	@Required
	public void setUtrendProductDao(UtrendProductDao productDao)
	{
		this.productDao = productDao;
	}
}
