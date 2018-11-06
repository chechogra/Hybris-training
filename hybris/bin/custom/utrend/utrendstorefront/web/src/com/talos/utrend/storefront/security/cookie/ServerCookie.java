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
package com.talos.utrend.storefront.security.cookie;

// This code is copied from org.apache.tomcat.util.http.ServerCookie

/*
 *  Licensed to the Apache Software Foundation (ASF) under one or more
 *  contributor license agreements.  See the NOTICE file distributed with
 *  this work for additional information regarding copyright ownership.
 *  The ASF licenses this file to You under the Apache License, Version 2.0
 *  (the "License"); you may not use this file except in compliance with
 *  the License.  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */

/*
 *  This file was changed on 07.01.2016. Modified methods:
 *  escapeDoubleQuotes
 *  modifyDoubleQuotesChar
 *
 *  11.01.2016:
 *  The order of methods in CookieSupport class was modified
 *  introduction of new method hasCookieSupport, therefore the following methods have been modified:
 *  getNewVersionFromTokenInPathOrDomain
 *  getNewVersionFromTokenInValueOrComment
 *
 *  21.01.2016. Modified methods:
 *  isHttpSeparator
 *  isV0Separator
 */

import java.io.Serializable;
import java.text.DateFormat;
import java.text.FieldPosition;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;


/**
 * Stripped out org.apache.tomcat.util.http.ServerCookie for use of #appendCookieValue(StringBuffer, int, String,
 * String, String, String, String, int, boolean, boolean)
 */
@SuppressWarnings("PMD")
// As this code is coped from org.apache.tomcat.util.http.ServerCookie and not written to hybris standards it does not meet PMD rules
public class ServerCookie implements Serializable
{
	private static final long serialVersionUID = 1L;

	// Other fields
	private static final String OLD_COOKIE_PATTERN = "EEE, dd-MMM-yyyy HH:mm:ss z";
	private static final ThreadLocal<DateFormat> OLD_COOKIE_FORMAT = new ThreadLocal<DateFormat>()
	{
		@Override
		protected DateFormat initialValue()
		{
			final DateFormat df = new SimpleDateFormat(OLD_COOKIE_PATTERN, Locale.US);
			df.setTimeZone(TimeZone.getTimeZone("GMT"));
			return df;
		}
	};

	private static final String ancientDate;  // NOSONAR

	static
	{
		ancientDate = OLD_COOKIE_FORMAT.get().format(new Date(10000));
	}

	// Note: Servlet Spec =< 3.0 only refers to Netscape and RFC2109,
	// not RFC2965

	// Version 2 (RFC2965) attributes that would need to be added to support
	// v2 cookies
	// CommentURL
	// Discard - implied by maxAge <0
	// Port

	private ServerCookie()
	{
		// NOOP
	}

	// -------------------- Cookie parsing tools


	public static void appendCookieValue(final StringBuffer headerBuf, final int version, final String name, final String value, // NOSONAR
			final String path, final String domain, final String comment, final int maxAge, final boolean isSecure,
			final boolean isHttpOnly)
	{

		// StringBuffer cannot be replaced by StringBuilder inside this whole method due to the type used in functions called later on
		final StringBuffer buf = new StringBuffer(); // NOSONAR
		// Servlet implementation checks name
		buf.append(name);
		buf.append("=");
		// Servlet implementation does not check anything else

		/*
		 * The spec allows some latitude on when to send the version attribute with a Set-Cookie header. To be nice to
		 * clients, we'll make sure the version attribute is first. That means checking the various things that can cause
		 * us to switch to a v1 cookie first.
		 * 
		 * Note that by checking for tokens we will also throw an exception if a control character is encountered.
		 */
		// Start by using the version we were asked for

		int newVersion = getNewVersionBeforeCookieHeader(value, path, domain, comment, version);


		// Now build the cookie header
		addVersionAndDomainInfo(value, domain, comment, buf, newVersion);

		addMaxAgeInfo(maxAge, buf, newVersion);

		// Path=path
		if (path != null)
		{
			buf.append("; Path=");
			maybeQuote(buf, path);
		}

		// Secure
		if (isSecure)
		{
			buf.append("; Secure");
		}

		// HttpOnly
		if (isHttpOnly)
		{
			buf.append("; HttpOnly");
		}
		headerBuf.append(buf);
	}

