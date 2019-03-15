<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ attribute name="product" required="true" type="de.hybris.platform.commercefacades.product.data.ProductData" %>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/responsive/product" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="action" tagdir="/WEB-INF/tags/addons/talosacceleratoraddon/responsive/action" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ attribute name="currentComponent" required="true"
              type="de.hybris.platform.cms2.model.contents.components.AbstractCMSComponentModel" %>


<spring:htmlEscape defaultHtmlEscape="true"/>


<spring:theme code="text.addToCart" var="addToCartText"/>
<c:url value="${product.url}" var="productUrl"/>
<c:set value="${not empty product.potentialPromotions}" var="hasPromotion"/>
<div class="product-item-wp">
    <div class="product-item">
        <ycommerce:testId code="product_wholeProduct">
            <div class="product-item-inner">
                <div class="product-image-wp">
                    <a class="thumb" href="${productUrl}" title="${fn:escapeXml(product.name)}">
                        <product:productPrimaryImage product="${product}" format="product"/>
                    </a>
                </div>

                <div class="product-content-wp">
                    <div class="details">
                        <ycommerce:testId code="product_productName">
                            <a class="name" href="${productUrl}">
                                <c:out escapeXml="false" value="${ycommerce:sanitizeHTML(product.name)}"/>
                            </a>
                        </ycommerce:testId>

                        <c:if test="${not empty product.potentialPromotions}">
                            <div class="promo">
                                <c:forEach items="${product.potentialPromotions}" var="promotion">
                                    ${ycommerce:sanitizeHTML(promotion.description)}
                                </c:forEach>
                            </div>
                        </c:if>

                        <ycommerce:testId code="product_productPrice">
                            <c:if test="${not empty product.price}">
                                <div class="price"><product:productListerItemPrice product="${product}"/></div>
                            </c:if>
                        </ycommerce:testId>

                        <c:if test="${not empty product.creationDate}">
                            <div>
                                <p><spring:theme code="text.product.creationDate"/>: <fmt:formatDate value="${product.creationDate}" pattern="dd-MM-yyyy"/></p>
                            </div>
                        </c:if>

                        <div class="product-variable-content">
                            <div class="variant-container <c:if test="${empty product.variantOptions or product.variantOptions.size() == 0}">tc-no-variants</c:if>">
                                <div class="variant-option-container">

                                    <c:if test="${not empty product.variantOptions and product.variantOptions.size() gt 0}">
                                        <c:set value="${ycommerce:productImage(product, 'product')}" var="primaryImage"/>

                                        <c:choose>
                                            <c:when test="${not empty primaryImage}">
                                                <c:url value="${primaryImage.url}" var="primaryImageUrl"
                                                       context="${originalContextPath}"/>
                                            </c:when>
                                            <c:otherwise>
                                                <spring:theme code="img.missingProductImage.responsive.product" text="/"
                                                              var="imagePath"/>
                                                <c:choose>
                                                    <c:when test="${originalContextPath ne null}">
                                                        <c:url value="${imagePath}" var="primaryImageUrl"
                                                               context="${originalContextPath}"/>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:url value="${imagePath}" var="primaryImageUrl"/>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:otherwise>
                                        </c:choose>

                                        <c:set value="${ycommerce:productImage(product, 'thumbnail')}"
                                               var="primaryThumbnailImage"/>

                                        <c:choose>
                                            <c:when test="${not empty primaryThumbnailImage}">
                                                <c:url value="${primaryThumbnailImage.url}" var="primaryThumbnailImageUrl"
                                                       context="${originalContextPath}"/>
                                            </c:when>
                                            <c:otherwise>
                                                <spring:theme code="img.missingProductImage.responsive.thumbnail" text="/"
                                                              var="imagePath"/>
                                                <c:choose>
                                                    <c:when test="${originalContextPath ne null}">
                                                        <c:url value="${imagePath}" var="primaryThumbnailImageUrl"
                                                               context="${originalContextPath}"/>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:url value="${imagePath}" var="primaryThumbnailImageUrl"/>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:otherwise>
                                        </c:choose>

                                        <div class="variant-option-container-inner"
                                             data-image-url="${primaryImageUrl}" data-target-url="${productUrl}">
                                            <a href="${productUrl}">
                                                <img src="${primaryThumbnailImageUrl}"/>
                                            </a>
                                        </div>
                                    </c:if>

                                    <c:forEach var="variantOption" items="${product.variantOptions}">
                                        <c:forEach items="${variantOption.variantOptionQualifiers}" var="variantOptionQualifier">
                                            <c:if test="${variantOptionQualifier.qualifier eq 'rollupProperty'}">
                                                <c:set var="rollupProperty" value="${variantOptionQualifier.value}"/>
                                            </c:if>
                                            <c:if test="${variantOptionQualifier.qualifier eq 'thumbnail'}">
                                                <c:set var="imageUrl" value="${fn:escapeXml(variantOptionQualifier.value)}"/>
                                            </c:if>
                                            <c:if test="${variantOptionQualifier.qualifier eq 'product'}">
                                                <c:set var="imageGridUrl" value="${fn:escapeXml(variantOptionQualifier.value)}"/>
                                            </c:if>
                                            <c:if test="${variantOptionQualifier.qualifier eq rollupProperty}">
                                                <c:set var="variantName" value="${fn:escapeXml(variantOptionQualifier.value)}"/>
                                            </c:if>
                                        </c:forEach>

                                        <div class="variant-option-container-inner" data-image-url="${imageGridUrl}"
                                             data-target-url="${variantOption.url}">
                                            <a href="${variantOption.url}">
                                                <img src="${imageUrl}" title="${variantName}"
                                                     alt="${variantName}"/>
                                            </a>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                            <c:set var="product" value="${product}" scope="request"/>
                            <c:set var="addToCartText" value="${addToCartText}" scope="request"/>
                            <c:set var="addToCartUrl" value="${addToCartUrl}" scope="request"/>
                            <c:set var="isGrid" value="true" scope="request"/>
                            <div class="addtocart">
                                <div class="actions-container-for-${fn:escapeXml(currentComponent.uid)} <c:if test="${ycommerce:checkIfPickupEnabledForStore() and product.availableForPickup}"> pickup-in-store-available</c:if>">
                                    <action:actions element="div" parentComponent="${currentComponent}"/>
                                </div>
                            </div>
                        </div>
                        <c:if test="${not empty product.variantOptions and product.variantOptions.size() > 0}">
                            <div class="tc-variant-options-count">
                                <c:choose>
                                    <c:when test="${product.variantOptions.size() > 0}">
                                        ${product.variantOptions.size() + 1} &nbsp;<spring:theme
                                            code="tc.productgrid.variants.count"/>
                                    </c:when>
                                </c:choose>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </ycommerce:testId>
    </div>
</div>
