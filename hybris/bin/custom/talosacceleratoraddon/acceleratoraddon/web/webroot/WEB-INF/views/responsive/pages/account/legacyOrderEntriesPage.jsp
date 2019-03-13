<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:url value="/my-account/legacy-orders" var="legacyOrdersManagementLink" />

<div class="container-fluid tc-container">
    <table class="responsive-table">
        <thead>
            <tr class="responsive-table-head hidden-xs">
                <th> <spring:theme code="text.account.legacyOrderEntries.orderNumber"/> </th>
                <th> <spring:theme code="text.account.legacyOrderEntries.orderStatus"/> </th>
                <th> <spring:theme code="text.account.legacyOrderEntries.orderTotal"/> </th>
            </tr>
        </thead>
            <tr class="responsive-table-item">
                <td> ${legacyOrder.orderNumber} </td>
                <td> ${legacyOrder.orderStatus} </td>
                <td> ${legacyOrder.orderTotal} </td>
            </tr>
    </table>

    <table class="responsive-table">
        <thead>
            <tr class="responsive-table-head hidden-xs">
                <th> <spring:theme code="text.account.legacyOrderEntries.item"/> </th>
                <th> <spring:theme code="text.account.legacyOrderEntries.basePrice"/> </th>
                <th> <spring:theme code="text.account.legacyOrderEntries.quantity"/> </th>
                <th> <spring:theme code="text.account.legacyOrderEntries.subtotal"/> </th>
            </tr>
        </thead>
        <c:forEach items="${legacyOrderEntries}" var="legacyOrderEntry">
        <tr class="responsive-table-item">
            <td> ${legacyOrderEntry.product} </td>
            <td> ${legacyOrderEntry.price} </td>
            <td> ${legacyOrderEntry.quantity} </td>
            <td> ${legacyOrderEntry.total} </td>
        </tr>
        </c:forEach>
    </table>

    <div class="row">
        <div class="col-xs-3">  <spring:theme code="text.account.legacyOrderEntries.orderTotal"/> </div>
        <div class="col-xs-3"> ${legacyOrder.orderTotal}  </div>
        <div class="col-xs-3"> </div>
        <div class="col-xs-3"> 
            <a class="btn btn-default  js-shopping-button" href="${legacyOrdersManagementLink}">
                 <spring:theme code="text.account.legacyOrderEntries.backToLegacyOrders"/>
            </a>
        </div>

    </div>
</div>

    

