package com.talos.utrend.facades.legacyOrder;

import com.talos.utrend.facades.legacyOrder.data.LegacyOrderData;
import com.talos.utrend.facades.legacyOrder.data.LegacyOrderEntryData;
import de.hybris.platform.commerceservices.search.pagedata.PageableData;
import de.hybris.platform.commerceservices.search.pagedata.SearchPageData;
import java.util.List;

public interface UtrendLegacyOrderFacade
{
	List<LegacyOrderData> getLegacyOrderHistoryCustomer(String customerId);

	SearchPageData<LegacyOrderData> getPagedLegacyOrderHistoryCustomer(String customerId , PageableData pageableData);

	List<LegacyOrderEntryData> getLegacyOrderEntriesByOrder(String orderNumber);

	LegacyOrderData getLegacyOrderByOrderNumber(String orderNumber);
}
