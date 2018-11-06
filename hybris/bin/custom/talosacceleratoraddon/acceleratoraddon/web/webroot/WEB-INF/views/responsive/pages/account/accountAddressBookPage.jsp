<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:set var="symbolDefsPath" value="${contextPath}/_ui/addons/talosacceleratoraddon/responsive/common/images/symbol-defs.svg"/>

<spring:htmlEscape defaultHtmlEscape="true"/>

<c:set var="noBorder" value=""/>
<c:if test="${not empty addressData}">
    <c:set var="noBorder" value="no-border"/>
</c:if>
<div class="container-fluid tc-container">
    <div class="account-addressbook account-list tc-address-book-list-wp">
        <div class="account-section-header ${noBorder} tc-address-book-title">
            <h3><spring:theme code="text.account.addressBook"/></h3>
            <ycommerce:testId code="addressBook_addNewAddress_button">
                <div class="account-section-header-add pull-right">
                    <a href="add-address" class="btn btn-primary btn-sm">
                        <spring:theme code="text.account.addressBook.addAddress"/>
                    </a>
                </div>
            </ycommerce:testId>
        </div>
        <c:if test="${empty addressData}">
            <div class="account-section-content content-empty tc-address-book-empty">
                <spring:theme code="text.account.addressBook.noSavedAddresses"/>
            </div>
        </c:if>

        <c:if test="${not empty addressData}">
            <div class="tc-account-cards card-select">


                <c:forEach items="${addressData}" var="address">
                    <div class="tc-account-card">
                        <ul>
                            <li class="<c:if test="${address.defaultAddress}">tc-account-card-default</c:if> tc-account-card-tittle">
                                    ${fn:escapeXml(address.title)}&nbsp;${fn:escapeXml(address.firstName)}&nbsp;${fn:escapeXml(address.lastName)}
                                <c:if test="${address.defaultAddress}">
                                    (<spring:theme code="text.default"/>)
                                </c:if>
                            </li>
                            <li>${fn:escapeXml(address.line1)}</li>
                            <c:if test="${not empty fn:escapeXml(address.line2)}">
                                <li>${fn:escapeXml(address.line2)}</li>
                            </c:if>
                            <li>${fn:escapeXml(address.town)}&nbsp;${fn:escapeXml(address.region.name)}</li>
                            <li> ${fn:escapeXml(address.country.name)}&nbsp;${fn:escapeXml(address.postalCode)}</li>
                            <li>${fn:escapeXml(address.phone)}</li>
                        </ul>

                        <c:if test="${not address.defaultAddress}">
                            <ycommerce:testId code="addressBook_isDefault_button">
                                <a class="btn btn-primary btn-sm account-set-default-address tc-account-card-set-default-btn"
                                   href="set-default-address/${fn:escapeXml(address.id)}">
                                    <spring:theme code="text.setDefault"/>
                                </a>
                            </ycommerce:testId>
                        </c:if>
                        <ycommerce:testId code="addressBook_editAddress_button">
                            <a class="tc-account-card-icon-edit action-links" href="edit-address/${fn:escapeXml(address.id)}">
                                <svg class="icon icon-edit">
                                    <use xlink:href="${symbolDefsPath}#icon-edit"></use>
                                </svg>
                            </a>
                        </ycommerce:testId>
                        <ycommerce:testId code="addressBook_removeAddress_button">
                            <a href="#" class="tc-account-card-icon-cross action-links removeAddressFromBookButton"
                               data-address-id="${fn:escapeXml(address.id)}"
                               data-popup-title="<spring:theme code="text.address.delete.popup.title" />">
                                <svg class="icon icon-close">
                                    <use xlink:href="${symbolDefsPath}#icon-close"></use>
                                </svg>
                            </a>
                        </ycommerce:testId>
                    </div>
                </c:forEach>


                <c:forEach items="${addressData}" var="address">
                    <div class="display-none">
                        <div id="popup_confirm_address_removal_${fn:escapeXml(address.id)}" class="account-address-removal-popup">
                            <div class="addressItem">
                                <spring:theme code="text.address.remove.following"/>

                                <div class="address">
                                    <strong>
                                            ${fn:escapeXml(address.title)}&nbsp;
                                            ${fn:escapeXml(address.firstName)}&nbsp;
                                            ${fn:escapeXml(address.lastName)}
                                    </strong>
                                    <br>
                                        ${fn:escapeXml(address.line1)}&nbsp;
                                        ${fn:escapeXml(address.line2)}
                                    <br>
                                        ${fn:escapeXml(address.town)}&nbsp;
                                    <c:if test="${not empty address.region.name }">
                                        ${fn:escapeXml(address.region.name)}&nbsp;
                                    </c:if>
                                    <br>
                                        ${fn:escapeXml(address.country.name)}&nbsp;
                                        ${fn:escapeXml(address.postalCode)}
                                    <br/>


                                        ${fn:escapeXml(address.phone)}
                                </div>

                                <div class="modal-actions">
                                    <div class="row">
                                        <ycommerce:testId code="addressRemove_delete_button">
                                            <div class="col-xs-12 col-sm-6 col-sm-push-6">
                                                <a class="btn btn-primary btn-block tc-account-button"
                                                   data-address-id="${fn:escapeXml(address.id)}"
                                                   href="remove-address/${fn:escapeXml(address.id)}">
                                                    <spring:theme code="text.address.delete"/>
                                                </a>
                                            </div>
                                        </ycommerce:testId>
                                        <div class="col-xs-12 col-sm-6 col-sm-pull-6">
                                            <a class="btn btn-default btn-block closeColorBox tc-account-button"
                                               data-address-id="${fn:escapeXml(address.id)}">
                                                <spring:theme code="text.button.cancel"/>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:if>
    </div>
</div>
