<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ attribute name="idKey" required="true" type="java.lang.String" %>
<%@ attribute name="labelKey" required="true" type="java.lang.String" %>
<%@ attribute name="path" required="true" type="java.lang.String" %>
<%@ attribute name="mandatory" required="false" type="java.lang.Boolean" %>
<%@ attribute name="labelCSS" required="false" type="java.lang.String" %>
<%@ attribute name="areaCSS" required="false" type="java.lang.String" %>
<%@ attribute name="disabled" required="false" type="java.lang.Boolean" %>
<%@ attribute name="maxlength" required="false" type="java.lang.Integer" %>
<%@ attribute name="rows" required="false" type="java.lang.Integer" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template" %>

<template:errorSpanField path="${path}">
    <c:set var="mandatoryText" value=""/>
    <c:if test="${mandatory != null && mandatory == true}">
        <c:set var="mandatoryText" value="*"/>
    </c:if>

    <c:if test="${empty rows}">
        <c:set var="rows" value="4"/>
    </c:if>

    <spring:theme code="${labelKey}" var="placeHolderMessage"/>
    <form:textarea cssClass="${areaCSS} tc-textarea" id="${idKey}" path="${path}" disabled="${disabled}"
                   placeholder="${placeHolderMessage} ${mandatoryText}"
                   maxlength="${maxlength}" rows="${rows}"/>
</template:errorSpanField>
