<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ attribute name="actionUrl" required="true" type="java.lang.String"%>
<%@ attribute name="titleKey" required="true" type="java.lang.String"%>
<%@ attribute name="messageKey" required="false" type="java.lang.String"%>

<spring:htmlEscape defaultHtmlEscape="true" />
<c:set var="loc_val">
    <spring:message code="basket.save.cart.max.chars" />
</c:set>
<input type="hidden" id="localized_val" name="localized_val" value="${loc_val}"/>
<div class="hidden">
	<div id="saveCart" data-save-cart-title="<spring:theme code="${titleKey}"/>">
		<form:form action="${actionUrl}" id="saveCartForm" commandName="saveCartForm" autocomplete="off">
			<div class="form-group">
				<c:if test="${not empty messageKey}">
					<div class="legend"><spring:theme code="${messageKey}"/></div>
				</c:if>
                <form:input cssClass="form-control tc-input" id="saveCartName" path="name" maxlength="255" placeholder="Cart Name"/>
                 <div class="help-block right-cartName" id="remain">
                </div>
            </div>
            <div class="form-group">
                <form:textarea cssClass="form-control tc-textarea" id="saveCartDescription" path="description" maxlength="255" placeholder="Cart Description"/>
                <div class="help-block" id="remainTextArea">
                </div>
			</div>
			<div class="form-actions">
	            <div class="modal-actions">
                    <div class="row">
                        <div class="col-sm-12">
                            <button type="submit" class="btn btn-primary btn-block" id="saveCartButton" disabled="disabled">
                                <spring:theme code="basket.save.cart.action.save"/>
                            </button>

                            <button type="button" class="btn btn-default btn-block" id="cancelSaveCartButton">
                                <spring:theme code="basket.save.cart.action.cancel"/>
                            </button>
                        </div>
	                </div>
	            </div>
	        </div>
		</form:form>
	</div>
</div>

