package com.talos.utrend.storefront.forms;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


public class CreationDateForm
{
	private Date creationDate;

	/**
	 *
	 * @return
	 */
	public Date getCreationDate()
	{
		return creationDate;
	}

	/**
	 *
	 * @param creationDate
	 */
	public void setCreationDate(String creationDate)
	{
		Date date1 = null;

		try
		{
			date1=new SimpleDateFormat("dd/MM/yyyy").parse(creationDate);
		}
		catch (ParseException e)
		{
			e.printStackTrace();
		}
		this.creationDate = date1;
	}
}
