package com.talos.talosacceleratoraddon.controllers.misc;

import de.hybris.platform.addonsupport.controllers.AbstractAddOnController;
import de.hybris.platform.cms2.misc.UrlUtils;
import de.hybris.platform.servicelayer.i18n.I18NService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.context.ThemeSource;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ThemeResolver;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


@Controller
public class AdvancedFavIconController extends AbstractAddOnController
{
	private static final String FAVICON_APPLE_TOUCH = "img.favIcon.apple.touch";
	private static final String FAVICON_32_X_32 = "img.favIcon.32x32";
	private static final String FAVICON_16_X_16 = "img.favIcon.16x16";
	private static final String FAVICON_MANIFEST = "img.favIcon.manifest";
	private static final String FAVICON_SAFARI_PINNED_TAB = "img.favIcon.safari.pinned.tab";
	private static final String FAVICON_BROWSER_CONFIG = "img.favIcon.browser.config";
	private static final String FAVICON_ANDROID_CHROME_192_X_192 = "img.favIcon.android.chrome.192x192";
	private static final String FAVICON_ANDROID_CHROME_512_X_512 = "img.favIcon.android.chrome.512x512";
	private static final String FAVICON_MSTILE_150_X_150 = "img.favIcon.mstile.150x150";

	private static final String ORIGINAL_CONTEXT = "originalContextPath";

	@Resource(name = "themeResolver")
	private ThemeResolver themeResolver;

	@Resource(name = "themeSource")
	private ThemeSource themeSource;

	@Resource(name = "i18nService")
	private I18NService i18nService;

	@RequestMapping(value = "/apple-touch-icon.png", method = RequestMethod.GET)
	public String getFavIconAppleTouch(final HttpServletRequest request)
	{
		return getFavIconValue(request, FAVICON_APPLE_TOUCH);
	}

	@RequestMapping(value = "/favicon-32x32.png", method = RequestMethod.GET)
	public String getFavicon32X32(final HttpServletRequest request)
	{
		return getFavIconValue(request, FAVICON_32_X_32);
	}

	@RequestMapping(value = "/favicon-16x16.png", method = RequestMethod.GET)
	public String getFavicon16X16(final HttpServletRequest request)
	{
		return getFavIconValue(request, FAVICON_16_X_16);
	}

	@RequestMapping(value = "/manifest.json", method = RequestMethod.GET)
	public String getFaviconManifest(final HttpServletRequest request)
	{
		return getFavIconValue(request, FAVICON_MANIFEST);
	}

	@RequestMapping(value = "/safari-pinned-tab.svg", method = RequestMethod.GET)
	public String getFaviconSafariPinnedTab(final HttpServletRequest request)
	{
		return getFavIconValue(request, FAVICON_SAFARI_PINNED_TAB);
	}



	@RequestMapping(value = "/browserconfig.xml", method = RequestMethod.GET)
	public String getFaviconBrowserConfig(final HttpServletRequest request)
	{
		return getFavIconValue(request, FAVICON_BROWSER_CONFIG);
	}

	@RequestMapping(value = "/android-chrome-192x192.png", method = RequestMethod.GET)
	public String getFaviconAndroidChrome192x192(final HttpServletRequest request)
	{
		return getFavIconValue(request, FAVICON_ANDROID_CHROME_192_X_192);
	}

	@RequestMapping(value = "/android-chrome-512x512.svg", method = RequestMethod.GET)
	public String getFaviconAndroidChrome512x512(final HttpServletRequest request)
	{
		return getFavIconValue(request, FAVICON_ANDROID_CHROME_512_X_512);
	}

	@RequestMapping(value = "/mstile-150x150.png", method = RequestMethod.GET)
	public String getFaviconMstile(final HttpServletRequest request)
	{
		return getFavIconValue(request, FAVICON_MSTILE_150_X_150);
	}

	/**
	 * Get the favicon value depending on the current theme
	 *
	 * @param request            the request object
	 * @param favIconKeyProperty the favicon key
	 * @return the resolved path
	 */
	@SuppressWarnings("Duplicates")
	private String getFavIconValue(final HttpServletRequest request, String favIconKeyProperty)
	{
		final String themeName = themeResolver.resolveThemeName(request);
		String iconPath = themeSource.getTheme(themeName).getMessageSource()
				.getMessage(favIconKeyProperty, new Object[] {}, i18nService.getCurrentLocale());
		final String originalContextPath = (String) request.getAttribute(ORIGINAL_CONTEXT);
		final String hostUrl = UrlUtils.extractHostInformationFromRequest(request);
		iconPath = hostUrl + originalContextPath + iconPath;
		return REDIRECT_PREFIX + iconPath;
	}
}
