<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ attribute name="idKey" required="true" type="java.lang.String" %>
<%@ attribute name="labelKey" required="true" type="java.lang.String" %>
<%@ attribute name="path" required="true" type="java.lang.String" %>
<%@ attribute name="mandatory" required="false" type="java.lang.Boolean" %>
<%@ attribute name="labelCSS" required="false" type="java.lang.String" %>
<%@ attribute name="inputCSS" required="false" type="java.lang.String" %>
<%@ attribute name="placeholder" required="false" type="java.lang.String" %>
<%@ attribute name="tabindex" required="false" rtexprvalue="true" %>
<%@ attribute name="autocomplete" required="false" type="java.lang.String" %>
<%@ attribute name="disabled" required="false" type="java.lang.Boolean" %>
<%@ attribute name="maxlength" required="false" type="java.lang.Integer" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>

<spring:htmlEscape defaultHtmlEscape="true"/>

<template:errorSpanField path="${path}">
    <ycommerce:testId code="LoginPage_Item_${idKey}">

        <c:set var="mandatoryText" value=""/>

        <c:if test="${mandatory != null && mandatory == true}">
            <c:set var="mandatoryText" value="*"/>
        </c:if>
        <spring:theme code="${labelKey}" var="placeHolderMessage"/>
        <form:input cssClass="${inputCSS} tc-input" id="${idKey}" path="${path}"
                    tabindex="${tabindex}" autocomplete="${autocomplete}" placeholder="${placeHolderMessage} ${mandatoryText}"
                    disabled="${disabled}" maxlength="${maxlength}"/>
    </ycommerce:testId>
</template:errorSpanField>
