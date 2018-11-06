<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ attribute name="cartData" required="true" type="de.hybris.platform.commercefacades.order.data.CartData" %>
<%@ attribute name="showDeliveryAddress" required="true" type="java.lang.Boolean" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<spring:htmlEscape defaultHtmlEscape="true"/>

<c:set var="hasShippedItems" value="${cartData.deliveryItemsQuantity > 0}"/>
<c:set var="deliveryAddress" value="${cartData.deliveryAddress}"/>
<c:set var="firstShippedItem" value="true"></c:set>

<c:if test="${hasShippedItems}">
    <div class="checkout-shipping-items row">
        <div class="col-xs-12">
            <div class="checkout-shipping-items-header tc-checkout-shipment-header">
                <spring:theme code="checkout.multi.shipment.items" arguments="${cartData.deliveryItemsQuantity}"/>
            </div>
            <ul class="tc-clean-list">
                <c:forEach items="${cartData.entries}" var="entry">
                    <c:if test="${entry.deliveryPointOfService == null}">
                        <li class="row">
                            <span class="name col-xs-8 tc-checkout-shipment-name">${fn:escapeXml(entry.product.name)}</span>
                            <span class="qty col-xs-4 tc-checkout-shipment-qty"><spring:theme code="basket.page.quantity"/>:&nbsp;${entry.quantity}</span>
                        </li>
                    </c:if>
                </c:forEach>
            </ul>
        </div>

        <c:if test="${showDeliveryAddress and not empty deliveryAddress}">
            <div class="col-sm-12 col-lg-6">
                <div class="checkout-shipping-items-header tc-checkout-shipment-header"><spring:theme
                        code="checkout.summary.shippingAddress"></spring:theme></div>
                <span>
                    <b>${fn:escapeXml(deliveryAddress.title)}&nbsp;${fn:escapeXml(deliveryAddress.firstName)}&nbsp;${fn:escapeXml(deliveryAddress.lastName)}</b>
                    <br/>
                    <c:if test="${ not empty deliveryAddress.line1 }">
                        ${fn:escapeXml(deliveryAddress.line1)},&nbsp;
                    </c:if>
                    <c:if test="${ not empty deliveryAddress.line2 }">
                        ${fn:escapeXml(deliveryAddress.line2)},&nbsp;
                    </c:if>
                    <c:if test="${not empty deliveryAddress.town }">
                        ${fn:escapeXml(deliveryAddress.town)},&nbsp;
                    </c:if>
                    <c:if test="${ not empty deliveryAddress.region.name }">
                        ${fn:escapeXml(deliveryAddress.region.name)},&nbsp;
                    </c:if>
                    <c:if test="${ not empty deliveryAddress.postalCode }">
                        ${fn:escapeXml(deliveryAddress.postalCode)},&nbsp;
                    </c:if>
                    <c:if test="${ not empty deliveryAddress.country.name }">
                        ${fn:escapeXml(deliveryAddress.country.name)}
                    </c:if>
                    <br/>
                    <c:if test="${ not empty deliveryAddress.phone }">
                        ${fn:escapeXml(deliveryAddress.phone)}
                    </c:if>
                </span>
            </div>
        </c:if>
    </div>
</c:if>
