package com.talos.utrend.core.product.impl;

import com.talos.utrend.core.product.UtrendProductDAO;
import de.hybris.platform.core.model.product.ProductModel;
import de.hybris.platform.product.daos.impl.DefaultProductDao;
import de.hybris.platform.servicelayer.search.SearchResult;

import java.util.List;


public class DefaultUtrendProductDAO extends DefaultProductDao implements UtrendProductDAO
{

	public DefaultUtrendProductDAO()
	{
		super(ProductModel._TYPECODE);
	}

	public List<ProductModel> getAllProducts()
	{
		SearchResult<ProductModel> searchResult =  getFlexibleSearchService()
				.search("select {pk} from {Product}");
		return searchResult.getResult();
	}
}
