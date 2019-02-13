package com.talos.utrend.core.product.impl;

import com.talos.utrend.core.product.UtrendProductDAO;
import com.talos.utrend.core.product.UtrendProductService;
import de.hybris.platform.catalog.CatalogVersionService;
import de.hybris.platform.catalog.model.CatalogVersionModel;
import de.hybris.platform.core.model.product.ProductModel;
import de.hybris.platform.product.impl.DefaultProductService;
import org.springframework.beans.factory.annotation.Required;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;


public class DefaultUtrendProductService extends DefaultProductService implements UtrendProductService
{

	private static String CATALOG_ID = "utrendProductCatalog";
	private static String CATALOG_VERSION_NAME = "Staged";


	@Resource(name = "utrendProductDAO")
	private UtrendProductDAO utrendProductDAO;

	@Resource(name = "catalogVersionService")
	private CatalogVersionService catalogVersionService;

	@Override
	public void updateCreationDateAllProducts(Date creationDate)
	{
		List<ProductModel> productModelList = getUtrendProductDAO().getAllProducts();
		for (ProductModel product: productModelList){
			product.setUtrendCreationDate(creationDate);
			getModelService().save(product);
		}
	}

	@Override
	public void updateCreationDateByProduct(String code)
	{

		CatalogVersionModel catalogVersionModel = getCatalogVersionService().getCatalogVersion(CATALOG_ID,CATALOG_VERSION_NAME);
		ProductModel productModel = getProductForCode(catalogVersionModel,code);
		productModel.setUtrendCreationDate(new Date());
		getModelService().save(productModel);
	}

	public UtrendProductDAO getUtrendProductDAO()
	{
		return utrendProductDAO;
	}

	@Required
	public void setUtrendProductDAO(UtrendProductDAO utrendProductDAO)
	{
		this.utrendProductDAO = utrendProductDAO;
	}

	public CatalogVersionService getCatalogVersionService()
	{
		return catalogVersionService;
	}

	@Required
	public void setCatalogVersionService(CatalogVersionService catalogVersionService)
	{
		this.catalogVersionService = catalogVersionService;
	}
}


