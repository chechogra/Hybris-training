<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/addons/talosacceleratoraddon/responsive/template" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="address" tagdir="/WEB-INF/tags/addons/talosacceleratoraddon/responsive/address" %>
<%@ taglib prefix="multi-checkout" tagdir="/WEB-INF/tags/addons/talosacceleratoraddon/responsive/checkout/multi" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>

<spring:htmlEscape defaultHtmlEscape="true"/>

<template:page pageTitle="${pageTitle}">
    <div class="container-fluid tc-container">
        <div class="row">
            <div class="col-sm-6">
                <div class="checkout-headline tc-sp-checkout-step-headline">
                    <span class="glyphicon glyphicon-lock"></span>
                    <spring:theme code="checkout.multi.secure.checkout"/>
                </div>
                <multi-checkout:checkoutSteps checkoutSteps="${checkoutSteps}" progressBarId="${progressBarId}">
                    <jsp:body>
                        <ycommerce:testId code="checkoutStepOne">
                            <div class="checkout-shipping tc-checkout-step-container">
                                <multi-checkout:shipmentItems cartData="${cartData}" showDeliveryAddress="false"/>

                                <div class="checkout-indent">
                                    <div class="headline tc-sp-checkout-current-step-title"><spring:theme code="checkout.summary.shippingAddress"/></div>


                                    <address:addressFormSelector supportedCountries="${countries}"
                                                                 regions="${regions}" cancelUrl="${currentStepUrl}"
                                                                 country="${country}"/>

                                    <div id="addressbook">

                                        <c:forEach items="${deliveryAddresses}" var="deliveryAddress" varStatus="status">
                                            <div class="addressEntry tc-saved-info-container">
                                                <form action="${request.contextPath}/checkout/multi/delivery-address/select"
                                                      method="GET">
                                                    <input type="hidden" name="selectedAddressCode"
                                                           value="${fn:escapeXml(deliveryAddress.id)}"/>
                                                    <ul class="tc-saved-info-list">
                                                        <li class="tc-saved-info-details">
                                                            <strong>${fn:escapeXml(deliveryAddress.title)}&nbsp;
                                                                    ${fn:escapeXml(deliveryAddress.firstName)}&nbsp;
                                                                    ${fn:escapeXml(deliveryAddress.lastName)}</strong>
                                                            <br>
                                                                ${fn:escapeXml(deliveryAddress.line1)}&nbsp;
                                                                ${fn:escapeXml(deliveryAddress.line2)}
                                                            <br>
                                                                ${fn:escapeXml(deliveryAddress.town)}
                                                            <c:if test="${not empty deliveryAddress.region.name}">
                                                                &nbsp;${fn:escapeXml(deliveryAddress.region.name)}
                                                            </c:if>
                                                            <br>
                                                                ${fn:escapeXml(deliveryAddress.country.name)}&nbsp;
                                                                ${fn:escapeXml(deliveryAddress.postalCode)}
                                                        </li>
                                                    </ul>
                                                    <button type="submit" class="btn btn-primary btn-block">
                                                        <spring:theme code="checkout.multi.deliveryAddress.useThisAddress"/>
                                                    </button>
                                                </form>
                                            </div>
                                        </c:forEach>
                                    </div>

                                    <address:suggestedAddresses selectedAddressUrl="/checkout/multi/delivery-address/select"/>
                                </div>

                                <multi-checkout:pickupGroups cartData="${cartData}"/>
                                <button id="addressSubmit" type="button"
                                        class="btn btn-primary btn-block checkout-next"><spring:theme
                                        code="checkout.multi.deliveryAddress.continue"/></button>
                            </div>
                        </ycommerce:testId>
                    </jsp:body>
                </multi-checkout:checkoutSteps>
            </div>

            <div class="col-sm-6 col-xs-12">
                <multi-checkout:checkoutOrderDetails cartData="${cartData}" showDeliveryAddress="false" showPaymentInfo="false"
                                                     showTaxEstimate="false" showTax="true"/>
            </div>

            <div class="col-xs-12 col-lg-12">
                <cms:pageSlot position="SideContent" var="feature" element="div" class="checkout-help">
                    <cms:component component="${feature}"/>
                </cms:pageSlot>
            </div>
        </div>
    </div>
</template:page>
