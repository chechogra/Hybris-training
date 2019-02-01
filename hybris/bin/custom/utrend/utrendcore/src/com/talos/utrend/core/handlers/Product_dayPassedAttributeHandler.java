package com.talos.utrend.core.handlers;

import de.hybris.platform.core.model.product.ProductModel;
import de.hybris.platform.servicelayer.model.attribute.DynamicAttributeHandler;
import java.util.Date;
import java.util.concurrent.TimeUnit;


public class Product_dayPassedAttributeHandler implements DynamicAttributeHandler<Long, ProductModel>
{
	@Override
	public Long get(final ProductModel model)
	{
		Date creationDate = model.getUtrendCreationDate();
		Date dateNow = new Date();
		long differenceMiliseconds = dateNow.getTime() - creationDate.getTime();
		return TimeUnit.DAYS.convert(differenceMiliseconds, TimeUnit.MILLISECONDS);
	}

	@Override
	public void set(final ProductModel model, final Long value)
	{
		throw new UnsupportedOperationException();
	}

}
