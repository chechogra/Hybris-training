package com.talos.utrend.facades.populators;

import de.hybris.platform.commercefacades.product.data.ProductData;
import de.hybris.platform.commerceservices.search.resultdata.SearchResultValueData;
import de.hybris.platform.converters.Populator;
import de.hybris.platform.servicelayer.dto.converter.ConversionException;
import org.apache.log4j.Logger;

import java.util.Date;


public class UtrendSearchResultProductPopulator implements Populator<SearchResultValueData, ProductData>
{
	private static final Logger LOG = Logger.getLogger(UtrendSearchResultProductPopulator.class);

	@Override
	public void populate(SearchResultValueData source, ProductData target) throws ConversionException
	{
		target.setCreationDate(this.<Date>getValue(source, "utrendCreationDate"));
	}

	protected <T> T getValue(final SearchResultValueData source, final String propertyName)
	{
		if (source.getValues() == null)
		{
			return null;
		}

		return (T) source.getValues().get(propertyName);
	}
}
