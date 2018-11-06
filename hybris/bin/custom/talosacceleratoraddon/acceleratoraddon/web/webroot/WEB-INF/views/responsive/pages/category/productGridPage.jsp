<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/addons/talosacceleratoraddon/responsive/template" %>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags" %>
<%@ taglib prefix="common" tagdir="/WEB-INF/tags/responsive/common" %>
<%@ taglib prefix="storepickup" tagdir="/WEB-INF/tags/responsive/storepickup" %>


<template:page pageTitle="${pageTitle}">
    <div class="container-fluid tc-product-grid-container">
        <cms:pageSlot position="Section1" var="feature" element="div" class="product-grid-section1-slot">
            <cms:component component="${feature}" element="div" class="yComponentWrapper map product-grid-section1-component"/>
        </cms:pageSlot>

        <div class="row">
            <div class="col-xs-12 col-md-3 tc-refinements-wp">
                <cms:pageSlot position="ProductLeftRefinements" var="feature" element="div"
                              class="product-grid-left-refinements-slot">
                    <cms:component component="${feature}" element="div"
                                   class="yComponentWrapper product-grid-left-refinements-component"/>
                </cms:pageSlot>
            </div>
            <div class="col-sm-12 col-md-9 tc-grid-component-wp">
                <cms:pageSlot position="ProductGridSlot" var="feature" element="div" class="product-grid-right-result-slot">
                    <cms:component component="${feature}" element="div"
                                   class="product__list--wrapper yComponentWrapper product-grid-right-result-component"/>
                </cms:pageSlot>
            </div>
        </div>
        <storepickup:pickupStorePopup/>
    </div>
</template:page>

