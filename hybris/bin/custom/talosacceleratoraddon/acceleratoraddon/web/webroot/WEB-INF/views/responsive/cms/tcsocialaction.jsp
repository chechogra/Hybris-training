<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="symbolDefsPath" value="${contextPath}/_ui/addons/talosacceleratoraddon/responsive/common/images/symbol-defs.svg"/>

<a href="<c:out value='${localizedUrl}'/>" class="tc-social-action-link">
    <svg class="icon icon-${iconCode}">
        <use xlink:href="${symbolDefsPath}#icon-${iconCode}"></use>
    </svg>
</a>