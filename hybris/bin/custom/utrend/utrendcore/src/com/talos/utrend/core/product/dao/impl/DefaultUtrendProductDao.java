package com.talos.utrend.core.product.dao.impl;

import com.talos.utrend.core.product.dao.UtrendProductDao;
import de.hybris.platform.core.model.product.ProductModel;
import de.hybris.platform.product.daos.impl.DefaultProductDao;
import de.hybris.platform.servicelayer.search.SearchResult;

import java.util.List;


public class DefaultUtrendProductDao extends DefaultProductDao implements UtrendProductDao
{
	private static final String FIND_ALL_PRODUCTS = "SELECT {" + ProductModel.PK + "} FROM {" + ProductModel._TYPECODE + "}";

	public DefaultUtrendProductDao(String typecode)
	{
		super(typecode);
	}

	@Override
	public List<ProductModel> findAllProducts()
	{
		SearchResult<ProductModel> result = getFlexibleSearchService().search(FIND_ALL_PRODUCTS);
		return result.getResult();
	}
}
