package com.talos.utrend.core.attributehandlers;

import de.hybris.platform.core.model.product.ProductModel;
import de.hybris.platform.servicelayer.model.attribute.DynamicAttributeHandler;

import java.time.Duration;
import java.time.Instant;
import java.util.Date;


public class DaysPastAttributeHandler implements DynamicAttributeHandler<Integer, ProductModel>
{
	@Override
	public Integer get(ProductModel model)
	{
		Date date = model.getUtrendCreationDate();
		if(date != null)
		{
			final Instant today = Instant.now();
			final Instant productInstant = date.toInstant();

			return new Integer((int) Duration.between(productInstant,today).toDays());
		}
		else
			return -1;
	}

	@Override
	public void set(ProductModel model, Integer date)
	{

	}
}