	protected static void addMaxAgeInfo(final int maxAge, final StringBuffer buf, final int newVersion) // NOSONAR
	{
		// Max-Age=secs ... or use old "Expires" format
		if (maxAge >= 0)
		{
			if (newVersion > 0)
			{
				buf.append("; Max-Age=");
				buf.append(maxAge);
			}
			// IE6, IE7 and possibly other browsers don't understand Max-Age.
			// They do understand Expires, even with V1 cookies!
			if (newVersion == 0 || CookieSupport.ALWAYS_ADD_EXPIRES)
			{
				// Wdy, DD-Mon-YY HH:MM:SS GMT ( Expires Netscape format )
				buf.append("; Expires=");
				// To expire immediately we need to set the time in past
				if (maxAge == 0)
				{
					buf.append(ancientDate);
				}
				else
				{
					OLD_COOKIE_FORMAT.get().format(new Date(System.currentTimeMillis() + maxAge * 1000L), buf, new FieldPosition(0));
				}
			}
		}
	}

	protected static void addVersionAndDomainInfo(final String value, final String domain, final String comment,
												final StringBuffer buf, final int newVersion) // NOSONAR
	{
		// Value
		maybeQuote(buf, value);
		// Add version 1 specific information
		if (newVersion == 1)
		{
			// Version=1 ... required
			buf.append("; Version=1");

			// Comment=comment
			if (comment != null)
			{
				buf.append("; Comment=");
				maybeQuote(buf, comment);
			}
		}

		// Add domain information, if present
		if (domain != null)
		{
			buf.append("; Domain=");
			maybeQuote(buf, domain);
		}
	}

	protected static int getNewVersionBeforeCookieHeader(final String value, final String path, final String domain,
													   final String comment, final int version)
	{
		int newVersion = getNewVersionFromTokenInValueOrComment(value, comment, version);
		if (newVersion == 0) {
			newVersion = getNewVersionFromTokenInPathOrDomain(path, domain, newVersion);
		}
		return newVersion;
	}

	protected static int getNewVersionFromTokenInPathOrDomain(final String path, final String domain, final int version)
	{
		int newVersion = version;
		
		if (hasCookieSupport(path))
		{
			// HTTP token in path - need to use v1
			newVersion = 1;
		}

		if (newVersion == 0	&& hasCookieSupport(domain))
		{
			// HTTP token in domain - need to use v1
			newVersion = 1;
		}
		return newVersion;
	}

	protected static boolean hasCookieSupport(String value) {
		return !CookieSupport.ALLOW_HTTP_SEPARATORS_IN_V0 && CookieSupport.isHttpToken(value) || CookieSupport.ALLOW_HTTP_SEPARATORS_IN_V0
				&& CookieSupport.isV0Token(value);
	}

	protected static int getNewVersionFromTokenInValueOrComment(final String value, final String comment, final int version)
	{
		int newVersion = version;

		// If it is v0, check if we need to switch
		if (newVersion == 0	&& hasCookieSupport(value))
		{
			// HTTP token in value - need to use v1
			newVersion = 1;
		}

		if (newVersion == 0 && comment != null)
		{
			// Using a comment makes it a v1 cookie
			newVersion = 1;
		}
		return newVersion;
	}

	/**
	 * Quotes values if required.
	 * 
	 * @param buf
	 * @param value
	 */
	protected static void maybeQuote(final StringBuffer buf, final String value) //NOSONAR
	{
		// StringBuffer cannot be replaced by StringBuilder due to the type used in functions called later on
		if (value == null || value.isEmpty())
		{
			buf.append("\"\"");
		}
		else if (CookieSupport.alreadyQuoted(value))
		{
			buf.append('"');
			buf.append(escapeDoubleQuotes(value, 1, value.length() - 1));
			buf.append('"');
		}
		else if (CookieSupport.isHttpToken(value) && !CookieSupport.ALLOW_HTTP_SEPARATORS_IN_V0 || CookieSupport.isV0Token(value)
				&& CookieSupport.ALLOW_HTTP_SEPARATORS_IN_V0)
		{
			buf.append('"');
			buf.append(escapeDoubleQuotes(value, 0, value.length()));
			buf.append('"');
		}
		else
		{
			buf.append(value);
		}
	}


	/**
	 * Escapes any double quotes in the given string.
	 * 
	 * @param s
	 *           the input string
	 * @param beginIndex
	 *           start index inclusive
	 * @param endIndex
	 *           exclusive
	 * @return The (possibly) escaped string
	 */
	protected static String escapeDoubleQuotes(final String s, final int beginIndex, final int endIndex)
	{

		if (s == null || s.isEmpty() || s.indexOf('"') == -1)
		{
			return s;
		}

		final StringBuilder result = new StringBuilder();
		boolean ignoreChar = false;
		for (int i = beginIndex; i < endIndex; i++)
		{
			if (!ignoreChar)
			{
				final char c = s.charAt(i);
				ignoreChar = modifyDoubleQuotesChar(s, endIndex, result, i, c);
			}
			else
			{
				ignoreChar = false;
			}
		}

		return result.toString();
	}

