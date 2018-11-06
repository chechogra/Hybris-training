<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="format" tagdir="/WEB-INF/tags/shared/format" %>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/responsive/product" %>
<%@ taglib prefix="component" tagdir="/WEB-INF/tags/shared/component" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<spring:htmlEscape defaultHtmlEscape="true" />
<c:set var="symbolDefsPath" value="${contextPath}/_ui/addons/talosacceleratoraddon/responsive/common/images/symbol-defs.svg"/>

<c:choose>
	<c:when test="${not empty productData}">
		<div class="tc-product-carousel-wp
			<c:if test="${component.rotateActiveItem}">rotate-active-item</c:if>"
			 data-icon-path="${symbolDefsPath}"
			 data-nav-color="${component.navColor}"
			 data-background-color="${component.backgroundColor}">
			<c:if test="${not empty title}">
				<div class="tc-product-carousel-headline">${fn:escapeXml(title)}</div>
			</c:if>
			<c:choose>
				<c:when test="${component.popup}">
					<div class="tc-product-carousel-inner">
						<div class="quickView-header display-none">
							<div class="headline">
								<span class="headline-text"><spring:theme code="popup.quick.view.select"/></span>
							</div>
						</div>
						<c:forEach items="${productData}" var="product">

							<c:url value="${product.url}/quickView" var="productQuickViewUrl"/>
							<div class="tc-product-carousel-item">
								<a href="${productQuickViewUrl}">
									<div class="product-image">
										<product:productPrimaryReferenceImage product="${product}" format="product"/>
									</div>
									<div class="product-info">
										<div class="product-name">${fn:escapeXml(product.name)}</div>
										<div class="product-price"><format:fromPrice priceData="${product.price}"/></div>
									</div>
								</a>
							</div>
						</c:forEach>
					</div>
				</c:when>
				<c:otherwise>
					<div class="owl-carousel tc-product-carousel-inner">
						<c:forEach items="${productData}" var="product">
							<c:url value="${product.url}" var="productUrl"/>

							<div class="item tc-product-carousel-item">
								<a href="${productUrl}">
									<div class="product-image">
										<product:productPrimaryImage product="${product}" format="product"/>
									</div>
									<div class="product-info">
										<div class="product-name">${fn:escapeXml(product.name)}</div>
										<div class="product-price"><format:fromPrice priceData="${product.price}"/></div>
									</div>
									<button href="${productUrl}" class="btn btn-default">Shop now</button>
								</a>
							</div>
						</c:forEach>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</c:when>

	<c:otherwise>
		<component:emptyComponent/>
	</c:otherwise>
</c:choose>

