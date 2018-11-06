package com.talos.talosacceleratoraddon.component.renderer;

import com.talos.talosacceleratoraddon.constants.TalosacceleratoraddonConstants;
import de.hybris.platform.acceleratorcms.model.components.CategoryNavigationComponentModel;
import de.hybris.platform.addonsupport.renderer.impl.DefaultAddOnCMSComponentRenderer;

import javax.servlet.jsp.PageContext;
import java.util.Map;


public class TCCategoryNavigationComponentRenderer<C extends CategoryNavigationComponentModel> extends
		DefaultAddOnCMSComponentRenderer<C>
{
	private static final String COMPONENT = "component";

	@Override
	protected Map<String, Object> getVariablesToExpose(final PageContext pageContext, final C component)
	{
		final Map<String, Object> model = super.getVariablesToExpose(pageContext, component);
		model.put(COMPONENT, component);
		return model;
	}

	@Override
	protected String getAddonUiExtensionName(final C component)
	{
		return TalosacceleratoraddonConstants.EXTENSIONNAME;
	}
}
