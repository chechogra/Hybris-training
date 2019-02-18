package com.talos.utrend.facades.process.email.context;

import com.talos.utrend.core.model.SendWishListProcessModel;
import de.hybris.platform.acceleratorservices.model.cms2.pages.EmailPageModel;
import de.hybris.platform.acceleratorservices.process.email.context.AbstractEmailContext;
import de.hybris.platform.basecommerce.model.site.BaseSiteModel;
import de.hybris.platform.core.model.c2l.LanguageModel;
import de.hybris.platform.core.model.user.CustomerModel;


public class WishListEmailContext extends AbstractEmailContext<SendWishListProcessModel>
{
	@Override
	protected BaseSiteModel getSite(SendWishListProcessModel businessProcessModel)
	{
		return null;
	}

	@Override
	protected CustomerModel getCustomer(SendWishListProcessModel businessProcessModel)
	{
		return null;
	}

	@Override
	protected LanguageModel getEmailLanguage(SendWishListProcessModel businessProcessModel)
	{
		return null;
	}

	@Override
	public void init(final SendWishListProcessModel sendWishListProcessModel, final EmailPageModel emailPageModel)
	{
		super.init(sendWishListProcessModel, emailPageModel);
		put(DISPLAY_NAME, "ANONYMOUS");
		put(FROM_EMAIL, sendWishListProcessModel.getFromEmail());
		put(EMAIL, sendWishListProcessModel.getEmail());
	}
}
