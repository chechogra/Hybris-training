<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ attribute name="actionNameKey" required="true" type="java.lang.String" %>
<%@ attribute name="action" required="true" type="java.lang.String" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="formElement"
           tagdir="/WEB-INF/tags/addons/talosacceleratoraddon/responsive/formElement" %>
<%@ taglib prefix="theme" tagdir="/WEB-INF/tags/shared/theme" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>

<div class="tc-account-register_column tc-signup-column">
    <h3 class="user-register__headline">
        <spring:theme code="register.new.customer"/>
    </h3>
    <p>
        <spring:theme code="register.description"/>
    </p>
    <form:form method="post" commandName="registerForm" action="${action}">
        <formElement:formSelectBox idKey="register.title"
                                   labelKey="register.title" selectCSSClass="form-control"
                                   path="titleCode" mandatory="true" skipBlank="false"
                                   skipBlankMessageKey="form.select.empty" items="${titles}"/>
        <formElement:formInputBox idKey="register.firstName"
                                  labelKey="register.firstName" path="firstName" inputCSS="form-control"
                                  mandatory="true"/>
        <formElement:formInputBox idKey="register.lastName"
                                  labelKey="register.lastName" path="lastName" inputCSS="form-control"
                                  mandatory="true"/>
        <formElement:formInputBox idKey="register.email"
                                  labelKey="register.email" path="email" inputCSS="form-control"
                                  mandatory="true"/>
        <formElement:formPasswordBox idKey="password" labelKey="register.pwd"
                                     path="pwd" inputCSS="form-control password-strength" mandatory="true"/>
        <formElement:formPasswordBox idKey="register.checkPwd"
                                     labelKey="register.checkPwd" path="checkPwd" inputCSS="form-control"
                                     mandatory="true"/>

        <c:if test="${ not empty consentTemplateData }">
            <form:hidden path="consentForm.consentTemplateId" value="${consentTemplateData.id}"/>
            <form:hidden path="consentForm.consentTemplateVersion" value="${consentTemplateData.version}"/>
            <div class="checkbox">
                <spring:theme code="registration.consent.link" var="consentLink"/>
                <formElement:formCheckbox idKey="giveConsent"
                labelKey="${consentTemplateData.description} ${consentLink}"
                path="consentForm.consentGiven" mandatory="true" labelCSS=""/>
            </div>
        </c:if>

        <input type="hidden" id="recaptchaChallangeAnswered"
               value="${requestScope.recaptchaChallangeAnswered}"/>
        <div class="form_field-elements control-group js-recaptcha-captchaaddon"></div>
        <div class="form-actions clearfix">
            <ycommerce:testId code="register_Register_button">
                <button type="submit" class="btn btn-primary">
                    <spring:theme code='${actionNameKey}'/>
                </button>
            </ycommerce:testId>
        </div>
    </form:form>
</div>

