<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="cart" tagdir="/WEB-INF/tags/addons/talosacceleratoraddon/responsive/cart" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
    ~ /*
    ~  * [y] hybris Platform
    ~  *
    ~  * Copyright (c) 2000-2017 SAP SE or an SAP affiliate company.
    ~  * All rights reserved.
    ~  *
    ~  * This software is the confidential and proprietary information of SAP
    ~  * ("Confidential Information"). You shall not disclose such Confidential
    ~  * Information and shall use it only in accordance with the terms of the
    ~  * license agreement you entered into with SAP.
    ~  *
    ~  */
--%>

<spring:htmlEscape defaultHtmlEscape="true"/>
<c:set var="symbolDefsPath" value="${contextPath}/_ui/addons/talosacceleratoraddon/responsive/common/images/symbol-defs.svg"/>

<li><a href="#" class="save__cart--link cart__head--link js-save-cart-link">
    <spring:theme code="basket.save.cart"/>
    <svg class="icon icon-new-cart">
        <use xlink:href="${symbolDefsPath}#icon-new-cart"></use>
    </svg>
</a></li>

<spring:url value="/cart/save" var="actionUrl" htmlEscape="false"/>
<cart:saveCartModal titleKey="text.save.cart.title" actionUrl="${actionUrl}" messageKey="basket.save.cart.info.msg"/>
