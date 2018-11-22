package com.talos.utrend.facades.populators;

import de.hybris.platform.commercefacades.product.data.ProductData;
import de.hybris.platform.converters.Populator;
import de.hybris.platform.core.model.product.ProductModel;
import de.hybris.platform.servicelayer.dto.converter.ConversionException;


/*
 * This Populator is in charge of setting a data with both the creation date
 */
public class ProductCreationDatePopulator implements Populator<ProductModel, ProductData>
{

	@Override
	public void populate(ProductModel productModel, ProductData productData) throws ConversionException
	{
		productData.setCreationDate(productModel.getUtrendCreationDate());
		productData.setDaysPast(productModel.getDaysPast());
	}
}
