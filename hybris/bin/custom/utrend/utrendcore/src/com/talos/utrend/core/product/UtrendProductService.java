package com.talos.utrend.core.product;

import java.util.Date;
import de.hybris.platform.product.ProductService;


public interface UtrendProductService extends ProductService
{
	void updateCreationDateAllProducts(Date creationDate);
	void updateCreationDateByProduct(String code);
}
