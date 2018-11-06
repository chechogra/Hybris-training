<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="cart" tagdir="/WEB-INF/tags/addons/talosacceleratoraddon/responsive/cart" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="format" tagdir="/WEB-INF/tags/shared/format" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<spring:htmlEscape defaultHtmlEscape="true"/>
<c:set var="symbolDefsPath" value="${contextPath}/_ui/addons/talosacceleratoraddon/responsive/common/images/symbol-defs.svg"/>

<div class="cart-header">
    <h1 class="cart-headline">
        <spring:theme code="text.cart"/>
        <c:if test="${not empty cartData.code}">
                    <span class="cart__id--label">
                        <spring:theme code="basket.page.cartIdShort"/><span class="cart__id">${fn:escapeXml(cartData.code)}</span>
                    </span>
        </c:if>
    </h1>
    <div class="cart-top-bar">
        <div class="help-popup-content-holder js-help-popup-content">
            <div class="help-popup-content">
                <strong>${fn:escapeXml(cartData.code)}</strong>
                <spring:theme code="basket.page.cartHelpContent" htmlEscape="false"/>
            </div>
        </div>
        <ul class="tc-cart-top-actions">
            <li><a href="" class="help js-cart-help" data-help="<spring:theme code="text.help" />"><spring:theme
                    code="text.help"/>
                <svg class="icon icon-info">
                    <use xlink:href="${symbolDefsPath}#icon-info"></use>
                </svg>
            </a></li>

            <sec:authorize access="!hasAnyRole('ROLE_ANONYMOUS')">
                <c:if test="${not empty savedCartCount and savedCartCount ne 0}">
                    <spring:url value="/my-account/saved-carts" var="listSavedCartUrl" htmlEscape="false"/>
                    <li><a href="${listSavedCartUrl}" class="save__cart--link cart__head--link">
                        <spring:theme code="saved.cart.total.number" arguments="${savedCartCount}"/>
                        <svg class="icon icon-cart">
                            <use xlink:href="${symbolDefsPath}#icon-cart"></use>
                        </svg>
                    </a></li>
                    <c:if test="${not empty quoteCount and quoteCount ne 0}">
                        <spring:url value="/my-account/my-quotes" var="listQuotesUrl" htmlEscape="false"/>
                        <li><a href="${listQuotesUrl}" class="cart__quotes--link cart__head--link">
                            <spring:theme code="saved.quote.total.number" arguments="${quoteCount}"/>
                            <svg class="icon icon-cart">
                                <use xlink:href="${symbolDefsPath}#icon-cart"></use>
                            </svg>
                        </a></li>
                    </c:if>
                </c:if>
            </sec:authorize>
            <cart:saveCart/>
        </ul>
    </div>
</div>


<c:if test="${not empty cartData.rootGroups}">
    <c:url value="/cart/checkout" var="checkoutUrl" scope="session"/>
    <c:url value="/quote/create" var="createQuoteUrl" scope="session"/>
    <c:url value="${continueUrl}" var="continueShoppingUrl" scope="session"/>
    <c:set var="showTax" value="false"/>

    <div class="cart-actions--print">
        <div class="row">
            <div class="col-xs-12 col-sm-6 pull-right">
                <div class="cart__actions">
                    <ycommerce:testId code="checkoutButton">
                        <button class="btn btn-primary btn-block btn--continue-checkout js-continue-checkout-button"
                                data-checkout-url="${checkoutUrl}">
                            <spring:theme code="checkout.checkout"/>
                        </button>
                    </ycommerce:testId>

                    <c:if test="${not empty siteQuoteEnabled and siteQuoteEnabled eq 'true'}">
                        <button class="btn btn-default btn-block btn-create-quote js-create-quote-button"
                                data-create-quote-url="${createQuoteUrl}">
                            <spring:theme code="quote.create"/>
                        </button>
                    </c:if>

                    <button class="btn btn-default btn-block btn--continue-shopping js-continue-shopping-button"
                            data-continue-shopping-url="${continueShoppingUrl}">
                        <spring:theme code="cart.page.continue"/>
                    </button>
                </div>
            </div>
        </div>
    </div>

    <cart:exportCart/>

    <div class="js-cart-top-totals cart__top--totals">
        <span class="cart__top--label">
            <c:choose>
                <c:when test="${fn:length(cartData.entries) > 1 or fn:length(cartData.entries) == 0}">
                    <spring:theme code="basket.page.totals.total.items" arguments="${fn:length(cartData.entries)}"/>
                </c:when>
                <c:otherwise>
                    <spring:theme code="basket.page.totals.total.items.one" arguments="${fn:length(cartData.entries)}"/>
                </c:otherwise>
            </c:choose>
        </span>
        <ycommerce:testId code="cart_totalPrice_label">
            <span class="cart__top--amount">
                <c:choose>
                    <c:when test="${showTax}">
                        <format:price priceData="${cartData.totalPriceWithTax}"/>
                    </c:when>
                    <c:otherwise>
                        <format:price priceData="${cartData.totalPrice}"/>
                    </c:otherwise>
                </c:choose>
            </span>
        </ycommerce:testId>
    </div>

    <cart:cartItems cartData="${cartData}"/>

    <cart:exportCart/>
</c:if>
<cart:ajaxCartTopTotalSection/>
