package com.talos.utrend.backoffice.widgets.actions.product;

import com.hybris.cockpitng.actions.ActionContext;
import com.hybris.cockpitng.actions.ActionResult;
import com.hybris.cockpitng.actions.CockpitAction;
import com.talos.utrend.core.product.UtrendProductService;
import de.hybris.platform.core.model.product.ProductModel;

import javax.annotation.Resource;

public class PopulateProductCreationDateCronJobAction implements CockpitAction<ProductModel, Object>
{

	@Resource(name = "utrendProductService")
	private UtrendProductService utrendProductService;

	@Override
	public ActionResult perform(ActionContext<ProductModel> actionContext)
	{
		try{
			utrendProductService.updateCreationDateByProduct(actionContext.getData().getCode());
		} catch (Exception ex){
			ex.printStackTrace();
			return new ActionResult(ActionResult.ERROR);
		}
		return new ActionResult(ActionResult.SUCCESS);
	}
}

