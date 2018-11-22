package com.talos.utrend.facades.populators;

import de.hybris.platform.commercefacades.product.data.ProductData;
import de.hybris.platform.converters.Populator;
import de.hybris.platform.core.model.product.ProductModel;
import de.hybris.platform.servicelayer.dto.converter.ConversionException;



public class CreationDatePopulator implements Populator<ProductModel, ProductData>
{

	@Override
	public void populate(ProductModel source, ProductData target) throws ConversionException
	{
		target.setCreationDate(source.getCreationDate());
		target.setDaysPast(source.getDaysPast());
	}
}
