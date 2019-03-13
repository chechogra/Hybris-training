package com.talos.utrend.facades.populators;

import com.talos.utrend.core.model.LegacyOrderModel;
import com.talos.utrend.facades.order.data.LegacyOrderHistoryData;
import de.hybris.platform.converters.Populator;
import de.hybris.platform.enumeration.EnumerationService;
import de.hybris.platform.servicelayer.dto.converter.ConversionException;
import org.springframework.beans.factory.annotation.Required;


public class UtrendLegacyOrderHistoryPopulator implements Populator<LegacyOrderModel, LegacyOrderHistoryData>
{
	private EnumerationService enumerationService;

	@Override
	public void populate(LegacyOrderModel source, LegacyOrderHistoryData target)
			throws ConversionException
	{
		String orderStatus = getEnumerationService().getEnumerationName(source.getOrderStatus());
		target.setOrderNumber(source.getOrderNumber());
		target.setOrderTotal(source.getOrderTotal());
		target.setOrderStatus(orderStatus);
	}

	@Required
	public void setEnumerationService(EnumerationService enumerationService)
	{
		this.enumerationService = enumerationService;
	}

	protected EnumerationService getEnumerationService()
	{
		return enumerationService;
	}
}
