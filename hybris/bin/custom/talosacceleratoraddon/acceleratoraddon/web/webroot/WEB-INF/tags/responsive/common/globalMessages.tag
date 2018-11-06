<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:set var="symbolDefsPath" value="${contextPath}/_ui/addons/talosacceleratoraddon/responsive/common/images/symbol-defs.svg"/>

<c:if test="${(not empty accConfMsgs) || (not empty accInfoMsgs) || (not empty accErrorMsgs)}">
    <div class="global-alerts">
            <%-- Information (confirmation) messages --%>
        <c:if test="${not empty accConfMsgs}">
            <c:forEach items="${accConfMsgs}" var="msg">
                <div class="alert alert-info alert-dismissable">
                    <div class="tc-global-message-wp info container tc-container">
                        <button class="close" aria-hidden="true" data-dismiss="alert" type="button">
                            <svg class="icon icon-close">
                                <use xmlns:xlink="http://www.w3.org/1999/xlink"
                                     xlink:href="${symbolDefsPath}#icon-close"></use>
                            </svg>
                        </button>
                        <spring:theme code="${msg.code}" arguments="${msg.attributes}"/>
                    </div>
                </div>
            </c:forEach>
        </c:if>

            <%-- Warning messages --%>
        <c:if test="${not empty accInfoMsgs}">
            <c:forEach items="${accInfoMsgs}" var="msg">
                <div class="alert alert-warning alert-dismissable">
                    <div class="tc-global-message-wp warning container tc-container">
                        <button class="close" aria-hidden="true" data-dismiss="alert" type="button">
                            <svg class="icon icon-close">
                                <use xmlns:xlink="http://www.w3.org/1999/xlink"
                                     xlink:href="${symbolDefsPath}#icon-close"></use>
                            </svg>
                        </button>
                        <spring:theme code="${msg.code}" arguments="${msg.attributes}"/>
                    </div>
                </div>
            </c:forEach>
        </c:if>

            <%-- Error messages (includes spring validation messages)--%>
        <c:if test="${not empty accErrorMsgs}">
            <c:forEach items="${accErrorMsgs}" var="msg">
                <div class="alert alert-danger alert-dismissable">
                    <div class="tc-global-message-wp danger container tc-container">
                        <button class="close" aria-hidden="true" data-dismiss="alert" type="button">
                            <svg class="icon icon-close">
                                <use xmlns:xlink="http://www.w3.org/1999/xlink"
                                     xlink:href="${symbolDefsPath}#icon-close"></use>
                            </svg>
                        </button>
                        <spring:theme code="${msg.code}" arguments="${msg.attributes}"/>
                    </div>
                </div>
            </c:forEach>
        </c:if>
    </div>
</c:if>
