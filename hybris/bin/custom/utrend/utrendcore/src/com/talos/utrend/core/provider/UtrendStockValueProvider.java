package com.talos.utrend.core.provider;

import de.hybris.platform.core.model.product.ProductModel;
import de.hybris.platform.solrfacetsearch.config.IndexConfig;
import de.hybris.platform.solrfacetsearch.config.IndexedProperty;
import de.hybris.platform.solrfacetsearch.config.exceptions.FieldValueProviderException;
import de.hybris.platform.solrfacetsearch.provider.FieldNameProvider;
import de.hybris.platform.solrfacetsearch.provider.FieldValue;
import de.hybris.platform.solrfacetsearch.provider.FieldValueProvider;
import de.hybris.platform.solrfacetsearch.provider.impl.AbstractPropertyFieldValueProvider;
import org.springframework.beans.factory.annotation.Required;

import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.ArrayList;


public class UtrendStockValueProvider extends AbstractPropertyFieldValueProvider implements FieldValueProvider
{

	private FieldNameProvider fieldNameProvider;

	@Override
	public Collection<FieldValue> getFieldValues(IndexConfig indexConfig, IndexedProperty indexedProperty, Object model)
			throws FieldValueProviderException
	{
		if (model instanceof ProductModel)
		{
			HashSet<String> fieldNames = (HashSet<String>) this.fieldNameProvider.getFieldNames(indexedProperty, null);
			final ProductModel product = (ProductModel) model;
			final Collection<FieldValue> fieldValues = new ArrayList<FieldValue>();
			Double value = product.getUtrendStock();
			List<String> rangeNameList = this.getRangeNameList(indexedProperty, value);
			if (value != null)
			{
				fieldValues.add(new FieldValue(
						fieldNames.stream().findFirst().get(),
						rangeNameList.size() > 0 ? rangeNameList.get(0) : value));
			}
			return fieldValues;
		}
		else
		{
			throw new FieldValueProviderException("Error message!");
		}
	}

	@Required
	public void setFieldNameProvider(FieldNameProvider fieldNameProvider)
	{
		this.fieldNameProvider = fieldNameProvider;
	}
}
