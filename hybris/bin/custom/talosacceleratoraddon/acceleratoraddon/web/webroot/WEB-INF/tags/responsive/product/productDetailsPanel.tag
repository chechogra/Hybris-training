<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/responsive/product" %>
<%@ taglib prefix="tc-product" tagdir="/WEB-INF/tags/addons/talosacceleratoraddon/responsive/product" %>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="formElement" tagdir="/WEB-INF/tags/addons/talosacceleratoraddon/responsive/formElement" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:url value="${product.url}/updateCreationDate" var="updateCreationDateUrl"/>

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
                            <div class="creation-date">
                                    <u>Created on</u> ${fn:escapeXml(product.creationDate)}
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


                        <div class="creation-date-form">
                            <form:form method="post" action="${updateCreationDateUrl}" commandName="creationDateForm">
                                <div class="form-group tab-review-card">
                                    <formElement:formInputBox idKey="product.creationDate" labelKey="product.creationDate" path="creationDate"
                                                              inputCSS="form-control" mandatory="true"/>
                                </div>

                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    <button type="submit" class="btn btn-primary btn-block" value="<spring:theme code='product.submit'/>"><spring:theme
                                            code="product.submit"/></button>

                                </div>
                            </form:form>

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
