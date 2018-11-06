/*
 * [y] hybris Platform
 *
 * Copyright (c) 2017 SAP SE or an SAP affiliate company.  All rights reserved.
 *
 * This software is the confidential and proprietary information of SAP
 * ("Confidential Information"). You shall not disclose such Confidential
 * Information and shall use it only in accordance with the terms of the
 * license agreement you entered into with SAP.
 */
package com.talos.utrend.initialdata.services;

import de.hybris.platform.commerceservices.dataimport.impl.SampleDataImportService;
import de.hybris.platform.servicelayer.cronjob.CronJobService;
import org.springframework.beans.factory.annotation.Required;


public class UTrendSampleDataImportService extends SampleDataImportService
{
	private static final String IMAGEMAGICK_CRONJOB_ID = "imagemagick.cronjob.id";
	private CronJobService cronJobService;

	@Override
	protected void importProductCatalog(final String extensionName, final String productCatalogName)
	{
		super.importProductCatalog(extensionName, productCatalogName);

		String cronJobId = getConfigurationService().getConfiguration().getString(IMAGEMAGICK_CRONJOB_ID);
		if (null != cronJobId && null != cronJobService.getCronJob(cronJobId))
		{
			cronJobService.performCronJob(cronJobService.getCronJob(cronJobId), true);
		}
	}

	public CronJobService getCronJobService() {
		return cronJobService;
	}

	@Required
	public void setCronJobService(CronJobService cronJobService) {
		this.cronJobService = cronJobService;
	}
}
