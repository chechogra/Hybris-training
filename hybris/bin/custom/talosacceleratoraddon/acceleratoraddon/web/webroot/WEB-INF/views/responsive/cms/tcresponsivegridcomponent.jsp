<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags" %>

<c:if test="${component.visible}">
    <div class="tc-responsive-grid-wp">
         <div class="grid-sizer"></div>
        <c:forEach items="${component.gridItems}" var="item">
            <cms:component component="${item}"/>
        </c:forEach>
    </div>
</c:if>
