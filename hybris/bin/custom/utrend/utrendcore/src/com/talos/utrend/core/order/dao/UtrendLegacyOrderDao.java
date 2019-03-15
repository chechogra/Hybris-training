package com.talos.utrend.core.order.dao;

import com.talos.utrend.core.model.LegacyOrderModel;
import de.hybris.platform.commerceservices.search.pagedata.PageableData;
import de.hybris.platform.commerceservices.search.pagedata.SearchPageData;
import de.hybris.platform.core.model.user.CustomerModel;
import de.hybris.platform.servicelayer.internal.dao.GenericDao;

import java.util.List;


/**
 * Data Access Object for looking up items related to the legacy orders.
 */
public interface UtrendLegacyOrderDao extends GenericDao<LegacyOrderModel>
{
	/**
	 * Finds legacy orders for the specified user in the current session's active catalog versions
	 *
	 * @param customer the customer
	 * @return The list of legacy orders owned by the customer associated with the store
	 */
	List<LegacyOrderModel> findLegacyOrdersByCustomer(CustomerModel customer);

	/**
	 * Finds legacy orders for the specified user in the current session's active catalog versions
	 *
	 * @param customer     the customer
	 * @param pageableData The pagination data
	 * @return The list of legacy orders owned by the customer associated with the store
	 */
	SearchPageData<LegacyOrderModel> findLegacyOrdersByCustomer(CustomerModel customer, PageableData pageableData);

	/**
	 * Finds the specified legacy order for the specified user in the current session's active catalog versions
	 *
	 * @param customer    the customer
	 * @param orderNumber the number representing the legacy order
	 * @return The legacy order found
	 * @throws de.hybris.platform.servicelayer.exceptions.ModelNotFoundException       if nothing was found
	 * @throws de.hybris.platform.servicelayer.exceptions.AmbiguousIdentifierException if by the given search params to many models where found
	 */
	LegacyOrderModel findLegacyOrderByCustomerAndOrderNumber(CustomerModel customer, String orderNumber);
}
