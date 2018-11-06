<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ attribute name="hideHeaderLinks" required="false" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags/responsive/nav" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<c:set var="symbolDefsPath" value="${contextPath}/_ui/addons/talosacceleratoraddon/responsive/common/images/symbol-defs.svg"/>

<c:set var="showLanguages" value="${fn:length(languages) > 1}"/>
<c:set var="showCurrencies" value="${fn:length(currencies) > 1}"/>
<c:set var="showUserPrefs" value="${(showLanguages eq true) or (showCurrencies eq true)}"/>


<cms:pageSlot position="TopHeaderSlot" var="component" element="div" class="container">
    <cms:component component="${component}"/>
</cms:pageSlot>

<nav id="tc_main_nav" role="navigation" aria-label="<spring:theme code='nav.aria.label'/>">
    <div class="tc-mn-content">
        <div class="tc-header-top">
            <div class="container-fluid tc-container">
                <div class="tc-header-top-inner">

                    <button class="hamburger hamburger--spring tc-hamburger" type="button">
                      <span class="hamburger-box">
                        <span class="hamburger-inner"></span>
                      </span>
                    </button>

                    <cms:pageSlot position="SiteLogo" var="logo" limit="1">
                        <cms:component component="${logo}" element="div" class="yComponentWrapper tc-logo-wp"/>
                    </cms:pageSlot>

                    <ul class="tc-mn-actions">
                        <li class="tc-mn-item tc-mn-search">
                            <a href="javascript:void(0)" class="tc-mn-link">
                                <svg class="icon icon-search">
                                    <use xlink:href="${symbolDefsPath}#icon-search"></use>
                                </svg>
                            </a>
                        </li>
                        <c:if test="${empty hideHeaderLinks}">
                            <li class="tc-mn-item tc-mn-store-finder">
                                <a href="<c:url value='/store-finder'/>" class="tc-mn-link">
                                    <svg class="icon icon-location">
                                        <use xlink:href="${symbolDefsPath}#icon-location"></use>
                                    </svg>
                                </a>
                            </li>

                            <c:if test="${showUserPrefs eq true}">
                                <li class="tc-mn-item tc-mn-user-pref tc-mn-icon-js">
                                    <a href="javascript:void(0)" class="tc-mn-link">
                                        <svg class="icon icon-user-pref">
                                            <use xlink:href="${symbolDefsPath}#icon-user-pref"></use>
                                        </svg>
                                    </a>
                                    <c:if test="${showUserPrefs eq true}">
                                        <div class="tc-user-pref-content tc-header-icons-content">
                                            <a href="javascript:void(0)" class="tc-navigation-back js-tc-navigation-back">
                                                <svg class="icon icon-chevron-left">
                                                    <use xlink:href="${symbolDefsPath}#icon-chevron-left"></use>
                                                </svg>
                                                <spring:theme code="nav.back"/>
                                            </a>
                                            <ul class="tc-user-pref-list">
                                                <c:if test="${showCurrencies eq true}">
                                                    <li class="tc-user-pref-item tc-currencies">
                                                        <span class="tc-user-pref-label">
                                                            <spring:theme code="user.pref.currency"/>
                                                        </span>

                                                        <c:url value="/_s/currency" var="setCurrencyActionUrl"/>
                                                        <form:form action="${setCurrencyActionUrl}" method="post"
                                                                   id="currency-form">

                                                            <div class="tc-radio-group">
                                                                <c:forEach items="${currencies}" var="curr"
                                                                           varStatus="currencyLoop">
                                                                    <input type="radio" id="tc_currency_${currencyLoop.index}"
                                                                           name="code"
                                                                           value="${fn:escapeXml(curr.isocode)}" ${curr.isocode == currentCurrency.isocode ? 'checked' : ''}>
                                                                    <label for="tc_currency_${currencyLoop.index}"><c:out
                                                                            value="${curr.symbol} ${curr.isocode}"/></label>
                                                                </c:forEach>
                                                            </div>
                                                        </form:form>
                                                    </li>
                                                </c:if>

                                                <c:if test="${showLanguages eq true}">
                                                    <li class="tc-user-pref-item tc-languages tc-collapsible-group">
                                                        <div class="tc-collapsible-parent tc-collapsed">
                                                            <a class="tc-collapse-trigger " href="javascript:void(0)"
                                                               data-toggle="collapse" data-target="#tc_language_collapsible">
                                                                <span class="tc-user-pref-label"><spring:theme
                                                                        code="user.pref.language"/></span>
                                                                <span class="tc-user-pref-current-lang">${fn:escapeXml(currentLanguage.nativeName)}</span>

                                                                <svg class="icon-chevron-up-down" version="1.1"
                                                                     viewbox="0 0 100 100"
                                                                     xmlns="http://www.w3.org/2000/svg"
                                                                     preserveAspectRatio="xMidYMid">
                                                                    <g class="chevron__container">
                                                                        <line class="chevron__line1" x1="10" y1="50" x2="50"
                                                                              y2="50"/>
                                                                        <line class="chevron__line2" x1="90" y1="50" x2="50"
                                                                              y2="50"/>
                                                                    </g>
                                                                </svg>
                                                            </a>
                                                            <div class="tc-language-collapsible tc-collapsible-content collapse"
                                                                 id="tc_language_collapsible">
                                                                <c:url value="/_s/language" var="setLanguageActionUrl"/>
                                                                <form:form action="${setLanguageActionUrl}" method="post"
                                                                           id="lang-form">
                                                                    <ul class="tc-radio-languages-group">
                                                                        <c:forEach items="${languages}" var="lang"
                                                                                   varStatus="languageLoop">
                                                                            <li class="tc-language-item">
                                                                                <input type="radio"
                                                                                       id="tc_language_${languageLoop.index}"
                                                                                       name="code"
                                                                                       value="${fn:escapeXml(lang.isocode)}" ${lang.isocode == currentLanguage.isocode ? 'checked' : ''}>
                                                                                <label for="tc_language_${languageLoop.index}"><c:out
                                                                                        value="${fn:escapeXml(lang.nativeName)}"/></label>
                                                                            </li>
                                                                        </c:forEach>
                                                                    </ul>
                                                                </form:form>
                                                            </div>
                                                        </div>
                                                    </li>
                                                </c:if>
                                            </ul>
                                        </div>
                                    </c:if>
                                </li>
                            </c:if>

                            <li class="tc-mn-item tc-mn-order-tools tc-mn-icon-js">
                                <a href="javascript:void(0)" class="tc-mn-link js-tc-open-order-tools">
                                    <svg class="icon icon-order-tools">
                                        <use xlink:href="${symbolDefsPath}#icon-order-tools"></use>
                                    </svg>
                                </a>
                                <div class="tc-order-tools-content tc-header-icons-content">
                                    <a href="javascript:void(0)" class="tc-navigation-back js-tc-navigation-back">
                                        <svg class="icon icon-chevron-left">
                                            <use xlink:href="${symbolDefsPath}#icon-chevron-left"></use>
                                        </svg>
                                        <spring:theme code="nav.back"/>
                                    </a>

                                    <cms:pageSlot position="OrderToolsLinks" var="link">
                                        <cms:component component="${link}" element="ul" class="tc-order-tools-list"/>
                                    </cms:pageSlot>

                                </div>
                            </li>

                            <li class="tc-mn-item tc-mn-account tc-mn-icon-js">
                                <a href="<c:url value='/login'/>" class="tc-mn-link">
                                    <svg class="icon icon-account">
                                        <use xlink:href="${symbolDefsPath}#icon-account"></use>
                                    </svg>
                                </a>
                                <sec:authorize access="!hasAnyRole('ROLE_ANONYMOUS')">
                                    <div class="tc-header-icons-content">
                                        <div class=" tc-welcome-msg">
                                            <spring:theme code="header.welcome" arguments="${user.firstName} !"
                                                          htmlEscape="true"/>
                                        </div>
                                        <cms:pageSlot position="HeaderLinks" var="link">
                                            <cms:component component="${link}" element="ul" class="tc-my-account-list"/>
                                        </cms:pageSlot>
                                        <div class="tc-mn-account-item">
                                            <a href="<c:url value='/logout'/>" class="tc-mn-link">
                                                <svg class="icon icon-sign-out">
                                                    <use xlink:href="${symbolDefsPath}#icon-sign-out"></use>
                                                </svg>
                                                <spring:theme code="header.link.logout"/>
                                            </a>
                                        </div>
                                    </div>
                                </sec:authorize>
                                <sec:authorize access="hasAnyRole('ROLE_ANONYMOUS')">
                                    <div class="tc-header-icons-content tc-anonymous">
                                        <div class="tc-mn-account-item">
                                            <a href="<c:url value='/login'/>" class="tc-mn-link">
                                                <svg class="icon icon-account">
                                                    <use xlink:href="${symbolDefsPath}#icon-account"></use>
                                                </svg>
                                                <spring:theme code="header.link.login"/>
                                            </a>
                                        </div>
                                    </div>
                                </sec:authorize>
                            </li>
                            <li class="tc-mn-item tc-mn-mini-cart">
                                <cms:pageSlot position="MiniCart" var="cart" element="div"
                                              class="miniCartSlot">
                                    <cms:component component="${cart}" element="div" class="tc-mini-cart-component"/>
                                </cms:pageSlot>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
        <div class="tc-header-content">

            <ul class="tc-mn-actions-mobile">
                <c:if test="${empty hideHeaderLinks}">
                    <sec:authorize access="!hasAnyRole('ROLE_ANONYMOUS')">
                        <c:set var="maxNumberChars" value="25"/>
                        <c:if test="${fn:length(user.firstName) gt maxNumberChars}">
                            <c:set target="${user}" property="firstName"
                                   value="${fn:substring(user.firstName, 0, maxNumberChars)}..."/>
                        </c:if>

                        <li class="tc-mn-item-mobile tc-welcome-msg">
                            <spring:theme code="header.welcome" arguments="${user.firstName} !" htmlEscape="true"/>
                        </li>

                    </sec:authorize>

                    <sec:authorize access="hasAnyRole('ROLE_ANONYMOUS')">
                        <li class="tc-mn-item-mobile">
                            <a class="tc-mn-link" href="<c:url value='/login'/>">
                                <svg class="icon icon-account">
                                    <use xlink:href="${symbolDefsPath}#icon-account"></use>
                                </svg>
                                <spring:theme code="header.link.login"/>
                            </a>
                        </li>
                    </sec:authorize>

                    <sec:authorize access="!hasAnyRole('ROLE_ANONYMOUS')">
                        <li class="tc-mn-item-mobile tc-my-account-item tc-collapsible-group">
                            <div class="tc-collapsible-parent tc-collapsed">
                                <a href="javascript:void(0)" class="tc-mn-link tc-collapse-trigger" data-toggle="collapse"
                                   data-target="#tc_account_collapsible">
                                    <svg class="icon icon-account">
                                        <use xlink:href="${symbolDefsPath}#icon-account"></use>
                                    </svg>
                                    <spring:theme code="header.link.account"/>

                                    <svg version="1.1" xmlns="http://www.w3.org/2000/svg" x="0px"
                                         y="0px" width="15px" class="icon-plus"
                                         height="15px" viewBox="0 0 15 15" enable-background="new 0 0 15 15">
                                        <g id="Layer_1">
                                            <rect x="7" width="1" height="15"/>
                                        </g>
                                        <g id="Layer_2">
                                            <rect y="7" width="15" height="1"/>
                                        </g>
                                    </svg>
                                </a>
                                <div class="tc-account-collapsible tc-collapsible-content collapse" id="tc_account_collapsible">
                                    <cms:pageSlot position="HeaderLinks" var="link">
                                        <cms:component component="${link}" element="ul" class="tc-my-account-list"/>
                                    </cms:pageSlot>
                                </div>
                            </div>
                        </li>
                    </sec:authorize>

                    <li class="tc-mn-item-mobile">
                        <a href="<c:url value='/store-finder'/>" class="tc-mn-link">
                            <svg class="icon icon-location">
                                <use xlink:href="${symbolDefsPath}#icon-location"></use>
                            </svg>
                            <spring:theme code="nav.find.stores.label"/>
                        </a>
                    </li>

                    <c:if test="${showUserPrefs eq true}">
                        <li class="tc-mn-item-mobile">
                            <a href="javascript:void(0)" class="tc-mn-link js-tc-open-user-pref">
                                <svg class="icon icon-user-pref">
                                    <use xlink:href="${symbolDefsPath}#icon-user-pref"></use>
                                </svg>
                                <c:if test="${showLanguages eq true}">${currentLanguage.name}</c:if>
                                <c:if test="${(showLanguages eq true) and (showCurrencies eq true)}">&nbsp;/&nbsp;</c:if>
                                <c:if test="${showCurrencies eq true}">${currentCurrency.isocode}</c:if>
                                <svg class="icon icon-chevron-right">
                                    <use xlink:href="${symbolDefsPath}#icon-chevron-right"></use>
                                </svg>
                            </a>
                        </li>
                    </c:if>

                    <li class="tc-mn-item-mobile">
                        <a href="javascript:void(0)" class="tc-mn-link js-tc-open-order-tools">
                            <svg class="icon icon-order-tools">
                                <use xlink:href="${symbolDefsPath}#icon-order-tools"></use>
                            </svg>
                            <spring:theme code="nav.order.tools.label"/>
                            <svg class="icon icon-chevron-right">
                                <use xlink:href="${symbolDefsPath}#icon-chevron-right"></use>
                            </svg>
                        </a>
                    </li>


                    <sec:authorize access="!hasAnyRole('ROLE_ANONYMOUS')">
                        <li class="tc-mn-item-mobile">
                            <a href="<c:url value='/logout'/>" class="tc-mn-link">
                                <svg class="icon icon-sign-out">
                                    <use xlink:href="${symbolDefsPath}#icon-sign-out"></use>
                                </svg>
                                <spring:theme code="header.link.logout"/>
                            </a>
                        </li>
                    </sec:authorize>
                </c:if>
            </ul>
            <nav:topNavigation/>
        </div>
    </div>
</nav>

<cms:pageSlot position="SearchBox" var="component">
    <cms:component component="${component}" element="div" class="tc-searchbox"/>
</cms:pageSlot>
