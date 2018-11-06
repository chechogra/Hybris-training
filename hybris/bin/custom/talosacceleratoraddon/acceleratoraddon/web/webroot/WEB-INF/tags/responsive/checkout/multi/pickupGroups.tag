<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ attribute name="cartData" required="true" type="de.hybris.platform.commercefacades.order.data.CartData" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="theme" tagdir="/WEB-INF/tags/shared/theme" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<spring:htmlEscape defaultHtmlEscape="true"/>

<c:set var="firstPickupItem" value="true"></c:set>

<c:forEach items="${cartData.pickupOrderGroups}" var="groupData" varStatus="status">
    <div class="checkout-shipping-items row tc-checkout-shipment-container">
        <div class="col-xs-12 checkout-pickup-items">
            <div class="checkout-shipping-items-header tc-checkout-shipment-header">
                <spring:theme code="checkout.multi.pickup.items" arguments="${status.index + 1},${fn:length(groupData.entries)}"
                              text="Pick Up # ${status.index + 1} - ${fn:length(groupData.entries)} Item(s)">
                </spring:theme>
            </div>

            <ul class="tc-clean-list">
                <c:forEach items="${groupData.entries}" var="entry">
                    <c:url value="${entry.product.url}" var="productUrl"/>
                    <li class="row">
                        <span class="name col-xs-8 tc-checkout-shipment-name">${fn:escapeXml(entry.product.name)}</span>
                        <span class="qty col-xs-4 tc-checkout-shipment-qty"><spring:theme
                                code="basket.page.quantity"/>:&nbsp;${entry.quantity}</span>
                    </li>
                </c:forEach>
                <c:set var="firstPickupItem" value="true"></c:set>
            </ul>
        </div>

        <div class="col-xs-12 ">
            <div class="checkout-shipping-items-header tc-checkout-shipment-header">
                <spring:theme code="checkout.multi.inStore"/>
            </div>
            <div class="tc-checkout-shipment-address">
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
        </div>
    </div>
</c:forEach>
