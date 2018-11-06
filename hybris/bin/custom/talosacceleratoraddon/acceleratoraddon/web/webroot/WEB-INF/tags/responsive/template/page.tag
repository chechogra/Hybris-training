<%@ tag body-content="scriptless" trimDirectiveWhitespaces="true" %>
<%@ attribute name="pageTitle" required="false" rtexprvalue="true" %>
<%@ attribute name="pageCss" required="false" fragment="true" %>
<%@ attribute name="pageScripts" required="false" fragment="true" %>
<%@ attribute name="hideHeaderLinks" required="false" %>

<%@ taglib prefix="template" tagdir="/WEB-INF/tags/addons/talosacceleratoraddon/responsive/template" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="header" tagdir="/WEB-INF/tags/addons/talosacceleratoraddon/responsive/common/header" %>
<%@ taglib prefix="footer" tagdir="/WEB-INF/tags/responsive/common/footer" %>
<%@ taglib prefix="common" tagdir="/WEB-INF/tags/responsive/common" %>
<%@ taglib prefix="tc-common" tagdir="/WEB-INF/tags/addons/talosacceleratoraddon/responsive/common" %>
<%@ taglib prefix="cart" tagdir="/WEB-INF/tags/responsive/cart" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<spring:htmlEscape defaultHtmlEscape="true"/>

<template:master pageTitle="${pageTitle}">

	<jsp:attribute name="pageCss">
		<jsp:invoke fragment="pageCss"/>
	</jsp:attribute>

    <jsp:attribute name="pageScripts">
		<jsp:invoke fragment="pageScripts"/>
	</jsp:attribute>

    <jsp:body>
        <header:header hideHeaderLinks="${hideHeaderLinks}"/>
        <main class="tc-main-content" data-currency-iso-code="${fn:escapeXml(currentCurrency.isocode)}">
            <tc-common:globalMessages/>
            <cart:cartRestoration/>
            <jsp:doBody/>
                <%--<div style="height: 300px; background-color: red; margin-bottom: 20px">hola mundo</div>
                <div style="height: 300px; background-color: blue; margin-bottom: 20px">hola mundo</div>
                <div style="height: 300px; background-color: green; margin-bottom: 20px">hola mundo</div>
                <div style="height: 300px; background-color: orange; margin-bottom: 20px">hola mundo</div>--%>
        </main>
        <footer:footer/>
    </jsp:body>

</template:master>
