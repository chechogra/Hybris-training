<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/addons/talosacceleratoraddon/responsive/template" %>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags" %>

<template:page pageTitle="${pageTitle}">
    <div class="container-fluid tc-container">
        <div class="row">
            <div class="col-sm-6">
                <cms:pageSlot position="LeftContentSlot" var="feature" element="div" class="login-left-content-slot">
                    <cms:component component="${feature}" element="div" class="login-left-content-component"/>
                </cms:pageSlot>
            </div>
            <div class="tc-signup-column-wp col-sm-6">
                <cms:pageSlot position="RightContentSlot" var="feature" element="div" class="login-right-content-slot">
                    <cms:component component="${feature}" element="div" class="login-right-content-component"/>
                </cms:pageSlot>
            </div>
        </div>
    </div>
</template:page>
