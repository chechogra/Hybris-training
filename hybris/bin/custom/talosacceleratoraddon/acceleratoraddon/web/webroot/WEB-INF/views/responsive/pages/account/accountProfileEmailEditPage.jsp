<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="formElement"
           tagdir="/WEB-INF/tags/addons/talosacceleratoraddon/responsive/formElement" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>

<spring:htmlEscape defaultHtmlEscape="true"/>

<div class="container tc-container">
    <div class="tc-account-section">
        <div class="tc-personal-details-wp">
            <h2 class="tc-personal-details-header"><spring:theme code="text.account.update.email.address"/></h2>
            <div class="tc-personal-details-form-wp">
                <form:form action="update-email" method="post" commandName="updateEmailForm">
                    <formElement:formInputBox idKey="profile.email" labelKey="profile.email" path="email" inputCSS="text"
                                              mandatory="true"/>
                    <formElement:formInputBox idKey="profile.checkEmail" labelKey="profile.checkEmail" path="chkEmail"
                                              inputCSS="text" mandatory="true"/>
                    <formElement:formPasswordBox idKey="profile.pwd" labelKey="profile.pwd" path="password"
                                                 inputCSS="text form-control" mandatory="true"/>

                    <input type="hidden" id="recaptchaChallangeAnswered" value="${requestScope.recaptchaChallangeAnswered}"/>
                    <div class="form_field-elements control-group js-recaptcha-captchaaddon"></div>

                    <div class="tc-personal-details-actions-wp">
                        <div class="accountAction">
                            <ycommerce:testId code="email_saveEmail_button">
                                <button type="submit" class="btn btn-primary btn-block">
                                    <spring:theme code="text.account.profile.saveUpdates"/>
                                </button>
                            </ycommerce:testId>
                        </div>
                        <div class="accountAction">
                            <ycommerce:testId code="email_cancelEmail_button">
                                <button type="button" class="btn btn-default btn-block backToHome">
                                    <spring:theme code="text.account.profile.cancel"/>
                                </button>
                            </ycommerce:testId>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>
