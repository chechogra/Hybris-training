<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ attribute name="galleryImages" required="true" type="java.util.List" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/responsive/product" %>

<c:set var="symbolDefsPath" value="${contextPath}/_ui/addons/talosacceleratoraddon/responsive/common/images/symbol-defs.svg"/>

<c:choose>
    <c:when test="${galleryImages == null || galleryImages.size() == 0}">
        <c:set var="gallerySize" value="1"/>
    </c:when>
    <c:otherwise>
        <c:set var="gallerySize" value="${galleryImages.size()}"/>
    </c:otherwise>
</c:choose>

<div class="tc-product-gallery-wp" data-gallery-size="${gallerySize}">
    <c:choose>
        <c:when test="${galleryImages == null || galleryImages.size() == 0}">
            <div class="tc-product-gallery-inner tc-no-image">
                <div class="tc-product-gallery-item">
                    <spring:theme code="img.missingProductImage.responsive.product" text="/" var="imagePath"/>
                    <c:choose>
                        <c:when test="${originalContextPath ne null}">
                            <c:url value="${imagePath}" var="imageUrl" context="${originalContextPath}"/>
                        </c:when>
                        <c:otherwise>
                            <c:url value="${imagePath}" var="imageUrl"/>
                        </c:otherwise>
                    </c:choose>
                    <img src="${imageUrl}"/>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <ul class="tc-product-gallery-inner">
                <c:forEach items="${galleryImages}" var="container" varStatus="varStatus">
                    <li data-thumb="${container.thumbnail.url}" data-src="${container.superZoom.url}">
                        <img src="${container.zoom.url}"
                             alt="${fn:escapeXml(container.thumbnail.altText)}">
                        <div class="tc-image-zoom-wp"></div>
                    </li>
                </c:forEach>
            </ul>
        </c:otherwise>
    </c:choose>
</div>
