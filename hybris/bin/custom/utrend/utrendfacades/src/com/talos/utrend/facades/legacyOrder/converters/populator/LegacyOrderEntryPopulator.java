package com.talos.utrend.facades.legacyOrder.converters.populator;

import com.talos.utrend.core.model.LegacyOrderEntryModel;
import com.talos.utrend.core.model.LegacyOrderModel;
import com.talos.utrend.facades.legacyOrder.data.LegacyOrderData;
import com.talos.utrend.facades.legacyOrder.data.LegacyOrderEntryData;
import de.hybris.platform.converters.Populator;
import de.hybris.platform.servicelayer.dto.converter.ConversionException;


public class LegacyOrderEntryPopulator implements Populator<LegacyOrderEntryModel, LegacyOrderEntryData>
{


	@Override
	public void populate(LegacyOrderEntryModel source, LegacyOrderEntryData target)
			throws ConversionException
	{
		target.setPrice(source.getBasePrice());
		target.setProduct(source.getProduct());
		target.setQuantity(source.getQuantity());
		target.setTotal(source.getTotal());
	}
}
