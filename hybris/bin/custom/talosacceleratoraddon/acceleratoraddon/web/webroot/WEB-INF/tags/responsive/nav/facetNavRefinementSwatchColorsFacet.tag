<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ attribute name="facetData" required="true" type="de.hybris.platform.commerceservices.search.facetdata.FacetData" %>
<%@ attribute name="index" required="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<spring:htmlEscape defaultHtmlEscape="true"/>

<c:if test="${not empty facetData.values}">
    <ycommerce:testId code="facetNav_title_${facetData.name}">
        <div class="facet js-facet tc-collapsible-parent">
            <div class="facet__name js-facet-name" data-toggle="collapse"
                 data-target="#facet_group_${index}">
                <c:out value="${facetData.name}"/>
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
            </div>

            <div class="facet__values js-facet-values collapse in" id="facet_group_${index}">
                <ul class="tc-color-facet-list facet__list js-facet-list">
                    <c:forEach items="${facetData.values}" var="facetValue">
                        <li class="tc-color-facet-value">
                            <c:url value="${facetValue.query.url}" var="facetValueQueryUrl"/>
                            <a href="${facetValueQueryUrl}" style="background-color: ${facetValue.code}"></a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </ycommerce:testId>
</c:if>
