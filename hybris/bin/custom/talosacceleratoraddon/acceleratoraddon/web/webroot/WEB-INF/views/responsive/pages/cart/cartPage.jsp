<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/addons/talosacceleratoraddon/responsive/template" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags" %>
<%@ taglib prefix="cart" tagdir="/WEB-INF/tags/addons/talosacceleratoraddon/responsive/cart" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<spring:htmlEscape defaultHtmlEscape="true"/>

<template:page pageTitle="${pageTitle}">

    <cart:cartValidation/>
    <cart:cartPickupValidation/>

    <div class="container-fluid tc-container tc-cart-page">
        <div class="tc-cart-additional-wp">
            <cms:pageSlot position="TopContent" var="feature">
                <cms:component component="${feature}" element="div" class="yComponentWrapper"/>
            </cms:pageSlot>

            <c:if test="${not empty cartData.rootGroups}">

                <div class="row tc-cart-bottom-content">
                    <div class="col-sm-6">
                        <cms:pageSlot position="CenterLeftContentSlot" var="feature">
                            <cms:component component="${feature}" element="div" class="yComponentWrapper"/>
                        </cms:pageSlot>
                    </div>
                    <div class="col-sm-6">
                        <cms:pageSlot position="CenterRightContentSlot" var="feature">
                            <cms:component component="${feature}" element="div" class="yComponentWrapper"/>
                        </cms:pageSlot>
                        <cms:pageSlot position="BottomContentSlot" var="feature">
                            <c:if test="${feature.uid ne 'CartSuggestions'}">
                                <cms:component component="${feature}" element="div" class="yComponentWrapper"/>
                            </c:if>
                        </cms:pageSlot>
                    </div>
                </div>
                <cms:pageSlot position="BottomContentSlot" var="feature">
                    <c:if test="${feature.uid eq 'CartSuggestions'}">
                        <cms:component component="${feature}" element="div" class="yComponentWrapper"/>
                    </c:if>
                </cms:pageSlot>
            </c:if>
            <c:if test="${empty cartData.rootGroups}">
                <cms:pageSlot position="EmptyCartMiddleContent" var="feature">
                    <cms:component component="${feature}" element="div" class="yComponentWrapper content__empty"/>
                </cms:pageSlot>
            </c:if>
        </div>
    </div>
</template:page>
