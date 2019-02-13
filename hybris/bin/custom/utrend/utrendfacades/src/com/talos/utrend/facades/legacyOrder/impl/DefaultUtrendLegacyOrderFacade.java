package com.talos.utrend.facades.legacyOrder.impl;

import com.talos.utrend.core.legacyOrder.LegacyOrderService;
import com.talos.utrend.core.model.LegacyOrderEntryModel;
import com.talos.utrend.core.model.LegacyOrderModel;
import com.talos.utrend.facades.legacyOrder.UtrendLegacyOrderFacade;
import com.talos.utrend.facades.legacyOrder.data.LegacyOrderData;
import com.talos.utrend.facades.legacyOrder.data.LegacyOrderEntryData;
import de.hybris.platform.commerceservices.search.pagedata.PageableData;
import de.hybris.platform.commerceservices.search.pagedata.SearchPageData;
import de.hybris.platform.converters.Converters;
import de.hybris.platform.servicelayer.dto.converter.Converter;
import org.springframework.beans.factory.annotation.Required;

import java.util.List;


public class DefaultUtrendLegacyOrderFacade implements UtrendLegacyOrderFacade
{
	private LegacyOrderService legacyOrderService;
	private Converter<LegacyOrderModel, LegacyOrderData> legacyOrderConverter;
	private Converter<LegacyOrderEntryModel, LegacyOrderEntryData> legacyOrderEntryConverter;

	@Override
	public List<LegacyOrderData> getLegacyOrderHistoryCustomer(String customerId)
	{
		List<LegacyOrderModel> legacyOrdersModel = getLegacyOrderService().getAllLegacyOrderByCustomer(customerId);
		List<LegacyOrderData> legacyOrdersData = Converters.convertAll(legacyOrdersModel,getLegacyOrderConverter());
		return legacyOrdersData;
	}

	@Override
	public SearchPageData<LegacyOrderData> getPagedLegacyOrderHistoryCustomer(String customerId, PageableData pageableData)
	{
		SearchPageData<LegacyOrderModel> legacyOrdersModel = getLegacyOrderService().getAllLegacyOrderByCustomer(customerId,pageableData);
		SearchPageData<LegacyOrderData> pagedLegacyOrderData = new SearchPageData<LegacyOrderData>();
		pagedLegacyOrderData.setSorts(legacyOrdersModel.getSorts());
		pagedLegacyOrderData.setPagination(legacyOrdersModel.getPagination());
		pagedLegacyOrderData.setResults(Converters.convertAll(legacyOrdersModel.getResults(),getLegacyOrderConverter()));
		return pagedLegacyOrderData;
	}

	@Override
	public List<LegacyOrderEntryData> getLegacyOrderEntriesByOrder(String orderNumber){
		List<LegacyOrderEntryModel> legacyOrderEntriesModel = getLegacyOrderService().getAllLegacyOrderEntriesByOrder(orderNumber);
		List<LegacyOrderEntryData> legacyOrderEntriesData = Converters.convertAll(legacyOrderEntriesModel,getLegacyOrderEntryConverter());
		return legacyOrderEntriesData;
	}

	@Override
	public LegacyOrderData getLegacyOrderByOrderNumber(String orderNumber)
	{
		LegacyOrderModel legacyOrderModel = getLegacyOrderService().getLegacyOrderByOrderNumber(orderNumber);
		LegacyOrderData LegacyOrderData = legacyOrderConverter.convert(legacyOrderModel);
		return LegacyOrderData;
	}

	protected LegacyOrderService getLegacyOrderService()
	{
		return legacyOrderService;
	}

	@Required
	public void setLegacyOrderService(final LegacyOrderService legacyOrderService)
	{
		this.legacyOrderService = legacyOrderService;
	}

	protected Converter<LegacyOrderModel, LegacyOrderData> getLegacyOrderConverter() {
		return legacyOrderConverter;
	}

	@Required
	public void setLegacyOrderConverter(final Converter<LegacyOrderModel, LegacyOrderData> legacyOrderConverter) {
		this.legacyOrderConverter = legacyOrderConverter;
	}

	protected Converter<LegacyOrderEntryModel, LegacyOrderEntryData> getLegacyOrderEntryConverter() { return legacyOrderEntryConverter; }

	@Required
	public void setLegacyOrderEntryConverter(final Converter<LegacyOrderEntryModel, LegacyOrderEntryData> legacyOrderEntryConverter) {
		this.legacyOrderEntryConverter = legacyOrderEntryConverter;
	}
}
