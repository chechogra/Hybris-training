<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/responsive/product" %>
<%@ taglib prefix="tc-product" tagdir="/WEB-INF/tags/addons/talosacceleratoraddon/responsive/product" %>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="product-details-main-wp">
    <div class="row">
        <div class="col col-md-6 col-lg-7">
            <tc-product:productImagePanel galleryImages="${galleryImages}"/>
        </div>
        <div class="col col-md-6 col-lg-5">
            <div class="row">
                <div class="col-sm-6 col-md-12">
                    <div class="product-title">
                        <ycommerce:testId code="productDetails_productNamePrice_label_${product.code}">
                            <div class="code">
                                    ${fn:escapeXml(product.code)}
                            </div>
                            <div class="name">
                                    ${fn:escapeXml(product.name)}
                            </div>
                        </ycommerce:testId>
                        <product:productPromotionSection product="${product}"/>
                        <ycommerce:testId code="productDetails_productNamePrice_label_${product.code}">
                            <product:productPricePanel product="${product}"/>
                        </ycommerce:testId>
                    </div>
                    <div class="product-main-info">
                        <div class="product-details">
                            <tc-product:productReviewSummary product="${product}" showLinks="true"/>
                            <div class="description">${ycommerce:sanitizeHTML(product.summary)}</div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-12">
                    <cms:pageSlot position="VariantSelector" var="component" element="div" class="page-details-variants-select">
                        <cms:component component="${component}" element="div"
                                       class="yComponentWrapper page-details-variants-select-component"/>
                    </cms:pageSlot>
                </div>
                <div class="col-sm-6 col-md-12">
                    <cms:pageSlot position="AddToCart" var="component" element="div" class="page-details-variants-select">
                        <cms:component component="${component}" element="div"
                                       class="yComponentWrapper page-details-add-to-cart-component"/>
                    </cms:pageSlot>
                </div>
            </div>
        </div>
    </div>
</div>
