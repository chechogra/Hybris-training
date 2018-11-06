<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<spring:htmlEscape defaultHtmlEscape="true"/>
<c:set var="symbolDefsPath" value="${contextPath}/_ui/addons/talosacceleratoraddon/responsive/common/images/symbol-defs.svg"/>

<spring:url value="/cart/export" var="exportUrl" htmlEscape="false"/>
<a href="${exportUrl}" class="export__cart--link">
    <spring:theme code="basket.export.csv.file"/>
    <svg class="icon icon-export">
        <use xlink:href="${symbolDefsPath}#icon-export"></use>
    </svg>
</a>
