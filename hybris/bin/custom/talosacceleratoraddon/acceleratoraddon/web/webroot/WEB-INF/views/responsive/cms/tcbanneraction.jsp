<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:choose>
    <c:when test="${not empty localizedUrl}">
        <c:set var="displayedUrl" value="${localizedUrl}"/>
    </c:when>
    <c:otherwise>
        <c:set var="displayedUrl" value="${url}"/>
    </c:otherwise>
</c:choose>

<a href="<c:out value='${displayedUrl}'/>"
   class="tc-banner-action btn ${fn:toLowerCase(fn:replace(style,'_','-'))}">
    ${text}
</a>