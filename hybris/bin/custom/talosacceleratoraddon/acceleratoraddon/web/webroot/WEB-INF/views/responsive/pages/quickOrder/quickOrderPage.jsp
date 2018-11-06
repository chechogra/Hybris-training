<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/addons/talosacceleratoraddon/responsive/template" %>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags" %>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/responsive/product" %>
<%@ taglib prefix="quickorder" tagdir="/WEB-INF/tags/responsive/quickorder" %>
<%@ taglib prefix="tc-quickorder" tagdir="/WEB-INF/tags/addons/talosacceleratoraddon/responsive/quickorder" %>

<%@ taglib prefix="theme" tagdir="/WEB-INF/tags/shared/theme" %>

<spring:htmlEscape defaultHtmlEscape="true"/>
<spring:theme code="product.grid.confirmQtys.message" var="gridConfirmMessage"/>
<template:page pageTitle="${pageTitle}">
    <div class="container-fluid tc-container">
        <div id="quickOrder" class="tc-account-section" data-grid-confirm-message="${gridConfirmMessage}">
            <div class="tc-account-section-content">
                <div class="tc-quickorder-header">
                    <spring:theme code="text.quickOrder.header"/>
                </div>

                <div class="row">
                    <div class="col-xs-12 col-md-7 col-lg-6">
                        <div class="quick-order__introduction">
                            <cms:pageSlot position="TopContent" var="feature">
                                <cms:component component="${feature}" element="div" class="yComponentWrapper"/>
                            </cms:pageSlot>
                        </div>
                    </div>
                        <%--<product:addToCartTitle/>--%>
                    <div class="col-xs-12 col-md-5 col-lg-6">
                        <ul class="tc-quickorder-actions">
                            <li>
                                <quickorder:quickorderResetButton resetBtnId="js-reset-quick-order-form-btn-top"
                                                                  resetBtnClass="quick-order__reset-link btn btn-default"/>
                            </li>
                            <li>
                                <product:productFormAddToCartButton addToCartBtnId="js-add-to-cart-quick-order-btn-top"/>
                            </li>
                        </ul>

                    </div>
                </div>

                <tc-quickorder:quickorderListRows/>
                <div class="row">
                    <div class="col-xs-12 col-md-5 col-md-offset-7 col-lg-6 col-lg-offset-6">
                        <ul class="tc-quickorder-actions">
                            <li>
                                <quickorder:quickorderResetButton resetBtnId="js-reset-quick-order-form-btn-bottom"
                                                                  resetBtnClass="quick-order__reset-link btn btn-default"/>
                            </li>
                            <li>
                                <product:productFormAddToCartButton addToCartBtnId="js-add-to-cart-quick-order-btn-bottom"/>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template:page>
