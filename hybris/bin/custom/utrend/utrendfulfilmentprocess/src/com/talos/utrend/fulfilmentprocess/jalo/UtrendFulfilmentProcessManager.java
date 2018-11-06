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
package com.talos.utrend.fulfilmentprocess.jalo;

import de.hybris.platform.jalo.JaloSession;
import de.hybris.platform.jalo.extension.ExtensionManager;
import com.talos.utrend.fulfilmentprocess.constants.UtrendFulfilmentProcessConstants;

@SuppressWarnings("PMD")
public class UtrendFulfilmentProcessManager extends GeneratedUtrendFulfilmentProcessManager
{
	public static final UtrendFulfilmentProcessManager getInstance()
	{
		ExtensionManager em = JaloSession.getCurrentSession().getExtensionManager();
		return (UtrendFulfilmentProcessManager) em.getExtension(UtrendFulfilmentProcessConstants.EXTENSIONNAME);
	}
	
}
