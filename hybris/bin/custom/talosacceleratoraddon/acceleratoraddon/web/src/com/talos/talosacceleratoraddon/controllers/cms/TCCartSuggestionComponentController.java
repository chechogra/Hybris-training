package com.talos.talosacceleratoraddon.controllers.cms;

import com.talos.utrend.storefront.controllers.ControllerConstants;
import com.talos.utrend.storefront.controllers.cms.CartSuggestionComponentController;
import de.hybris.platform.acceleratorcms.model.components.CartSuggestionComponentModel;
import de.hybris.platform.acceleratorcms.model.components.SimpleSuggestionComponentModel;
import org.apache.commons.lang.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import static com.talos.talosacceleratoraddon.constants.TalosacceleratoraddonConstants.ADDON_PREFIX;


@RequestMapping(value = ControllerConstants.Actions.Cms.CartSuggestionComponent)
public class TCCartSuggestionComponentController extends CartSuggestionComponentController
{
	@Override
	protected String getView(final CartSuggestionComponentModel component)
	{
		return ADDON_PREFIX + "/" + ControllerConstants.Views.Cms.ComponentPrefix + StringUtils.lowerCase(
				SimpleSuggestionComponentModel._TYPECODE);
	}
}
