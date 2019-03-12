package com.talos.utrend.facades.product;

import de.hybris.platform.commercefacades.product.ProductFacade;

import java.util.Date;


/**
 * Utrend Product facade interface that extends the base Product Facade
 */
public interface UtrendProductFacade extends ProductFacade
{
	/**
	 * Updates the creation date for specified product code.
	 *
	 * @param productCode  the product which creation date will be updated
	 * @param creationDate the creation date to be persisted in the system
	 */
	void updateCreationDate(String productCode, Date creationDate);
}
