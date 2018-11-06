<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="format" tagdir="/WEB-INF/tags/shared/format" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<spring:htmlEscape defaultHtmlEscape="true"/>

<spring:url value="/cart/miniCart/{/totalDisplay}" var="refreshMiniCartUrl" htmlEscape="false">
    <spring:param name="totalDisplay" value="${totalDisplay}"/>
</spring:url>
<spring:url value="/cart/rollover/{/componentUid}" var="rolloverPopupUrl" htmlEscape="false">
    <spring:param name="componentUid" value="${component.uid}"/>
</spring:url>
<c:url value="/cart" var="cartUrl"/>
<c:set var="symbolDefsPath" value="${contextPath}/_ui/addons/talosacceleratoraddon/responsive/common/images/symbol-defs.svg"/>

<div class="nav-cart">
    <a href="${cartUrl}" class="tc-mn-link mini-cart-link js-mini-cart-link"
       data-mini-cart-url="${rolloverPopupUrl}"
       data-mini-cart-refresh-url="${refreshMiniCartUrl}"
       data-mini-cart-name="<spring:theme code="text.cart"/>"
       data-mini-cart-empty-name="<spring:theme code="popup.cart.empty"/>"
       data-mini-cart-items-text="<spring:theme code="basket.items"/>"
    >
        <svg class="icon icon-cart">
            <use xlink:href="${symbolDefsPath}#icon-cart"></use>
        </svg>
        <div class="mini-cart-count js-mini-cart-count"><span
                class="nav-items-total">${totalItems lt 100 ? totalItems : "99+"}</span></div>
    </a>
</div>
<div class="mini-cart-container js-mini-cart-container"></div>
