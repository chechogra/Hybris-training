package com.talos.utrend.core.order;

import com.talos.utrend.core.model.LegacyOrderModel;
import de.hybris.platform.commerceservices.search.pagedata.PageableData;
import de.hybris.platform.commerceservices.search.pagedata.SearchPageData;
import de.hybris.platform.core.model.user.CustomerModel;

import java.util.List;


/**
 * Business service for handling legacy orders.
 */
public interface UtrendLegacyOrderService
{
	/**
	 * Returns the legacy orders of the supplied user
	 *
	 * @param customer the user to retrieve legacy orders for
	 * @return the list of legacy orders
	 */
	List<LegacyOrderModel> getLegacyOrderListByCustomer(final CustomerModel customer);

	/**
	 * Returns the legacy order of the supplied use
	 *
	 * @param customer
	 *           the user to retrieve legacy orders for
	 * @param pageableData
	 *           pagination information
	 * @return the list of legacy orders
	 */
	SearchPageData<LegacyOrderModel> getLegacyOrderListByCustomer(final CustomerModel customer, final PageableData pageableData);

	/**
	 * Returns the specified legacy order for the supplied user.
	 *
	 * @param customer
	 *           the user to retrieve legacy order for
	 * @param orderNumber
	 *           the number of the legacy order to retrieve
	 * @return the legacy order
	 */
	LegacyOrderModel getLegacyOrderByCustomerAndOrderNumber(final CustomerModel customer, final String orderNumber);
}
