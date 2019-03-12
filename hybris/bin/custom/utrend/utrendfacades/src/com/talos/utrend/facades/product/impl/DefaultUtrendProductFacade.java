package com.talos.utrend.facades.product.impl;

import com.talos.utrend.facades.product.UtrendProductFacade;
import de.hybris.platform.commercefacades.product.impl.DefaultProductVariantFacade;
import de.hybris.platform.core.model.product.ProductModel;

import java.util.Date;


/**
 * The default Utrend Product Facade implementation
 */
public class DefaultUtrendProductFacade extends DefaultProductVariantFacade implements UtrendProductFacade
{
	@Override
	public void updateCreationDate(String productCode, Date creationDate)
	{
		ProductModel product = this.getProductService().getProductForCode(productCode);
		product.setUtrendCreationDate(creationDate);
		this.getModelService().save(product);
	}
}
