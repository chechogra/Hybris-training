package com.talos.utrend.facades.order;

import com.talos.utrend.facades.order.data.LegacyOrderData;
import com.talos.utrend.facades.order.data.LegacyOrderHistoryData;
import de.hybris.platform.commercefacades.order.OrderFacade;
import de.hybris.platform.commerceservices.search.pagedata.PageableData;
import de.hybris.platform.commerceservices.search.pagedata.SearchPageData;

import java.util.List;


/**
 * Utrend Order Facade interface that extends the base Order Facade
 */
public interface UtrendOrderFacade extends OrderFacade
{
	/**
	 * Returns the legacy order history of the current user.
	 *
	 * @return The legacy order history of the current user.
	 */
	List<LegacyOrderHistoryData> getLegacyOrderHistory();

	/**
	 * Returns the legacy order history of the current user for given statuses.
	 *
	 * @param pageableData paging information
	 * @return The legacy order history of the current user.
	 */
	SearchPageData<LegacyOrderHistoryData> getPagedLegacyOrderHistory(PageableData pageableData);

	/**
	 * Returns the detail of an Legacy Order.
	 *
	 * @param orderNumber The order number of the Legacy Order for which to retrieve the detail.
	 * @return The detail of the legacy order with matching number
	 */
	LegacyOrderData getLegacyOrderDetailForOrderNumber(final String orderNumber);
}
