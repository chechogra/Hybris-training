<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ attribute name="breadcrumbs" required="true" type="java.util.List" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:url value="/" var="homeUrl"/>
<c:set var="symbolDefsPath" value="${contextPath}/_ui/addons/talosacceleratoraddon/responsive/common/images/symbol-defs.svg"/>

<div class="container-fluid tc-container">
    <ol class="breadcrumb">
        <li>
            <a href="${homeUrl}"><spring:theme code="breadcrumb.home"/></a>
            <svg class="icon icon-chevron-right">
                <use xmlns:xlink="http://www.w3.org/1999/xlink"
                     xlink:href="${symbolDefsPath}#icon-chevron-right"></use>
            </svg>
        </li>

        <c:forEach items="${breadcrumbs}" var="breadcrumb" varStatus="status">
            <c:url value="${breadcrumb.url}" var="breadcrumbUrl"/>
            <c:choose>
                <c:when test="${status.last}">
                    <li class="active">${fn:escapeXml(breadcrumb.name)}</li>
                </c:when>
                <c:when test="${breadcrumb.url eq '#'}">
                    <li>
                        <a href="#">${fn:escapeXml(breadcrumb.name)}</a>
                        <svg class="icon icon-chevron-right">
                            <use xmlns:xlink="http://www.w3.org/1999/xlink"
                                 xlink:href="${symbolDefsPath}#icon-chevron-right"></use>
                        </svg>
                    </li>
                </c:when>
                <c:otherwise>
                    <li>
                        <a href="${breadcrumbUrl}">${fn:escapeXml(breadcrumb.name)}</a>
                        <svg class="icon icon-chevron-right">
                            <use xmlns:xlink="http://www.w3.org/1999/xlink"
                                 xlink:href="${symbolDefsPath}#icon-chevron-right"></use>
                        </svg>
                    </li>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <li class="tc-breadcrumb-band"></li>
    </ol>
</div>
