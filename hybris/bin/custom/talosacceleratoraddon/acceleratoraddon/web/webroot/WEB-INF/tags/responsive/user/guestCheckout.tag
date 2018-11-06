<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ attribute name="actionNameKey" required="true" type="java.lang.String" %>
<%@ attribute name="action" required="true" type="java.lang.String" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="formElement" tagdir="/WEB-INF/tags/addons/talosacceleratoraddon/responsive/formElement" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="tc-guest-checkout-login_column">
    <h3><spring:theme code="guest.checkout" arguments="${fn:escapeXml(siteName)}"/></h3>
    <form:form action="${action}" method="post" commandName="guestForm">
        <div class="form-group">
            <formElement:formInputBox idKey="guest.email" labelKey="guest.email" inputCSS="guestEmail" path="email"
                                      mandatory="true"/>
        </div>

        <div class="form-group">
            <input class="confirmGuestEmail tc-input form-control" id="guest.confirm.email"
                   placeholder="<spring:theme code="guest.confirm.email"/>"/>
        </div>

        <ycommerce:testId code="guest_Checkout_button">
            <div class="tc-guest-checkout-login-btn-wp">
                <button type="submit" disabled="true" class="btn btn-primary guestCheckoutBtn">
                    <spring:theme code="${actionNameKey}"/>
                </button>
            </div>
        </ycommerce:testId>

    </form:form>
</div>

	