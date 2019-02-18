package com.talos.utrend.core.event;

import com.talos.utrend.core.model.SendWishListProcessModel;
import de.hybris.platform.acceleratorservices.site.AbstractAcceleratorSiteEventListener;
import de.hybris.platform.basecommerce.model.site.BaseSiteModel;
import de.hybris.platform.commerceservices.enums.SiteChannel;
import de.hybris.platform.processengine.BusinessProcessService;
import de.hybris.platform.servicelayer.model.ModelService;
import de.hybris.platform.servicelayer.util.ServicesUtil;
import org.springframework.beans.factory.annotation.Required;


public class SendWishListEventListener extends AbstractAcceleratorSiteEventListener<SendWishListEvent>
{

	private BusinessProcessService businessProcessService;
	private ModelService modelService;

	@Override
	protected SiteChannel getSiteChannelForEvent(SendWishListEvent event)
	{
		final BaseSiteModel site = event.getSite();
		ServicesUtil.validateParameterNotNullStandardMessage("event.site", site);
		return site.getChannel();
	}

	@Override
	protected void onSiteEvent(SendWishListEvent event)
	{
		String processIdentifier = "sendWishList-" + event.getFromEmail() + "-" + System.currentTimeMillis();
		final SendWishListProcessModel sendWishListProcessModel = getBusinessProcessService()
				.createProcess(processIdentifier ,"sendWishListProcess");
		sendWishListProcessModel.setSite(event.getSite());
		sendWishListProcessModel.setStore(event.getBaseStore());
		sendWishListProcessModel.setFromEmail(event.getFromEmail());
		sendWishListProcessModel.setEmail(event.getEmail());
		getModelService().save(sendWishListProcessModel);
		getBusinessProcessService().startProcess(sendWishListProcessModel);
	}

	public BusinessProcessService getBusinessProcessService() { return businessProcessService; }

	@Required
	public void setBusinessProcessService(BusinessProcessService businessProcessService) { this.businessProcessService = businessProcessService; }

	public ModelService getModelService()
	{
		return modelService;
	}

	@Required
	public void setModelService(ModelService modelService)
	{
		this.modelService = modelService;
	}
}
