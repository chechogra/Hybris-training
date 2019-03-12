package com.talos.utrend.core.order.dao.impl;

import com.talos.utrend.core.model.LegacyOrderModel;
import com.talos.utrend.core.order.dao.UtrendLegacyOrderDao;
import de.hybris.platform.commerceservices.search.flexiblesearch.PagedFlexibleSearchService;
import de.hybris.platform.commerceservices.search.flexiblesearch.data.SortQueryData;
import de.hybris.platform.commerceservices.search.pagedata.PageableData;
import de.hybris.platform.commerceservices.search.pagedata.SearchPageData;
import de.hybris.platform.core.model.user.CustomerModel;
import de.hybris.platform.servicelayer.internal.dao.DefaultGenericDao;
import de.hybris.platform.servicelayer.search.FlexibleSearchQuery;
import de.hybris.platform.servicelayer.search.SearchResult;
import org.springframework.beans.factory.annotation.Required;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static de.hybris.platform.servicelayer.util.ServicesUtil.validateParameterNotNull;


public class DefaultUtrendLegacyOrderDao extends DefaultGenericDao<LegacyOrderModel> implements UtrendLegacyOrderDao
{
	private static final String FIND_LEGACY_ORDERS_BY_CUSTOMER = "SELECT {lo." + LegacyOrderModel.PK + "} "
			+ "FROM {" + LegacyOrderModel._TYPECODE + " AS lo} WHERE {lo." + LegacyOrderModel.CUSTOMER + "} = ?customer";

	private static final String FIND_LEGACY_ORDER_BY_CUSTOMER_AND_ORDER_NUMBER = "SELECT {lo." + LegacyOrderModel.PK + "} "
			+ "FROM {" + LegacyOrderModel._TYPECODE + " AS lo} WHERE {lo." + LegacyOrderModel.CUSTOMER + "} = ?customer "
			+ "AND {lo." + LegacyOrderModel.ORDERNUMBER + "} = ?orderNumber";

	private static final String ORDER_BY_LEGACY_ORDER_NUMBER_ASC = " ORDER BY {lo." + LegacyOrderModel.ORDERNUMBER + "} ASC";
	private static final String ORDER_BY_LEGACY_ORDER_CREATIONTIME_DESC =
			" ORDER BY {lo." + LegacyOrderModel.CREATIONTIME + "} DESC";

	private PagedFlexibleSearchService pagedFlexibleSearchService;

	public DefaultUtrendLegacyOrderDao()
	{
		super(LegacyOrderModel._TYPECODE);
	}

	@Override
	public List<LegacyOrderModel> findLegacyOrdersByCustomer(final CustomerModel customer)
	{
		validateParameterNotNull(customer, "Customer must not be null");

		final Map<String, Object> queryParams = new HashMap<>();
		queryParams.put("customer", customer);

		final FlexibleSearchQuery query = new FlexibleSearchQuery(
				FIND_LEGACY_ORDERS_BY_CUSTOMER + ORDER_BY_LEGACY_ORDER_CREATIONTIME_DESC);
		query.addQueryParameters(queryParams);

		final SearchResult<LegacyOrderModel> result = getFlexibleSearchService().search(query);
		return result.getResult();
	}

	@Override
	public SearchPageData<LegacyOrderModel> findLegacyOrdersByCustomer(final CustomerModel customer,
			final PageableData pageableData)
	{
		validateParameterNotNull(customer, "Customer must not be null");

		final Map<String, Object> queryParams = new HashMap<>();
		queryParams.put("customer", customer);

		final List<SortQueryData> sortQueries = Arrays.asList(
				createSortQueryData("byOrderNumber", FIND_LEGACY_ORDERS_BY_CUSTOMER + ORDER_BY_LEGACY_ORDER_NUMBER_ASC),
				createSortQueryData("byDate", FIND_LEGACY_ORDERS_BY_CUSTOMER + ORDER_BY_LEGACY_ORDER_CREATIONTIME_DESC)
		);

		return getPagedFlexibleSearchService().search(sortQueries, "byDate", queryParams, pageableData);
	}

	@Override
	public LegacyOrderModel findLegacyOrderByCustomerAndOrderNumber(CustomerModel customer, String orderNumber)
	{
		validateParameterNotNull(customer, "Customer must not be null");
		validateParameterNotNull(orderNumber, "Order number must not be null");

		final Map<String, Object> queryParams = new HashMap<>();
		queryParams.put("customer", customer);
		queryParams.put("orderNumber", orderNumber);

		final FlexibleSearchQuery query = new FlexibleSearchQuery(FIND_LEGACY_ORDER_BY_CUSTOMER_AND_ORDER_NUMBER);
		query.addQueryParameters(queryParams);

		return getFlexibleSearchService().searchUnique(query);
	}

	protected SortQueryData createSortQueryData(final String sortCode, final String query)
	{
		final SortQueryData result = new SortQueryData();
		result.setSortCode(sortCode);
		result.setQuery(query);
		return result;
	}

	@Required
	public void setPagedFlexibleSearchService(
			PagedFlexibleSearchService pagedFlexibleSearchService)
	{
		this.pagedFlexibleSearchService = pagedFlexibleSearchService;
	}

	protected PagedFlexibleSearchService getPagedFlexibleSearchService()
	{
		return pagedFlexibleSearchService;
	}
}
