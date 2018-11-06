<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="formElement" tagdir="/WEB-INF/tags/responsive/formElement" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:if test="${component.visible}">
    <div class="tc-signup-wp">
        <input type="text" placeholder="<spring:theme code='tc.sign.up.placeholder'/>">
        <button type="submit" class="btn btn-default btn-block">
            <spring:theme code='tc.sign.up'/>
        </button>
    </div>
</c:if>