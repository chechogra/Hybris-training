package com.talos.utrend.core.job;

import com.talos.utrend.core.product.UtrendProductService;
import de.hybris.platform.core.model.product.ProductModel;
import de.hybris.platform.cronjob.enums.CronJobResult;
import de.hybris.platform.cronjob.enums.CronJobStatus;
import de.hybris.platform.cronjob.model.CronJobModel;
import de.hybris.platform.servicelayer.cronjob.AbstractJobPerformable;
import de.hybris.platform.servicelayer.cronjob.PerformResult;
import de.hybris.platform.servicelayer.exceptions.ModelSavingException;
import de.hybris.platform.servicelayer.model.ModelService;
import de.hybris.platform.servicelayer.time.TimeService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Required;

import java.util.Date;
import java.util.List;


public class PopulatingCreatedDateJobPerformable extends AbstractJobPerformable<CronJobModel>
{
	private static final Logger LOG = Logger.getLogger(PopulatingCreatedDateJobPerformable.class);

	UtrendProductService utrendProductService;
	ModelService modelService;
	TimeService timeService;

	@Override
	public PerformResult perform(CronJobModel cronJobModel)
	{
		Date currentDate = getTimeService().getCurrentTime();

		List<ProductModel> products = getUtrendProductService().getAllProducts();
		products.forEach(product -> product.setUtrendCreationDate(currentDate));

		try
		{
			modelService.saveAll(products);

			LOG.info("****************************");
			LOG.info("*        SUCCESS!!!        *");
			LOG.info("****************************");

			return new PerformResult(CronJobResult.SUCCESS, CronJobStatus.FINISHED);
		}
		catch (ModelSavingException ex)
		{
			LOG.error("Couldn't update the creation Date for all products, cause: " + ex.getMessage());
			return new PerformResult(CronJobResult.FAILURE, CronJobStatus.ABORTED);
		}
	}

	public UtrendProductService getUtrendProductService()
	{
		return utrendProductService;
	}

	@Required
	public void setUtrendProductService(UtrendProductService utrendProductService)
	{
		this.utrendProductService = utrendProductService;
	}

	public ModelService getModelService()
	{
		return modelService;
	}

	@Override
	@Required
	public void setModelService(ModelService modelService)
	{
		this.modelService = modelService;
	}

	public TimeService getTimeService()
	{
		return timeService;
	}

	@Required
	public void setTimeService(TimeService timeService)
	{
		this.timeService = timeService;
	}
}
