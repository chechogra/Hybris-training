package com.talos.utrend.facades.populators;

import com.talos.utrend.core.model.LegacyOrderEntryModel;
import com.talos.utrend.core.model.LegacyOrderModel;
import com.talos.utrend.facades.order.data.LegacyOrderData;
import com.talos.utrend.facades.order.data.LegacyOrderEntryData;
import de.hybris.platform.commercefacades.user.data.CustomerData;
import de.hybris.platform.converters.Populator;
import de.hybris.platform.core.model.user.CustomerModel;
import de.hybris.platform.servicelayer.dto.converter.ConversionException;
import de.hybris.platform.servicelayer.dto.converter.Converter;
import org.springframework.beans.factory.annotation.Required;


public class UtrendLegacyOrderPopulator implements Populator<LegacyOrderModel, LegacyOrderData>
{
	private Converter<CustomerModel, CustomerData> customerConverter;
	private Converter<LegacyOrderEntryModel, LegacyOrderEntryData> legacyOrderEntryConverter;

	@Override
	public void populate(LegacyOrderModel source, LegacyOrderData target) throws ConversionException
	{
		target.setOrderNumber(source.getOrderNumber());
		target.setOrderStatus(source.getOrderStatus().toString());
		target.setOrderTotal(source.getOrderTotal());
		target.setCustomer(getCustomerConverter().convert(source.getCustomer()));
		target.setEntries(getLegacyOrderEntryConverter().convertAll(source.getLegacyOrderEntries()));
	}

	@Required
	public void setCustomerConverter(
			Converter<CustomerModel, CustomerData> customerConverter)
	{
		this.customerConverter = customerConverter;
	}

	protected Converter<CustomerModel, CustomerData> getCustomerConverter()
	{
		return customerConverter;
	}

	@Required
	public void setLegacyOrderEntryConverter(
			Converter<LegacyOrderEntryModel, LegacyOrderEntryData> legacyOrderEntryConverter)
	{
		this.legacyOrderEntryConverter = legacyOrderEntryConverter;
	}

	protected Converter<LegacyOrderEntryModel, LegacyOrderEntryData> getLegacyOrderEntryConverter()
	{
		return legacyOrderEntryConverter;
	}
}
