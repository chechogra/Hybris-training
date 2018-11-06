<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/addons/talosacceleratoraddon/responsive/template" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="common" tagdir="/WEB-INF/tags/responsive/common" %>
<%@ taglib prefix="tc-common" tagdir="/WEB-INF/tags/addons/talosacceleratoraddon/responsive/common" %>
<%@ taglib prefix="format" tagdir="/WEB-INF/tags/shared/format" %>

<spring:htmlEscape defaultHtmlEscape="true"/>

<spring:url value="/import/csv/saved-cart" var="importCSVSavedCartLink" htmlEscape="false"/>
<spring:url value="/my-account/saved-carts" var="savedCartsLink" htmlEscape="false"/>

<template:page pageTitle="${pageTitle}">
    <div id="import-csv-alerts"></div>
    <div class="container-fluid tc-container tc-import-csv-section">
        <div class="tc-import-csv-header">
            <h2 class="tc-import-csv__headline">
                <spring:theme code="import.csv.savedCart.title"/>
            </h2>
            <div class="tc-import-csv__subheadline">
                <spring:theme code="import.csv.savedCart.filesNote"/>
            </div>
        </div>

        <div class="account-section-content import-csv__content">
            <form:form commandName="importCSVSavedCartForm" enctype="multipart/form-data" method="post"
                       action="${importCSVSavedCartLink}" class="import-csv__form">
            </form:form>
            <div class="row">
                <div class="col-xs-12 col-sm-6 import-csv__file-spec">
                    <div class="import-csv__file-spec-wp">
                        <p><spring:theme code="import.csv.savedCart.fileContentNote"/></p>
                        <ul class="tc-csv-spec-list">
                            <li class="import-csv__file-spec-item"><spring:theme
                                    code="import.csv.savedCart.fileContent"/></li>
                            <li class="import-csv__file-spec-item">
                                <spring:theme code="import.csv.savedCart.fileConstraint"/>&nbsp;<format:bytes
                                    bytes="${csvFileMaxSize}"/>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 import-csv__file-upload">
                    <div class="import-csv__file-upload-wp">
                        <p><spring:theme code="import.csv.savedCart.selectFile"/></p>
                        <div class="tc-import-csv-wp">
                            <div class="form-group file-upload js-file-upload">
                                <label for="csvFile">
                                    <div class="file-upload__wrapper btn btn-default btn-block" id="chooseFileButton">
                                        <span><spring:theme code="import.csv.savedCart.chooseFile"/></span>
                                        <input type="file" id="csvFile" name="csvFile"
                                               class="file-upload__input js-file-upload__input"
                                               accept="text/csv" data-file-max-size="${csvFileMaxSize}"/>
                                    </div>
                                </label>
                                <span class="file-upload__file-name js-file-upload__file-name"></span>
                            </div>
                            <div class="import-csv__action js-import-csv">
                                <button class="btn btn-primary btn-block" type="submit" id="importButton">
                                    <spring:theme code="import.csv.savedCart.import"/>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div style="display: none">
        <span id="import-csv-success-message"><spring:theme code="import.csv.savedCart.success" arguments="${savedCartsLink}"
                                                                htmlEscape="false"/></span>
        <span id="import-csv-upload-message"><spring:theme code="import.csv.savedCart.uploadStarted"/></span>
        <span id="import-csv-generic-error-message"><spring:theme code="import.csv.savedCart.genericError"/></span>
        <span id="import-csv-file-max-size-exceeded-error-message"><spring:theme
                code="import.csv.savedCart.fileMaxSizeExceeded"/></span>
        <span id="import-csv-file-csv-required"><spring:theme code="import.csv.savedCart.fileCSVRequired"/></span>
        <span id="import-csv-no-file-chosen-error-message"><spring:theme code="import.csv.savedCart.noFile"/></span>
    </div>
    <tc-common:globalMessagesTemplates/>
</template:page>
