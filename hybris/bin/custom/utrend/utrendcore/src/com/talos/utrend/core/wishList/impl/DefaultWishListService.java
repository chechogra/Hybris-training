package com.talos.utrend.core.wishList.impl;

import com.talos.utrend.core.event.SendWishListEvent;
import com.talos.utrend.core.wishList.WishListService;
import de.hybris.platform.servicelayer.event.EventService;
import de.hybris.platform.servicelayer.i18n.CommonI18NService;
import de.hybris.platform.site.BaseSiteService;
import de.hybris.platform.store.services.BaseStoreService;
import org.springframework.beans.factory.annotation.Required;

import javax.annotation.Resource;


public class DefaultWishListService implements WishListService
{

	@Resource(name = "eventService")
	private EventService eventService;

	@Resource(name = "baseStoreService")
	private BaseStoreService baseStoreService;

	@Resource(name = "baseSiteService")
	private BaseSiteService baseSiteService;

	@Resource(name = "commonI18NService")
	private CommonI18NService commonI18NService;

	@Override
	public void sendWishList(String fromEmail, String email)
	{
		SendWishListEvent event = new SendWishListEvent(fromEmail, email);

		event.setBaseStore(getBaseStoreService().getCurrentBaseStore());
		event.setSite(getBaseSiteService().getCurrentBaseSite());
		event.setLanguage(getCommonI18NService().getCurrentLanguage());
		event.setCurrency(getCommonI18NService().getCurrentCurrency());

		getEventService().publishEvent(event);
	}

	public EventService getEventService() { return eventService; }

	@Required
	public void setEventService(EventService eventService) { this.eventService = eventService; }

	public BaseStoreService getBaseStoreService()
	{
		return baseStoreService;
	}

	@Required
	public void setBaseStoreService(BaseStoreService baseStoreService)
	{
		this.baseStoreService = baseStoreService;
	}

	public BaseSiteService getBaseSiteService()
	{
		return baseSiteService;
	}

	@Required
	public void setBaseSiteService(BaseSiteService baseSiteService)
	{
		this.baseSiteService = baseSiteService;
	}

	public CommonI18NService getCommonI18NService()
	{
		return commonI18NService;
	}

	@Required
	public void setCommonI18NService(CommonI18NService commonI18NService)
	{
		this.commonI18NService = commonI18NService;
	}
}
