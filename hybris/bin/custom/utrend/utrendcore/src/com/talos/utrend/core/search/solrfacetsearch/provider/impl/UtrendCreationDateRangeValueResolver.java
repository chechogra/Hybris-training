package com.talos.utrend.core.search.solrfacetsearch.provider.impl;

import de.hybris.platform.core.model.product.ProductModel;
import de.hybris.platform.solrfacetsearch.config.IndexedProperty;
import de.hybris.platform.solrfacetsearch.config.exceptions.FieldValueProviderException;
import de.hybris.platform.solrfacetsearch.indexer.IndexerBatchContext;
import de.hybris.platform.solrfacetsearch.indexer.spi.InputDocument;
import de.hybris.platform.solrfacetsearch.provider.impl.AbstractValueResolver;


public class UtrendCreationDateRangeValueResolver extends AbstractValueResolver<ProductModel, Object, Object>
{
	@Override
	protected void addFieldValues(InputDocument inputDocument, IndexerBatchContext indexerBatchContext,
			IndexedProperty indexedProperty, ProductModel product, ValueResolverContext<Object, Object> valueResolverContext)
			throws FieldValueProviderException
	{
		inputDocument.addField(indexedProperty, product.getUtrendCreationDate(), valueResolverContext.getFieldQualifier());
	}
}
