package com.talos.talosacceleratoraddon.interceptors;

import com.talos.talosacceleratoraddon.constants.TalosacceleratoraddonConstants;
import de.hybris.platform.acceleratorstorefrontcommons.interceptors.BeforeViewHandler;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;


/**
 * Talos accelerator addon before view handler
 */
public class TalosAcceleratorAddonBeforeViewHandler implements BeforeViewHandler
{
	public static final String VIEW_NAME_MAP_KEY = "viewName";
	private Map<String, Map<String, String>> viewMap;

	@Override
	public void beforeView(final HttpServletRequest request, final HttpServletResponse response, final ModelAndView modelAndView)
			throws Exception
	{
		final String viewName = modelAndView.getViewName();
		if (viewMap.containsKey(viewName))
		{
			modelAndView.setViewName(TalosacceleratoraddonConstants.ADDON_PREFIX + viewMap.get(viewName).get(VIEW_NAME_MAP_KEY));
		}
	}

	public Map<String, Map<String, String>> getViewMap()
	{
		return viewMap;
	}

	public void setViewMap(final Map<String, Map<String, String>> viewMap)
	{
		this.viewMap = viewMap;
	}
}
