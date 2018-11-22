package com.talos.utrend.facades.product.impl;

import de.hybris.platform.commercefacades.product.data.ProductData;
import de.hybris.platform.commercefacades.product.impl.DefaultProductFacade;
import de.hybris.platform.core.model.product.ProductModel;


public class DefaultProductCreationDateFacade extends DefaultProductFacade<ProductModel>
{
	//private ProductCreationDateService creationDateService;
	//private ProductService productService;
	//private ModelService modelService;

	public void updateCreationDate(String productCode, ProductData productData)
	{
		final ProductModel productModel = getProductService().getProductForCode(productCode);
		productModel.setUtrendCreationDate(productData.getCreationDate());
		getModelService().save(productModel);
	}

	/*public ProductCreationDateService getCreationDateService()
	{
		return creationDateService;
	}

	public void setCreationDateService(ProductCreationDateService creationDateService)
	{
		this.creationDateService = creationDateService;
	}*/

}
