package com.talos.utrend.facades.product.impl;

import com.talos.utrend.facades.product.UtrendProductFacade;
import de.hybris.platform.catalog.model.CatalogVersionModel;
import de.hybris.platform.commercefacades.product.data.ProductData;
import de.hybris.platform.commercefacades.product.impl.DefaultProductVariantFacade;
import de.hybris.platform.core.model.product.ProductModel;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;

public class DefaultUtrendProductFacade  extends DefaultProductVariantFacade implements UtrendProductFacade
{
	@Override
	public ProductData modifyUtrendCreationDate(String code, LocalDate newCreationDate){

		try{
			ProductModel productModel = getProductService().getProductForCode(code);
			Date newDate = Date.from(newCreationDate.atStartOfDay(ZoneId.systemDefault()).toInstant());
			productModel.setUtrendCreationDate(newDate);

			getModelService().save(productModel);
		}catch (Exception ex){
			ex.printStackTrace();
		}

		return getProductForCodeAndOptions(code, null);
	}
}
