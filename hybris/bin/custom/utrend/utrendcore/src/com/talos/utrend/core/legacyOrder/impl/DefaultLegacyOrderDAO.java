package com.talos.utrend.core.legacyOrder.impl;

import com.talos.utrend.core.legacyOrder.LegacyOrderDAO;
import com.talos.utrend.core.model.LegacyOrderEntryModel;
import com.talos.utrend.core.model.LegacyOrderModel;
import de.hybris.platform.commerceservices.search.flexiblesearch.PagedFlexibleSearchService;
import de.hybris.platform.commerceservices.search.flexiblesearch.data.SortQueryData;
import de.hybris.platform.commerceservices.search.pagedata.PageableData;
import de.hybris.platform.commerceservices.search.pagedata.SearchPageData;
import de.hybris.platform.servicelayer.internal.dao.DefaultGenericDao;
import de.hybris.platform.servicelayer.search.FlexibleSearchQuery;
import de.hybris.platform.servicelayer.search.SearchResult;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Required;

import javax.annotation.Resource;
import java.util.*;


public class DefaultLegacyOrderDAO extends DefaultGenericDao<LegacyOrderModel> implements LegacyOrderDAO
{


	protected static final String SORT_BY_ORDER_NUMBER_ASC = "byOrderNumberAsc";
	protected static final String SORT_BY_ORDER_NUMBER_DESC = "byOrderNumberDesc";

	final static String GET_ALL_LEGACY_ORDERS_BY_CUSTOMER = "select {l.pk} from { legacyOrder as l join Customer as c on {c.pk} = {l.customer} } where {c.customerId} = ?customerId";
	final static String GET_ALL_LEGACY_ORDER_ENTRIES_BY_ORDER = "select {le.pk} from { legacyOrderEntry as le join legacyOrder as l on {l.pk} = {le.legacyorder} } where {l.orderNumber} = ?orderNumber";
	final static String GET_LEGACY_ORDER_BY_ORDER_NUMBER = "select {l.pk} from {legacyOrder as l} where {orderNumber} = ?orderNumber";

	final static String SORT_LEGACY_ORDERS_BY_ORDER_NUMBER_ASC = " ORDER BY {l.orderNumber} ASC";
	final static String SORT_LEGACY_ORDERS_BY_ORDER_NUMBER_DESC = " ORDER BY {l.orderNumber} DESC";

	@Resource(name = "pagedFlexibleSearchService")
	private PagedFlexibleSearchService pagedFlexibleSearchService;

	public DefaultLegacyOrderDAO()
	{
		super(LegacyOrderModel._TYPECODE);
	}

	@Override
	public List<LegacyOrderModel> getAllLegacyOrderByCustomer(String customerId)
	{
		final Map<String,Object> queryParams = new HashMap<>();
		queryParams.put("customerId", customerId);
		final SearchResult<LegacyOrderModel> searchResult = getFlexibleSearchService()
				.search(new FlexibleSearchQuery(GET_ALL_LEGACY_ORDERS_BY_CUSTOMER,queryParams));
		return searchResult.getResult();
	}

	@Override
	public SearchPageData<LegacyOrderModel> getAllLegacyOrderByCustomer(String customerId, PageableData pageableData)
	{

		final Map<String,Object> queryParams = new HashMap<>();
		queryParams.put("customerId", customerId);

		if (StringUtils.isEmpty(pageableData.getSort()))
		{
			pageableData.setSort(LegacyOrderModel.ORDERNUMBER);
		}

		final SortQueryData sortLegacyOrderAsc = new SortQueryData();
		sortLegacyOrderAsc.setSortCode(SORT_BY_ORDER_NUMBER_ASC);
		sortLegacyOrderAsc.setQuery(GET_ALL_LEGACY_ORDERS_BY_CUSTOMER + SORT_LEGACY_ORDERS_BY_ORDER_NUMBER_ASC);

		final SortQueryData sortLegacyOrderDesc = new SortQueryData();
		sortLegacyOrderDesc.setSortCode(SORT_BY_ORDER_NUMBER_DESC);
		sortLegacyOrderDesc.setQuery(GET_ALL_LEGACY_ORDERS_BY_CUSTOMER + SORT_LEGACY_ORDERS_BY_ORDER_NUMBER_DESC);

		final List<SortQueryData> sortQueries = Arrays.asList(sortLegacyOrderAsc, sortLegacyOrderDesc );

		return getPagedFlexibleSearchService().search(sortQueries, SORT_BY_ORDER_NUMBER_ASC,queryParams
				 ,pageableData);
	}

	@Override
	public List<LegacyOrderEntryModel> getAllLegacyOrderEntriesByOrder(String orderNumber){

		final Map<String,Object> queryParams = new HashMap<>();
		queryParams.put("orderNumber", orderNumber);
		final SearchResult<LegacyOrderEntryModel> searchResult = getFlexibleSearchService()
				.search(new FlexibleSearchQuery(GET_ALL_LEGACY_ORDER_ENTRIES_BY_ORDER,queryParams));
		return searchResult.getResult();
	}

	@Override
	public LegacyOrderModel getLegacyOrderByOrderNumber(String orderNumber)
	{
		final Map<String,Object> queryParams = new HashMap<>();
		queryParams.put("orderNumber", orderNumber);
		return getFlexibleSearchService().searchUnique(new FlexibleSearchQuery(GET_LEGACY_ORDER_BY_ORDER_NUMBER,queryParams));
	}


	public PagedFlexibleSearchService getPagedFlexibleSearchService()
	{
		return pagedFlexibleSearchService;
	}

	@Required
	public void setPagedFlexibleSearchService( PagedFlexibleSearchService pagedFlexibleSearchService) { this.pagedFlexibleSearchService = pagedFlexibleSearchService; }
}
