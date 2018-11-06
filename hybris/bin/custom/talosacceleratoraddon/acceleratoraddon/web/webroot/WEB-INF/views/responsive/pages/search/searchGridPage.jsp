<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/addons/talosacceleratoraddon/responsive/template" %>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags" %>
<%@ taglib prefix="storepickup" tagdir="/WEB-INF/tags/responsive/storepickup" %>


<template:page pageTitle="${pageTitle}">
    <div class="container-fluid tc-product-grid-container">
        <div class="row">
            <div class="col-xs-12 col-md-3 tc-refinements-wp">
                <cms:pageSlot position="ProductLeftRefinements" var="feature" element="div"
                              class="search-grid-page-left-refinements-slot">
                    <cms:component component="${feature}" element="div" class="search-grid-page-left-refinements-component"/>
                </cms:pageSlot>
            </div>
            <div class="col-sm-12 col-md-9 tc-grid-component-wp">
                <cms:pageSlot position="SearchResultsGridSlot" var="feature" element="div"
                              class="search-grid-page-result-grid-slot">
                    <cms:component component="${feature}" element="div" class="search-grid-page-result-grid-component"/>
                </cms:pageSlot>
            </div>
        </div>
    </div>
    <storepickup:pickupStorePopup/>
</template:page>
