package com.talos.utrend.facades.product;

import de.hybris.platform.commercefacades.product.data.ProductData;
import de.hybris.platform.commercefacades.product.impl.DefaultProductFacade;
import de.hybris.platform.core.model.product.ProductModel;
import org.springframework.util.Assert;

import java.util.Date;


public class UtrendProductFacade extends DefaultProductFacade<ProductModel>
{
	public void postCreationDate(final String productCode, final ProductData data)
	{
		Assert.notNull(data, "Parameter reviewData cannot be null.");
		final ProductModel productModel = getProductService().getProductForCode(productCode);
//		final UserModel userModel = getUserService().getCurrentUser();
//		final CustomerReviewModel customerReviewModel = getCustomerReviewService().createCustomerReview(reviewData.getRating(),
//				reviewData.getHeadline(), reviewData.getComment(), userModel, productModel);
//		customerReviewModel.setLanguage(getCommonI18NService().getCurrentLanguage());
//		customerReviewModel.setAlias(reviewData.getAlias());
		productModel.setCreationDate(data.getCreationDate());
		getModelService().save(productModel);
		//return getProductConverter().convert(productModel);
	}
}
