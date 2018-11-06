<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags" %>

<c:set var="symbolDefsPath" value="${contextPath}/_ui/addons/talosacceleratoraddon/responsive/common/images/symbol-defs.svg"/>

<c:if test="${component.visible}">
    <div class="tc-rotating-banner-wp"
         data-items-shown-xs="${component.itemsShownXs}"
         data-items-shown-sm="${component.itemsShownSm}"
         data-items-shown-md="${component.itemsShownMd}"
         data-items-shown-lg="${component.itemsShownLg}"
         data-nav-color="${component.navColor}"
         data-icon-path="${symbolDefsPath}">
        <c:if test="${not empty component.title}">
            <div class="tc-rotating-banner-headline">${fn:escapeXml(component.title)}</div>
        </c:if>
        <div class="owl-carousel tc-rotating-banner-inner">
            <c:forEach items="${component.banners}" var="banner" varStatus="status">
                <cms:component component="${banner}"/>
            </c:forEach>
        </div>
    </div>
</c:if>

