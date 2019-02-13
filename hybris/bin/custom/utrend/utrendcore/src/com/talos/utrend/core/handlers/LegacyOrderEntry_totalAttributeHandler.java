package com.talos.utrend.core.handlers;

import com.talos.utrend.core.model.LegacyOrderEntryModel;
import de.hybris.platform.core.model.product.ProductModel;
import de.hybris.platform.servicelayer.model.attribute.DynamicAttributeHandler;


public class LegacyOrderEntry_totalAttributeHandler implements DynamicAttributeHandler<Long, LegacyOrderEntryModel>
{

	@Override
	public Long get(LegacyOrderEntryModel model)  {
		return model.getQuantity() * model.getBasePrice();
	}

	@Override
	public void set(LegacyOrderEntryModel model, Long aLong)  { throw new UnsupportedOperationException(); }

}
