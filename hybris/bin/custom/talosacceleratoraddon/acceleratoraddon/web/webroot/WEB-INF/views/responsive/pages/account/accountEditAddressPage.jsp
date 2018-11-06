<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="address" tagdir="/WEB-INF/tags/addons/talosacceleratoraddon/responsive/address" %>

<c:set var="symbolDefsPath"
       value="${contextPath}/_ui/addons/talosacceleratoraddon/responsive/common/images/symbol-defs.svg"/>
<spring:htmlEscape defaultHtmlEscape="true"/>

<spring:url value="/my-account/address-book" var="addressBookUrl" htmlEscape="false"/>

<c:choose>
    <c:when test="${edit eq true }">
        <c:set var="headline"><spring:theme code="text.account.addressBook.updateAddress"/></c:set>
    </c:when>
    <c:otherwise>
        <c:set var="headline"><spring:theme code="text.account.addressBook.addAddress"/></c:set>
    </c:otherwise>
</c:choose>
<div class="container-fluid tc-container">
    <div class="back-link border">
        <div class="row">
            <div class="container-lg col-md-6">
                <div class="tc-address-edit-back-title">
                    <button type="button" class="addressBackBtn tc-address-edit-back-button"
                            data-back-to-addresses="${addressBookUrl}">
                        <svg class="icon icon-chevron-left">
                            <use xlink:href="${symbolDefsPath}#icon-chevron-left"></use>
                        </svg>
                    </button>
                    <span class="label">${headline}</span>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="container-lg col-md-6">
            <div class="account-section-content tc-address-edit-form">
                <div class="account-section-form">
                    <address:addressFormSelector supportedCountries="${countries}" regions="${regions}"
                                                 cancelUrl="/my-account/address-book" addressBook="true"/>
                </div>
            </div>
        </div>
    </div>
</div>

