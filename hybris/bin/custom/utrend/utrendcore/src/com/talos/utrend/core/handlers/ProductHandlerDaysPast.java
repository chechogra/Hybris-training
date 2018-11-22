package com.talos.utrend.core.handlers;

import de.hybris.platform.core.model.product.ProductModel;
import de.hybris.platform.servicelayer.model.attribute.DynamicAttributeHandler;

import java.time.Duration;
import java.time.Instant;
import java.time.LocalDate;


public class ProductHandlerDaysPast implements DynamicAttributeHandler<String, ProductModel>
{
	@Override
	public String get(ProductModel model)
	{
		if (model.getCreationDate() != null)
		{
			Duration timeElapsed = Duration.between(model.getCreationDate().toInstant(), Instant.now());
			return Long.toString(timeElapsed.toDays());
		}
		else
			{
		return "0";
		}
	}

	@Override
	public void set(ProductModel model, String s)
	{
	}
}