	/**
	 * This method is modifying result param due to charString value. If "\\", then we add this character to result and
	 * add next char if this was not the end of passed string. If charString '"', then escape it with \\. All other
	 * will just append charString param.
	 *
	 * @return true when '\\' was present in the string, otherwise false
	 */
	protected static boolean modifyDoubleQuotesChar(final String processedString, final int endIndex, final StringBuilder result,
			int stringIndex, final char charString)
	{
		if (charString == '\\')
		{
			result.append(charString);
			//ignore the character after an escape, just append it
			if (stringIndex >= endIndex - 1)
			{
				throw new IllegalArgumentException("Invalid escape character in cookie value.");
			}
			result.append(processedString.charAt(stringIndex + 1));
			return true;
		}
		else if (charString == '"')
		{
			result.append('\\').append('"');
		}
		else
		{
			result.append(charString);
		}
		return false;
	}

	public static final class CookieSupport
	{

		// --------------------------------------------------------------- Constants
		/**
		 * If set to true, we parse cookies strictly according to the servlet, cookie and HTTP specs by default.
		 */
		public static final boolean STRICT_SERVLET_COMPLIANCE;

		/**
		 * If true, cookie values are allowed to contain an equals character without being quoted.
		 */
		public static final boolean ALLOW_EQUALS_IN_VALUE;

		/**
		 * If true, separators that are not explicitly dis-allowed by the v0 cookie spec but are disallowed by the HTTP
		 * spec will be allowed in v0 cookie names and values. These characters are: \"()/:<=>?@[\\]{} Note that the
		 * inclusion of / depends on the value of {@link #FWD_SLASH_IS_SEPARATOR}.
		 */
		public static final boolean ALLOW_HTTP_SEPARATORS_IN_V0;

		/**
		 * If set to false, we don't use the IE6/7 Max-Age/Expires work around. Default is usually true. If
		 * STRICT_SERVLET_COMPLIANCE==true then default is false. Explicitly setting always takes priority.
		 */
		public static final boolean ALWAYS_ADD_EXPIRES;

		/**
		 * If set to true, the <code>/</code> character will be treated as a separator. Default is usually false. If
		 * STRICT_SERVLET_COMPLIANCE==true then default is true. Explicitly setting always takes priority.
		 */
		public static final boolean FWD_SLASH_IS_SEPARATOR;

		/**
		 * If true, name only cookies will be permitted.
		 */
		public static final boolean ALLOW_NAME_ONLY;

		/**
		 * The list of separators that apply to version 0 cookies. To quote the spec, these are comma, semi-colon and
		 * white-space. The HTTP spec definition of linear white space is [CRLF] 1*( SP | HT )
		 */
		private static final char[] V0_SEPARATORS = { ',', ';', ' ', '\t' };
		private static final boolean[] V0_SEPARATOR_FLAGS = new boolean[128];

		/**
		 * The list of separators that apply to version 1 cookies. This may or may not include '/' depending on the
		 * setting of {@link #FWD_SLASH_IS_SEPARATOR}.
		 */
		private static final char[] HTTP_SEPARATORS;
		private static final boolean[] HTTP_SEPARATOR_FLAGS = new boolean[128];
		private static final String DEFAULT_FALSE_VALUE = "false";

