package com.talos.utrend.core.legacyOrder.impl;

import com.talos.utrend.core.legacyOrder.LegacyOrderDAO;
import com.talos.utrend.core.legacyOrder.LegacyOrderService;
import com.talos.utrend.core.model.LegacyOrderEntryModel;
import com.talos.utrend.core.model.LegacyOrderModel;
import de.hybris.platform.commerceservices.search.pagedata.PageableData;
import de.hybris.platform.commerceservices.search.pagedata.SearchPageData;
import org.springframework.beans.factory.annotation.Required;

import java.util.List;

import javax.annotation.Resource;


public class DefaultLegacyOrderService implements LegacyOrderService
{
	@Resource(name = "legacyOrderDAO")
	private LegacyOrderDAO legacyOrderDAO;

	@Override
	public List<LegacyOrderModel> getAllLegacyOrderByCustomer(String customerId){
		return legacyOrderDAO.getAllLegacyOrderByCustomer(customerId);
	}

	@Override
	public SearchPageData<LegacyOrderModel> getAllLegacyOrderByCustomer(String customerId, PageableData pageableData)
	{
			return getLegacyOrderDAO().getAllLegacyOrderByCustomer(customerId, pageableData);
	}

	@Override
	public List<LegacyOrderEntryModel> getAllLegacyOrderEntriesByOrder(String orderNumber){
		return legacyOrderDAO.getAllLegacyOrderEntriesByOrder(orderNumber);
	}

	@Override
	public LegacyOrderModel getLegacyOrderByOrderNumber(String orderNumber)
	{
		return legacyOrderDAO.getLegacyOrderByOrderNumber(orderNumber);
	}

	public LegacyOrderDAO getLegacyOrderDAO()
	{
		return legacyOrderDAO;
	}

	@Required
	public void setLegacyOrderDAO(LegacyOrderDAO legacyOrderDAO)
	{
		this.legacyOrderDAO = legacyOrderDAO;
	}
}
