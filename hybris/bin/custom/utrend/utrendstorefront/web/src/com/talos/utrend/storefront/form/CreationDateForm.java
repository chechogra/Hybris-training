package com.talos.utrend.storefront.form;

import org.joda.time.DateTime;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


public class CreationDateForm
{

	private Date creationDate;

	public Date getCreationDate()
	{
		return creationDate;
	}

	public void setCreationDate(String creationDate)
	{

		try
		{
			this.creationDate = new SimpleDateFormat("dd/MM/yyyy").parse(creationDate); // DateTime.parse(creationDate).toDate();
		}
		catch (ParseException e)
		{
			e.printStackTrace();
		}

	}
}
