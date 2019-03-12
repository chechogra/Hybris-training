package com.talos.utrend.facades.order.impl;

import com.talos.utrend.core.model.LegacyOrderModel;
import com.talos.utrend.core.order.UtrendLegacyOrderService;
import com.talos.utrend.facades.order.UtrendOrderFacade;
import com.talos.utrend.facades.order.data.LegacyOrderData;
import com.talos.utrend.facades.order.data.LegacyOrderHistoryData;

import de.hybris.platform.commercefacades.order.impl.DefaultOrderFacade;
import de.hybris.platform.commerceservices.search.pagedata.PageableData;
import de.hybris.platform.commerceservices.search.pagedata.SearchPageData;
import de.hybris.platform.converters.Converters;
import de.hybris.platform.core.model.user.CustomerModel;
import de.hybris.platform.servicelayer.dto.converter.Converter;
import org.springframework.beans.factory.annotation.Required;

import java.util.List;


public class DefaultUtrendOrderFacade extends DefaultOrderFacade implements UtrendOrderFacade
{
	private UtrendLegacyOrderService legacyOrderService;
	private Converter<LegacyOrderModel, LegacyOrderHistoryData> legacyOrderHistoryConverter;
	private Converter<LegacyOrderModel, LegacyOrderData> legacyOrderConverter;

	@Override
	public List<LegacyOrderHistoryData> getLegacyOrderHistory()
	{
		final CustomerModel currentCustomer = (CustomerModel) getUserService().getCurrentUser();
		final List<LegacyOrderModel> legacyOrderList = getLegacyOrderService()
				.getLegacyOrderListByCustomer(currentCustomer);

		return Converters.convertAll(legacyOrderList, getLegacyOrderHistoryConverter());
	}

	@Override
	public SearchPageData<LegacyOrderHistoryData> getPagedLegacyOrderHistory(PageableData pageableData)
	{
		final CustomerModel currentCustomer = (CustomerModel) getUserService().getCurrentUser();
		final SearchPageData<LegacyOrderModel> legacyOrderResults = getLegacyOrderService()
				.getLegacyOrderListByCustomer(currentCustomer, pageableData);

		return convertPageData(legacyOrderResults, getLegacyOrderHistoryConverter());
	}

	@Override
	public LegacyOrderData getLegacyOrderDetailForOrderNumber(String orderNumber)
	{
		final CustomerModel currentCustomer = (CustomerModel) getUserService().getCurrentUser();
		final LegacyOrderModel LegacyOrder = getLegacyOrderService()
				.getLegacyOrderByCustomerAndOrderNumber(currentCustomer, orderNumber);

		return getLegacyOrderConverter().convert(LegacyOrder);
	}

	@Required
	public void setLegacyOrderService(UtrendLegacyOrderService legacyOrderService)
	{
		this.legacyOrderService = legacyOrderService;
	}

	protected UtrendLegacyOrderService getLegacyOrderService()
	{
		return legacyOrderService;
	}

	@Required
	public void setLegacyOrderHistoryConverter(
			final Converter<LegacyOrderModel, LegacyOrderHistoryData> legacyOrderHistoryConverter)
	{
		this.legacyOrderHistoryConverter = legacyOrderHistoryConverter;
	}

	protected Converter<LegacyOrderModel, LegacyOrderHistoryData> getLegacyOrderHistoryConverter()
	{
		return legacyOrderHistoryConverter;
	}

	@Required
	public void setLegacyOrderConverter(
			Converter<LegacyOrderModel, LegacyOrderData> legacyOrderConverter)
	{
		this.legacyOrderConverter = legacyOrderConverter;
	}

	public Converter<LegacyOrderModel, LegacyOrderData> getLegacyOrderConverter()
	{
		return legacyOrderConverter;
	}
}
