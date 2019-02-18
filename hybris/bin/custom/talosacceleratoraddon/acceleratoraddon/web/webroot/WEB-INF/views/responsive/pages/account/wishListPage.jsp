<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="formElement" tagdir="/WEB-INF/tags/addons/talosacceleratoraddon/responsive/formElement" %>

<c:url value="/my-account/wish-list/send-email" var="sendMessageUrl"/>

    <div class="container-fluid tc-container">
        <form:form action="${sendMessageUrl}" method="post" commandName="wishListForm">
             <div class="form-group">
                <formElement:formInputBox idKey="email" labelKey="wishListForm.email" path="email" inputCSS="form-control"/>
             </div>

              <button type="submit" class="btn btn-primary btn-block">
                <spring:theme code="wishListForm.sendEmail" text="Send Email"/>
              </button>
           </form:form>
    </div>

