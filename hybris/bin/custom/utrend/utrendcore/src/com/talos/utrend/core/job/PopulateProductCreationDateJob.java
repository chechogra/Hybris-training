package com.talos.utrend.core.job;

import com.talos.utrend.core.model.PopulateProductCreationDateCronJobModel;
import com.talos.utrend.core.product.UtrendProductService;
import de.hybris.platform.cronjob.enums.CronJobResult;
import de.hybris.platform.cronjob.enums.CronJobStatus;
import de.hybris.platform.servicelayer.cronjob.AbstractJobPerformable;
import de.hybris.platform.servicelayer.cronjob.PerformResult;
import de.hybris.platform.servicelayer.time.TimeService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Required;

import javax.annotation.Resource;
import java.util.Date;


public class PopulateProductCreationDateJob  extends AbstractJobPerformable<PopulateProductCreationDateCronJobModel>
{
	private static final Logger LOG = Logger.getLogger(PopulateProductCreationDateJob.class);

	@Resource(name = "timeService")
	private TimeService timeService;

	@Resource(name = "utrendProductService")
	private UtrendProductService utrendProductService;

	@Override
	public PerformResult perform(final PopulateProductCreationDateCronJobModel populateProductCreationDateCronJobModel)
	{
		final Date currentDate = getTimeService().getCurrentTime();
		try{
			getUtrendProductService().updateCreationDateAllProducts(currentDate);
		} catch (Exception ex){
			ex.printStackTrace();
			LOG.warn("Something is wrong with the job");
			return new PerformResult(CronJobResult.FAILURE, CronJobStatus.ABORTED);
		}
		LOG.debug("*          SUCCESS              *");
		return new PerformResult(CronJobResult.SUCCESS, CronJobStatus.FINISHED);
	}

	protected TimeService getTimeService()
	{
		return timeService;
	}

	@Required
	public void setTimeService(final TimeService timeService)
	{
		this.timeService = timeService;
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

}
