<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ attribute name="cartData" required="true" type="de.hybris.platform.commercefacades.order.data.CartData" %>
<%@ attribute name="groupData" required="true" type="de.hybris.platform.commercefacades.order.data.OrderEntryGroupData" %>
<%@ attribute name="showPotentialPromotions" required="false" type="java.lang.Boolean" %>
<%@ attribute name="showHead" required="false" type="java.lang.Boolean" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="format" tagdir="/WEB-INF/tags/shared/format" %>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/responsive/product" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="common" tagdir="/WEB-INF/tags/responsive/common" %>

<spring:htmlEscape defaultHtmlEscape="true"/>

<ul class="checkout-order-summary-list tc-os-list">
    <c:if test="${showHead}">
        <li class="checkout-order-summary-list-heading">
            <div class="title tc-os-heading"><spring:theme code="checkout.multi.items.to.pickup"/></div>
            <div class="address tc-os-address">
                    ${fn:escapeXml(groupData.deliveryPointOfService.name)}
                <br>
                <c:if test="${ not empty groupData.deliveryPointOfService.address.line1 }">
                    ${fn:escapeXml(groupData.deliveryPointOfService.address.line1)},&nbsp;
                </c:if>
                <c:if test="${ not empty groupData.deliveryPointOfService.address.line2 }">
                    ${fn:escapeXml(groupData.deliveryPointOfService.address.line2)},&nbsp;
                </c:if>
                <c:if test="${not empty groupData.deliveryPointOfService.address.town }">
                    ${fn:escapeXml(groupData.deliveryPointOfService.address.town)},&nbsp;
                </c:if>
                <c:if test="${ not empty groupData.deliveryPointOfService.address.region.name }">
                    ${fn:escapeXml(groupData.deliveryPointOfService.address.region.name)},&nbsp;
                </c:if>
                <c:if test="${ not empty groupData.deliveryPointOfService.address.postalCode }">
                    ${fn:escapeXml(groupData.deliveryPointOfService.address.postalCode)},&nbsp;
                </c:if>
                <c:if test="${ not empty groupData.deliveryPointOfService.address.country.name }">
                    ${fn:escapeXml(groupData.deliveryPointOfService.address.country.name)}
                </c:if>
                <br/>
                <c:if test="${ not empty groupData.deliveryPointOfService.address.phone }">
                    ${fn:escapeXml(groupData.deliveryPointOfService.address.phone)}
                </c:if>
            </div>
        </li>
    </c:if>
    <c:forEach items="${groupData.entries}" var="entry">
        <c:url value="${entry.product.url}" var="productUrl"/>
        <li class="checkout-order-summary-list-items tc-os-product-container">
            <div class="thumb tc-os-product-thumbnail">
                <a href="${productUrl}">
                    <product:productPrimaryImage product="${entry.product}" format="thumbnail"/>
                </a>
            </div>
                <%--<div class="price"><format:price priceData="${entry.basePrice}" displayFreeForZero="true"/></div>--%>
            <div class="details tc-os-product-details">
                <div class="name tc-os-product-name"><a href="${productUrl}">${fn:escapeXml(entry.product.name)}</a></div>
                <div>
                    <span class="label-spacing"><spring:theme code="order.itemPrice"/>:</span>
                    <c:if test="${entry.product.multidimensional}">
                        <%-- if product is multidimensional with different prices, show range, else, show unique price --%>
                        <c:choose>
                            <c:when test="${entry.product.priceRange.minPrice.value ne entry.product.priceRange.maxPrice.value}">
                                <format:price priceData="${entry.product.priceRange.minPrice}"/> - <format:price
                                    priceData="${entry.product.priceRange.maxPrice}"/>
                            </c:when>
                            <c:when test="${entry.product.priceRange.minPrice.value eq entry.product.priceRange.maxPrice.value}">
                                <format:price priceData="${entry.product.priceRange.minPrice}"/>
                            </c:when>
                            <c:otherwise>
                                <format:price priceData="${entry.product.price}"/>
                            </c:otherwise>
                        </c:choose>
                    </c:if>
                    <c:if test="${! entry.product.multidimensional}">
                        <format:price priceData="${entry.basePrice}" displayFreeForZero="true"/>
                    </c:if>
                </div>
                <div class="qty"><spring:theme code="basket.page.quantity"/>:&nbsp;${entry.quantity}</div>
                <div class="variants">
                    <c:forEach items="${entry.product.baseOptions}" var="option">
                        <c:if test="${not empty option.selected and option.selected.url eq entry.product.url}">
                            <c:forEach items="${option.selected.variantOptionQualifiers}" var="selectedOption">
                                <div>${fn:escapeXml(selectedOption.name)}: ${fn:escapeXml(selectedOption.value)}</div>
                            </c:forEach>
                        </c:if>
                    </c:forEach>
                </div>
                <c:if test="${ycommerce:doesPotentialPromotionExistForOrderEntryOrOrderEntryGroup(cartData, entry) && showPotentialPromotions}">
                    <ul>
                        <c:forEach items="${cartData.potentialProductPromotions}" var="promotion">
                            <c:set var="displayed" value="false"/>
                            <c:forEach items="${promotion.consumedEntries}" var="consumedEntry">
                                <c:if test="${not displayed && ycommerce:isConsumedByEntry(consumedEntry,entry)}">
                                    <c:set var="displayed" value="true"/>
                                    <span>${ycommerce:sanitizeHTML(promotion.description)}</span>
                                </c:if>
                            </c:forEach>
                        </c:forEach>
                    </ul>
                </c:if>
                <c:if test="${ycommerce:doesAppliedPromotionExistForOrderEntryOrOrderEntryGroup(cartData, entry)}">
                    <ul>
                        <c:forEach items="${cartData.appliedProductPromotions}" var="promotion">
                            <c:set var="displayed" value="false"/>
                            <c:forEach items="${promotion.consumedEntries}" var="consumedEntry">
                                <c:if test="${not displayed && ycommerce:isConsumedByEntry(consumedEntry,entry)}">
                                    <c:set var="displayed" value="true"/>
                                    <span>${ycommerce:sanitizeHTML(promotion.description)}</span>
                                </c:if>
                            </c:forEach>
                        </c:forEach>
                    </ul>
                </c:if>
                <common:configurationInfos entry="${entry}"/>
            </div>
            <div class="price tc-os-product-total-price"><format:price priceData="${entry.basePrice}"
                                                                        displayFreeForZero="true"/></div>


        </li>
    </c:forEach>

</ul>
