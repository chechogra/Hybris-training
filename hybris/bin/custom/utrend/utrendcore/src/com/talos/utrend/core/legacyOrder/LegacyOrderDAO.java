package com.talos.utrend.core.legacyOrder;

import com.talos.utrend.core.model.LegacyOrderEntryModel;
import com.talos.utrend.core.model.LegacyOrderModel;
import de.hybris.platform.commerceservices.search.pagedata.PageableData;
import de.hybris.platform.commerceservices.search.pagedata.SearchPageData;
import de.hybris.platform.servicelayer.internal.dao.GenericDao;
import java.util.List;


public interface LegacyOrderDAO extends GenericDao<LegacyOrderModel>
{
	List<LegacyOrderModel> getAllLegacyOrderByCustomer(String customerId);

	SearchPageData<LegacyOrderModel> getAllLegacyOrderByCustomer(String customerId, PageableData pageableData);

	List<LegacyOrderEntryModel> getAllLegacyOrderEntriesByOrder(String orderNumber);

	LegacyOrderModel getLegacyOrderByOrderNumber(String orderNumber);

}
