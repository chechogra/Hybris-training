<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ attribute name="facetData" required="true" type="de.hybris.platform.commerceservices.search.facetdata.FacetData" %>
<%@ attribute name="userLocation" required="true"
              type="de.hybris.platform.acceleratorservices.store.data.UserLocationData" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<spring:htmlEscape defaultHtmlEscape="true"/>
<spring:theme code="search.placeholder" var="searchPlaceholder"/>

<c:url value="/store-finder" var="searchUserLocationUrl"/>
<c:url value="/store-finder/position" var="autoUserLocationUrl"/>

<c:set var="symbolDefsPath"
       value="${contextPath}/_ui/addons/talosacceleratoraddon/responsive/common/images/symbol-defs.svg"/>

<c:if test="${not empty facetData.values}">

    <ycommerce:testId code="facetNav_title_${facetData.name}">
        <div class="facet js-facet js-shop-stores-facet tc-collapsible-parent">
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
                <div class="facet__form js-facet-form <c:if test="${not empty userLocation}">facet-form-hidden</c:if>"
                     data-url="${searchUserLocationUrl}">
                    <form name="userLocationForm" action="${searchUserLocationUrl}" method="GET" id="user_location_form"
                          class="storesFacetSearchForm">
                        <div class="input-group">
                            <label for="user_location_query" class="sr-only"><spring:theme
                                    code="storeFinder.search"/></label>
                            <input type="text" class="form-control tc-input js-shop-store-search-input" name="q"
                                   id="user_location_query" placeholder="${searchPlaceholder}">
                            <span class="input-group-btn">
                                <button type="submit" id="user_location_query_button">
                                    <svg class="icon icon-search searchbox-item">
                                        <use xlink:href="${symbolDefsPath}#icon-search"></use>
                                    </svg>
                                </button>
                            </span>
                        </div>
                    </form>

                    <div class="line-text">
                        <span><spring:theme code="storeFinder.line.text"/></span>
                    </div>

                    <button type="button" id="findStoresNearMeAjax" class="btn btn-primary btn-block"><spring:theme
                            code="storeFinder.findStoresNearMe"/></button>
                </div>

                <div class="facet__results js-facet-container <c:if test="${empty userLocation}">facet__results__hidden</c:if>">
                    <c:if test="${not empty userLocation}">
                        <div class="facet__search">
                            <a href="#" class="js-facet-change-link">
                                <spring:theme code="search.nav.changeLocation"/>
                            </a>
                            <c:if test="${not empty userLocation.searchTerm}">
                                <div class="facet__search__results">
                                    <spring:theme code="search.nav.resultsForStore"
                                                  arguments="${fn:escapeXml(userLocation.searchTerm)}"/>
                                </div>
                            </c:if>
                        </div>

                        <c:if test="${not empty facetData.values}">
                            <ul class="facet__list js-facet-list ${facetData.multiSelect ? '' : 'indent'}">
                                <c:forEach items="${facetData.values}" var="facetValue" varStatus="status">
                                    <li class="${(status.index < 5 or facetValue.selected) ? '' : 'hidden'}">
                                        <c:if test="${facetData.multiSelect}">
                                            <form action="#" method="get">
                                                <input type="hidden" name="q" value="${facetValue.query.query.value}"/>
                                                <input type="hidden" name="text"
                                                       value="${searchPageData.freeTextSearch}"/>
                                                <label>
                                                    <input class="facet__list__checkbox js-facet-checkbox sr-only"
                                                           type="checkbox"  ${facetValue.selected ? 'checked="checked"' : ''} >
                                                    <span class="facet__list__label">
													<span class="facet__list__mark"></span>
													<span class="facet__list__text">
														${fn:escapeXml(facetValue.name)}
														<ycommerce:testId code="facetNav_count">
                                                            <span class="facet__value__count"> <spring:theme
                                                                    code="search.nav.facetValueCount"
                                                                    arguments="${facetValue.count}"/></span>
                                                        </ycommerce:testId>
													</span>
												</span>
                                                </label>
                                            </form>
                                        </c:if>
                                        <c:if test="${not facetData.multiSelect}">
                                            <c:url value="${facetValue.query.url}" var="facetValueQueryUrl"/>
                                            <span class="facet__list__text">
											<a href="${facetValueQueryUrl}">${fn:escapeXml(facetValue.name)}</a>
											<ycommerce:testId code="facetNav_count">
                                                <span class="facet__value__count"> <spring:theme
                                                        code="search.nav.facetValueCount"
                                                        arguments="${facetValue.count}"/></span>
                                            </ycommerce:testId>
										</span>
                                        </c:if>
                                    </li>
                                </c:forEach>
                            </ul>
                            <c:if test="${fn:length(facetData.values) > 5}">
							<span class="facet__values__more">
								<a href="#" class="js-more-stores-facet-values"><spring:theme
                                        code="search.nav.facetShowMore_${facetData.code}"/></a>
							</span>
                            </c:if>
                        </c:if>
                    </c:if>
                </div>
            </div>
        </div>
    </ycommerce:testId>
</c:if>
