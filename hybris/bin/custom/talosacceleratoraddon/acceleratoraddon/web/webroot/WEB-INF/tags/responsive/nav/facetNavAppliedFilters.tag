<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ attribute name="pageData" required="true"
              type="de.hybris.platform.commerceservices.search.facetdata.ProductSearchPageData" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="symbolDefsPath"
       value="${contextPath}/_ui/addons/talosacceleratoraddon/responsive/common/images/symbol-defs.svg"/>

<c:if test="${not empty pageData.breadcrumbs}">
    <div class="facet js-facet tc-applied-facets">
        <div class="facet__name js-facet-name">
            <span class="glyphicon facet__arrow"></span>
            <spring:theme code="search.nav.applied.facets"/>
        </div>
        <div class="facet__values js-facet-values">
            <ul class="facet__list">
                <c:forEach items="${pageData.breadcrumbs}" var="breadcrumb">
                    <li>
                        <c:url value="${breadcrumb.removeQuery.url}" var="removeQueryUrl"/>
                            ${fn:escapeXml(breadcrumb.facetValueName)}&nbsp;
                        <a href="${removeQueryUrl}">
                            <svg class="icon" id="icon-close" viewBox="0 0 32 32" width="100%" height="100%">
                                <title>close</title>
                                <path d="M32 1.829l-1.828-1.829-14.172 14.171-14.171-14.171-1.829 1.829 14.171 14.171-14.171 14.172 1.829 1.828 14.171-14.171 14.172 14.171 1.828-1.828-14.171-14.172z"></path>
                            </svg>
                        </a>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</c:if>