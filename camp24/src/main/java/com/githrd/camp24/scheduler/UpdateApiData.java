package com.githrd.camp24.scheduler;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

public class UpdateApiData extends QuartzJobBean {
	private UpdateApi upApi;
	
	@Override
	protected void executeInternal(JobExecutionContext context) throws JobExecutionException {
		upApi.upApi();
	}

	public void setUpApi(UpdateApi upApi) {
		this.upApi = upApi;
	}
}