		static
		{
			STRICT_SERVLET_COMPLIANCE = Boolean
					.parseBoolean(System.getProperty("org.apache.catalina.STRICT_SERVLET_COMPLIANCE", DEFAULT_FALSE_VALUE));

			ALLOW_EQUALS_IN_VALUE = Boolean.parseBoolean(
					System.getProperty("org.apache.tomcat.util.http.ServerCookie.ALLOW_EQUALS_IN_VALUE", DEFAULT_FALSE_VALUE));

			ALLOW_HTTP_SEPARATORS_IN_V0 = Boolean.parseBoolean(
					System.getProperty("org.apache.tomcat.util.http.ServerCookie.ALLOW_HTTP_SEPARATORS_IN_V0", DEFAULT_FALSE_VALUE));

			final String alwaysAddExpires = System.getProperty("org.apache.tomcat.util.http.ServerCookie.ALWAYS_ADD_EXPIRES");
			if (alwaysAddExpires == null)
			{
				ALWAYS_ADD_EXPIRES = !STRICT_SERVLET_COMPLIANCE;
			}
			else
			{
				ALWAYS_ADD_EXPIRES = Boolean.parseBoolean(alwaysAddExpires);
			}

			final String fwdSlashIsSeparator = System.getProperty("org.apache.tomcat.util.http.ServerCookie.FWD_SLASH_IS_SEPARATOR");
			if (fwdSlashIsSeparator == null)
			{
				FWD_SLASH_IS_SEPARATOR = STRICT_SERVLET_COMPLIANCE;
			}
			else
			{
				FWD_SLASH_IS_SEPARATOR = Boolean.parseBoolean(fwdSlashIsSeparator);
			}

			ALLOW_NAME_ONLY = Boolean.parseBoolean(
					System.getProperty("org.apache.tomcat.util.http.ServerCookie.ALLOW_NAME_ONLY", DEFAULT_FALSE_VALUE));


			/*
			 * Excluding the '/' char by default violates the RFC, but it looks like a lot of people put '/' in unquoted
			 * values: '/': ; //47 '\t':9 ' ':32 '\"':34 '(':40 ')':41 ',':44 ':':58 ';':59 '<':60 '=':61 '>':62 '?':63
			 * '@':64 '[':91 '\\':92 ']':93 '{':123 '}':125
			 */
			if (CookieSupport.FWD_SLASH_IS_SEPARATOR)
			{
				HTTP_SEPARATORS = new char[] { '\t', ' ', '\"', '(', ')', ',', '/', ':', ';', '<', '=', '>', '?', '@', '[', '\\',
						']', '{', '}' };
			}
			else
			{
				HTTP_SEPARATORS = new char[] { '\t', ' ', '\"', '(', ')', ',', ':', ';', '<', '=', '>', '?', '@', '[', '\\', ']',
						'{', '}' };
			}
			for (int i = 0; i < 128; i++)
			{
				V0_SEPARATOR_FLAGS[i] = false;
				HTTP_SEPARATOR_FLAGS[i] = false;
			}
			for (final char V0_SEPARATOR : V0_SEPARATORS)
			{
				V0_SEPARATOR_FLAGS[V0_SEPARATOR] = true;
			}
			for (final char HTTP_SEPARATOR : HTTP_SEPARATORS)
			{
				HTTP_SEPARATOR_FLAGS[HTTP_SEPARATOR] = true;
			}

		}

		// ------------------------------------------------------------- Constructor
		private CookieSupport()
		{
			// Utility class. Don't allow instances to be created.
		}

		// ----------------------------------------------------------------- Methods

		/**
		 * Returns true if the byte is a separator as defined by V0 of the cookie spec.
		 */
		public static final boolean isV0Separator(final char c)
		{
			if ((c < 0x20 || c >= 0x7f) && c != 0x09)
			{
				throw new IllegalArgumentException("Control character in cookie value or attribute.");
			}

			return V0_SEPARATOR_FLAGS[c];
		}

		public static boolean isV0Token(final String value)
		{
			if (value == null)
			{
				return false;
			}

			int i = 0;
			int len = value.length();

			if (alreadyQuoted(value))
			{
				i++;
				len--;
			}

			for (; i < len; i++)
			{
				final char c = value.charAt(i);

				if (isV0Separator(c))
				{
					return true;
				}
			}
			return false;
		}

		/**
		 * Returns true if the byte is a separator as defined by V1 of the cookie spec, RFC2109.
		 * 
		 * @throws IllegalArgumentException
		 *            if a control character was supplied as input
		 */
		public static final boolean isHttpSeparator(final char c)
		{
			if ((c < 0x20 || c >= 0x7f) && c != 0x09)
			{
				throw new IllegalArgumentException("Control character in cookie value or attribute.");
			}

			return HTTP_SEPARATOR_FLAGS[c];
		}

		public static boolean isHttpToken(final String value)
		{
			if (value == null)
			{
				return false;
			}

			int i = 0;
			int len = value.length();

			if (alreadyQuoted(value))
			{
				i++;
				len--;
			}

			for (; i < len; i++)
			{
				final char c = value.charAt(i);

				if (isHttpSeparator(c))
				{
					return true;
				}
			}
			return false;
		}

		public static boolean alreadyQuoted(final String value)
		{
			if (value == null || value.length() < 2)
			{
				return false;
			}
			return value.charAt(0) == '\"' && value.charAt(value.length() - 1) == '\"';
		}
	}
}
