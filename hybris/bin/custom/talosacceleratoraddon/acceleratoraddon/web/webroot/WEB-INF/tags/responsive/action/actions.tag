<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ attribute name="element" required="true" type="java.lang.String" %>
<%@ attribute name="styleClass" required="false" type="java.lang.String" %>
<%@ attribute name="parentComponent" required="false"
              type="de.hybris.platform.cms2.model.contents.components.AbstractCMSComponentModel" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:forEach items="${parentComponent.actions}" var="action" varStatus="idx">
    <c:if test="${action.visible}">
        <${element} class="${fn:escapeXml(parentComponent.uid)}-${fn:escapeXml(action.uid)} ${styleClass}" data-index="${idx.index + 1}">
        <cms:component component="${action}" parentComponent="${parentComponent}" evaluateRestriction="true"/>
        </${element}>
    </c:if>
</c:forEach>
