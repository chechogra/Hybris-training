package com.talos.utrend.facades.wishList.impl;

import com.talos.utrend.core.wishList.WishListService;
import com.talos.utrend.facades.wishList.UtrendWishListFacade;
import org.springframework.util.Assert;

import org.springframework.beans.factory.annotation.Required;

import javax.annotation.Resource;


public class DefaultUtrendWishListFacade implements UtrendWishListFacade
{
	@Resource(name = "wishListService")
	private WishListService wishListService;

	@Override
	public void sendWishList(String fromEmail, String email)
	{
		Assert.hasText(email, "The field [email] cannot be empty");
		getWishListService().sendWishList(fromEmail, email);
	}

	public WishListService getWishListService() { return wishListService; }

	@Required
	public void setWishListService(WishListService wishListService) { this.wishListService = wishListService; }
}
