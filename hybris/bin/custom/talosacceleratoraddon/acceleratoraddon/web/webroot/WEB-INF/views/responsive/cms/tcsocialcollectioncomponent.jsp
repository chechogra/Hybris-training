<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="action" tagdir="/WEB-INF/tags/responsive/action" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags" %>

<c:if test="${component.visible}">
    <ul class="tc-social-wp">
        <c:forEach items="${component.actions}" var="action" varStatus="idx">
            <c:if test="${action.visible}">
                <cms:component component="${action}"
                               parentComponent="${component}"
                               evaluateRestriction="true"
                               class="tc-social-action-wp"
                               element="li"/>
            </c:if>
        </c:forEach>
    </ul>
</c:if>