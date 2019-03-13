package com.talos.utrend.storefront.forms.product;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;


/**
 * Form object for changing the product creation date
 */
public class CreationDateForm
{
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date creationDate;

	public Date getCreationDate()
	{
		return creationDate;
	}

	public void setCreationDate(Date creationDate)
	{
		this.creationDate = creationDate;
	}
}
