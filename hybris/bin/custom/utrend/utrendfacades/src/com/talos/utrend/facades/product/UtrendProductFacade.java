package com.talos.utrend.facades.product;

import de.hybris.platform.commercefacades.product.ProductFacade;
import de.hybris.platform.commercefacades.product.ProductOption;
import de.hybris.platform.commercefacades.product.data.ProductData;
import de.hybris.platform.servicelayer.exceptions.UnknownIdentifierException;

import java.time.LocalDate;
import java.util.Collection;


public interface UtrendProductFacade extends ProductFacade
{
	ProductData modifyUtrendCreationDate(String code, LocalDate newCreationDate);
}
