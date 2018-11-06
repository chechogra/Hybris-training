<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags" %>

<c:set value="${fn:escapeXml(component.styleClass)}" var="navigationClass"/>

<c:if test="${component.visible}">
    <c:forEach items="${component.navigationNode.children}" var="topLevelChild">
        <c:forEach items="${topLevelChild.entries}" var="entry">
            <cms:component component="${entry.item}" element="li" evaluateRestriction="true"/>
        </c:forEach>
    </c:forEach>
</c:if>
