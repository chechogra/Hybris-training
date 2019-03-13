package com.talos.utrend.core.handlers;

import de.hybris.platform.core.model.product.ProductModel;
import de.hybris.platform.servicelayer.model.attribute.DynamicAttributeHandler;

import java.util.Date;
import java.util.Optional;
import java.util.concurrent.TimeUnit;


public class ProductDaysPassedAttributeHandler implements DynamicAttributeHandler<Long, ProductModel>
{
	@Override
	public Long get(ProductModel product)
	{
		return Optional.ofNullable(product.getUtrendCreationDate()).map(
				(creationDate) -> {
					Date currentDate = new Date();
					long differenceInMs = Math.abs(currentDate.getTime() - creationDate.getTime());
					return TimeUnit.DAYS.convert(differenceInMs, TimeUnit.MILLISECONDS);
				}
		).orElse((Long.valueOf(0)));
	}

	@Override
	public void set(ProductModel model, Long aLong)
	{

	}
}
