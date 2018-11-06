<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags" %>


<ul class="tc-tabs-titles">
    <c:forEach var="component" items="${components}">
        <li class="tc-tab-trigger" id="${component.uid}" data-tabContainer="${component.uid}">
            <a href="javascript:void(0)">${fn:escapeXml(component.title)}</a>
        </li>
    </c:forEach>
</ul>
<ul class="tc-collapsible-group tc-pdp-tabs js-tc-tabs" role="tablist" aria-multiselectable="true">
    <c:forEach var="component" items="${components}">
        <cms:component component="${component}"/>
    </c:forEach>
</ul>
