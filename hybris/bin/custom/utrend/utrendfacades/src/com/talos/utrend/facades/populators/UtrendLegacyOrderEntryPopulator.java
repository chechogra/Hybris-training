package com.talos.utrend.facades.populators;

import com.talos.utrend.core.model.LegacyOrderEntryModel;
import com.talos.utrend.facades.order.data.LegacyOrderEntryData;
import de.hybris.platform.commercefacades.product.data.ProductData;
import de.hybris.platform.converters.Populator;
import de.hybris.platform.core.model.product.ProductModel;
import de.hybris.platform.servicelayer.dto.converter.ConversionException;
import de.hybris.platform.servicelayer.dto.converter.Converter;
import org.springframework.beans.factory.annotation.Required;


public class UtrendLegacyOrderEntryPopulator implements Populator<LegacyOrderEntryModel, LegacyOrderEntryData>
{
	private Converter<ProductModel, ProductData> productConverter;

	@Override
	public void populate(LegacyOrderEntryModel source, LegacyOrderEntryData target)
			throws ConversionException
	{
		target.setUid(source.getUid());
		target.setProduct(getProductConverter().convert(source.getProduct()));
		target.setQuantity(source.getQuantity());
		target.setBasePrice(source.getBasePrice());
	}

	@Required
	public void setProductConverter(
			Converter<ProductModel, ProductData> productConverter)
	{
		this.productConverter = productConverter;
	}

	protected Converter<ProductModel, ProductData> getProductConverter()
	{
		return productConverter;
	}
}
