package com.talos.talosacceleratoraddon.controllers.cms;

import com.talos.utrend.storefront.controllers.ControllerConstants;
import com.talos.utrend.storefront.controllers.cms.CMSTabParagraphContainerController;
import de.hybris.platform.acceleratorcms.model.components.CMSTabParagraphContainerModel;
import org.apache.commons.lang.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import static com.talos.talosacceleratoraddon.constants.TalosacceleratoraddonConstants.ADDON_PREFIX;


@RequestMapping(value = ControllerConstants.Actions.Cms.CMSTabParagraphContainer)
public class TCCMSTabParagraphContainerController extends CMSTabParagraphContainerController
{
	@Override
	protected String getView(CMSTabParagraphContainerModel component)
	{
		return ADDON_PREFIX + "/" + ControllerConstants.Views.Cms.ComponentPrefix + StringUtils.lowerCase(getTypeCode(component));
	}
}
