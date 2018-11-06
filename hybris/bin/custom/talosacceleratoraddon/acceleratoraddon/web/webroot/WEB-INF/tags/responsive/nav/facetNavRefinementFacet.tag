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

            <div class="facet__values js-facet-values js-facet-form collapse in" id="facet_group_${index}">
                <c:if test="${not empty facetData.topValues}">
                    <ul class="facet__list js-facet-list js-facet-top-values">
                        <c:forEach items="${facetData.topValues}" var="facetValue">
                            <li>
                                <c:if test="${facetData.multiSelect}">
                                    <form action="#" method="get">
                                        <input type="hidden" name="q" value="${facetValue.query.query.value}"/>
                                        <input type="hidden" name="text" value="${searchPageData.freeTextSearch}"/>
                                        <label class="tc-control tc-checkbox tc-sm">
                                            <input class="facet__list__checkbox"
                                                   type="checkbox" ${facetValue.selected ? 'checked="checked"' : ''}
                                                   class="facet-checkbox"/>
                                            <span class="tc-control__indicator"></span>
                                            <span class="facet__list__label">
											<span class="facet__list__mark"></span>
											<span class="facet__list__text">
												${fn:escapeXml(facetValue.name)}
												<ycommerce:testId code="facetNav_count">
                                                    <span class="facet__value__count"><spring:theme
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
                                    <span class="facet__text">
									<a href="${facetValueQueryUrl}&amp;text=${fn:escapeXml(searchPageData.freeTextSearch)}">${fn:escapeXml(facetValue.name)}</a>&nbsp;
									<ycommerce:testId code="facetNav_count">
                                        <span class="facet__value__count"><spring:theme
                                                code="search.nav.facetValueCount"
                                                arguments="${facetValue.count}"/></span>
                                    </ycommerce:testId>
								</span>
                                </c:if>
                            </li>
                        </c:forEach>
                    </ul>
                </c:if>
                <ul class="facet__list js-facet-list <c:if test="${not empty facetData.topValues}">facet__list--hidden js-facet-list-hidden</c:if>">
                    <c:forEach items="${facetData.values}" var="facetValue">
                        <li>
                            <c:if test="${facetData.multiSelect}">
                                <ycommerce:testId code="facetNav_selectForm">
                                    <form action="#" method="get">
                                        <input type="hidden" name="q" value="${facetValue.query.query.value}"/>
                                        <input type="hidden" name="text" value="${searchPageData.freeTextSearch}"/>
                                        <label class="tc-control tc-checkbox tc-sm">
                                            <input type="checkbox" ${facetValue.selected ? 'checked="checked"' : ''}
                                                   class="facet__list__checkbox js-facet-checkbox sr-only"/>
                                            <span class="tc-control__indicator"></span>
                                            <span class="facet__list__label">
										<span class="facet__list__mark"></span>
										<span class="facet__list__text">
											${fn:escapeXml(facetValue.name)}&nbsp;
											<ycommerce:testId code="facetNav_count">
                                                <span class="facet__value__count"><spring:theme
                                                        code="search.nav.facetValueCount"
                                                        arguments="${facetValue.count}"/></span>
                                            </ycommerce:testId>
										</span>
									</span>
                                        </label>
                                    </form>
                                </ycommerce:testId>
                            </c:if>
                            <c:if test="${not facetData.multiSelect}">
                                <c:url value="${facetValue.query.url}" var="facetValueQueryUrl"/>
                                <span class="facet__text">
								<a href="${facetValueQueryUrl}">${fn:escapeXml(facetValue.name)}</a>
								<ycommerce:testId code="facetNav_count">
                                    <span class="facet__value__count"><spring:theme code="search.nav.facetValueCount"
                                                                                    arguments="${facetValue.count}"/></span>
                                </ycommerce:testId>
							</span>
                            </c:if>
                        </li>
                    </c:forEach>
                </ul>

                <c:if test="${not empty facetData.topValues}">
				<span class="facet__values__more js-more-facet-values">
					<a href="#" class="js-more-facet-values-link"><spring:theme
                            code="search.nav.facetShowMore_${facetData.code}"/></a>
				</span>
                    <span class="facet__values__less js-less-facet-values">
					<a href="#" class="js-less-facet-values-link"><spring:theme
                            code="search.nav.facetShowLess_${facetData.code}"/></a>
				</span>
                </c:if>
            </div>
        </div>
    </ycommerce:testId>
</c:if>
