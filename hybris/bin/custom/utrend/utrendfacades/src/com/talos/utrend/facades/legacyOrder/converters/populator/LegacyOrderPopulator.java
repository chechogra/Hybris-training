package com.talos.utrend.facades.legacyOrder.converters.populator;

import com.talos.utrend.core.model.LegacyOrderModel;
import com.talos.utrend.facades.legacyOrder.data.LegacyOrderData;
import de.hybris.platform.converters.Populator;
import de.hybris.platform.servicelayer.dto.converter.ConversionException;

public class LegacyOrderPopulator implements Populator<LegacyOrderModel, LegacyOrderData>
{
	@Override
	public void populate(final LegacyOrderModel source, final LegacyOrderData target) throws ConversionException
	{
		target.setOrderNumber(source.getOrderNumber());
		target.setOrderStatus(source.getOrderStatus().toString());
		target.setOrderTotal(source.getOrderTotal());
	}
}
