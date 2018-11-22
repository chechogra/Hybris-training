<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags" %>

<c:if test="${component.visible}">
    <div class="tf-responsive-banner-wp"
         <c:if test="${not empty component.backgroundImage}">
            data-media="${component.backgroundImage.url}"
            style="background-image: url(${component.backgroundImage.url})"
         </c:if>
        >
        <c:if test="${not empty component.title}">
            <p class="tf-responsive-banner__title">
                ${component.title}
                <br>
                <c:if test="${not empty component.subtitle}">
                    <span class="tf-responsive-banner__subtitle">
                        ${component.subtitle}
                    </span>
                </c:if>
            </p>
            <svg class="tf-responsive-banner__intro-arrow" height="70" width="70"><polyline points="26,34 40,50 54,34" stroke="#FFFFFF" stroke-width="4" fill="transparent" style="stroke-dashoffset: 1e-05; stroke-dasharray: none;"></polyline></svg>
        </c:if>
            <!--
            <c:if test="${not empty component.actions}">
                <ul class="action-container">
                    <c:forEach items="${component.actions}" var="action" varStatus="idx">
                        <c:if test="${action.visible}">
                            <cms:component component="${action}"
                                           parentComponent="${component}"
                                           evaluateRestriction="true"
                                           element="li"/>
                        </c:if>
                    </c:forEach>
                </ul>
            </c:if>
            -->
    </div>
</c:if>
