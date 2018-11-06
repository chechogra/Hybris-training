<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template" %>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="formElement"
           tagdir="/WEB-INF/tags/addons/talosacceleratoraddon/responsive/formElement" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>

<div class="container tc-container">
    <div class="tc-account-section">
        <div class="tc-personal-details-wp">
            <h2 class="tc-personal-details-header"><spring:theme code="text.account.profile.updatePersonalDetails"/></h2>
            <div class="tc-personal-details-form-wp">
                <form:form action="update-profile" method="post" commandName="updateProfileForm">

                    <formElement:formSelectBox idKey="profile.title" labelKey="profile.title" path="titleCode"
                                               mandatory="true" skipBlank="false" skipBlankMessageKey="form.select.empty"
                                               items="${titleData}" selectCSSClass="form-control"/>
                    <formElement:formInputBox idKey="profile.firstName" labelKey="profile.firstName" path="firstName"
                                              inputCSS="form-control" mandatory="true"/>
                    <formElement:formInputBox idKey="profile.lastName" labelKey="profile.lastName" path="lastName"
                                              inputCSS="form-control" mandatory="true"/>

                    <div class="tc-personal-details-actions-wp">
                        <div class="accountAction">
                            <ycommerce:testId code="personalDetails_savePersonalDetails_button">
                                <button type="submit" class="btn btn-primary btn-block">
                                    <spring:theme code="text.account.profile.saveUpdates" text="Save Updates"/>
                                </button>
                            </ycommerce:testId>
                        </div>
                        <div class="accountAction">
                            <ycommerce:testId code="personalDetails_cancelPersonalDetails_button">
                                <button type="button" class="btn btn-default btn-block backToHome">
                                    <spring:theme code="text.account.profile.cancel" text="Cancel"/>
                                </button>
                            </ycommerce:testId>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>
