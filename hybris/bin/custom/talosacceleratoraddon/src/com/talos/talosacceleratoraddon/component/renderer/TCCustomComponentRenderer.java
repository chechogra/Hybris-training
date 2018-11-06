package com.talos.talosacceleratoraddon.component.renderer;

import com.talos.talosacceleratoraddon.constants.TalosacceleratoraddonConstants;
import de.hybris.platform.addonsupport.renderer.impl.DefaultAddOnCMSComponentRenderer;
import de.hybris.platform.cms2.model.contents.components.SimpleCMSComponentModel;

import javax.servlet.jsp.PageContext;
import java.util.HashMap;
import java.util.Map;


public class TCCustomComponentRenderer<C extends SimpleCMSComponentModel> extends
		DefaultAddOnCMSComponentRenderer<C>
{
	private final static String COMPONENT = "component";
	private final static String ACTIONS = "actions";

	@Override
	protected Map<String, Object> getVariablesToExpose(final PageContext pageContext, final C component)
	{
		final Map<String, Object> model = new HashMap<String, Object>();
		model.put(COMPONENT, component);
		model.put(ACTIONS, component.getActions());
		return model;
	}

	@Override
	protected String getAddonUiExtensionName(final C component)
	{
		return TalosacceleratoraddonConstants.EXTENSIONNAME;
	}
}
