
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
package com.talos.talosacceleratoraddon.controllers.cms;

import com.talos.utrend.storefront.controllers.ControllerConstants;
import com.talos.utrend.storefront.controllers.cms.MiniCartComponentController;
import de.hybris.platform.acceleratorcms.model.components.MiniCartComponentModel;
import org.apache.commons.lang.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import static com.talos.talosacceleratoraddon.constants.TalosacceleratoraddonConstants.ADDON_PREFIX;


@RequestMapping(value = ControllerConstants.Actions.Cms.MiniCartComponent)
public class TCMiniCartComponentController extends MiniCartComponentController
{
	@Override
	protected String getView(MiniCartComponentModel component)
	{
		return ADDON_PREFIX + "/" + ControllerConstants.Views.Cms.ComponentPrefix + StringUtils.lowerCase(getTypeCode(component));
	}
}
