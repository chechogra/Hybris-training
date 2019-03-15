package com.talos.utrend.backoffice.widgets.actions;

import com.hybris.cockpitng.actions.ActionContext;
import com.hybris.cockpitng.actions.ActionResult;
import com.hybris.cockpitng.actions.CockpitAction;
import de.hybris.platform.core.model.product.ProductModel;
import de.hybris.platform.servicelayer.exceptions.ModelSavingException;
import de.hybris.platform.servicelayer.model.ModelService;
import de.hybris.platform.servicelayer.time.TimeService;
import org.apache.log4j.Logger;
import org.zkoss.zul.Messagebox;

import javax.annotation.Resource;


public class UpdateProductCreationDateAction implements CockpitAction<ProductModel, ProductModel>
{
	private static final Logger LOG = Logger.getLogger(UpdateProductCreationDateAction.class);

	@Resource(name = "modelService")
	private ModelService modelService;

	@Resource(name = "timeService")
	private TimeService timeService;

	@Override
	public ActionResult<ProductModel> perform(ActionContext<ProductModel> actionContext)
	{
		try
		{
			ProductModel product = actionContext.getData();
			product.setUtrendCreationDate(timeService.getCurrentTime());

			modelService.save(product);

			Messagebox.show(
					actionContext.getLabel("action.update.product.creation.date.updated"),
					actionContext.getLabel("action.update.product.creation.date.title"),
					Messagebox.OK, Messagebox.INFORMATION);

			return new ActionResult<>(ActionResult.SUCCESS);
		}
		catch (ModelSavingException ex)
		{
			LOG.error("Error while updating the product's creation date, cause: " + ex.getMessage());

			Messagebox.show(
					actionContext.getLabel("action.update.product.creation.date.error"),
					actionContext.getLabel("action.update.product.creation.date.title"),
					Messagebox.OK, Messagebox.ERROR);

			return new ActionResult<>(ActionResult.ERROR);
		}
	}

	@Override
	public boolean canPerform(ActionContext<ProductModel> ctx)
	{
		return true;
	}
}
