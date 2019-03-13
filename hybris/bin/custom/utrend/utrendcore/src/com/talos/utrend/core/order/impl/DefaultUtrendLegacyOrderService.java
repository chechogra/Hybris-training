package com.talos.utrend.core.order.impl;

import com.talos.utrend.core.model.LegacyOrderModel;
import com.talos.utrend.core.order.UtrendLegacyOrderService;
import com.talos.utrend.core.order.dao.UtrendLegacyOrderDao;
import de.hybris.platform.commerceservices.search.pagedata.PageableData;
import de.hybris.platform.commerceservices.search.pagedata.SearchPageData;
import de.hybris.platform.core.model.user.CustomerModel;
import org.springframework.beans.factory.annotation.Required;

import java.util.List;

import static de.hybris.platform.servicelayer.util.ServicesUtil.validateParameterNotNull;


public class DefaultUtrendLegacyOrderService implements UtrendLegacyOrderService
{
	private UtrendLegacyOrderDao legacyOrderDao;

	@Override
	public List<LegacyOrderModel> getLegacyOrderListByCustomer(final CustomerModel customer)
	{
		validateParameterNotNull(customer, "Customer must not be null");
		return getLegacyOrderDao().findLegacyOrdersByCustomer(customer);
	}

	@Override
	public SearchPageData<LegacyOrderModel> getLegacyOrderListByCustomer(final CustomerModel customer,
			final PageableData pageableData)
	{
		validateParameterNotNull(customer, "Customer must not be null");
		return getLegacyOrderDao().findLegacyOrdersByCustomer(customer, pageableData);
	}

	@Override
	public LegacyOrderModel getLegacyOrderByCustomerAndOrderNumber(CustomerModel customer, String orderNumber)
	{
		validateParameterNotNull(customer, "Customer must not be null");
		validateParameterNotNull(orderNumber, "Order number must not be null");
		return getLegacyOrderDao().findLegacyOrderByCustomerAndOrderNumber(customer, orderNumber);
	}

	@Required
	public void setLegacyOrderDao(UtrendLegacyOrderDao legacyOrderDao)
	{
		this.legacyOrderDao = legacyOrderDao;
	}

	public UtrendLegacyOrderDao getLegacyOrderDao()
	{
		return legacyOrderDao;
	}
}
