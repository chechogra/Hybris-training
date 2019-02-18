package com.talos.utrend.core.event;

import de.hybris.platform.basecommerce.model.site.BaseSiteModel;
import de.hybris.platform.commerceservices.event.AbstractCommerceUserEvent;


public class SendWishListEvent extends AbstractCommerceUserEvent<BaseSiteModel>
{
	private String email;
	private String fromEmail;

	public SendWishListEvent() {super();}

	public SendWishListEvent(String fromEmail, String email) {
		super();
		this.fromEmail = fromEmail;
		this.email = email;
	}

	public String getEmail()
	{
		return email;
	}

	public void setEmail(String email)
	{
		this.email = email;
	}

	public String getFromEmail()
	{
		return fromEmail;
	}

	public void setFromEmail(String fromEmail)
	{
		this.fromEmail = fromEmail;
	}
}
