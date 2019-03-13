package com.talos.utrend.facades.populators;

import de.hybris.platform.commercefacades.product.data.ProductData;
import de.hybris.platform.commerceservices.search.resultdata.SearchResultValueData;
import de.hybris.platform.converters.Populator;
import de.hybris.platform.servicelayer.dto.converter.ConversionException;


public class SearchUtrendCreationDatePopulator implements Populator<SearchResultValueData, ProductData>
{

	@Override
	public void populate(SearchResultValueData source, ProductData target) throws ConversionException
	{
		target.setUtrendStock(this.<Double>getValue(source, "utrendStock"));
	}

	protected <T> T getValue(final SearchResultValueData source, final String propertyName)
	{
		if (source.getValues() == null)
		{
			return null;
		}
		// DO NOT REMOVE the cast (T) below, while it should be unnecessary it is required by the javac compiler
		return (T) source.getValues().get(propertyName);
	}
}
