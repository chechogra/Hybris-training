<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags/responsive/nav" %>

<c:set var="searchUrl" value="legacy-orders"/>

<div class="container-fluid tc-container">

<nav:pagination top="true" supportShowPaged="${isShowPageAllowed}" supportShowAll="${isShowAllAllowed}"
                    searchPageData="${searchPageData}" searchUrl="${searchUrl}"
                    numberPagesShown="${numberPagesShown}"/>

    <div class="account-section-content">
        <div class="account-overview-table saved__carts__overview--table">
            <table class="responsive-table">
                <thead>
                    <tr class="responsive-table-head hidden-xs">
                        <th> <spring:theme code="text.account.legacyOrderHistory.orderNumber" /></th>
                        <th> <spring:theme code="text.account.legacyOrderHistory.status" />  </th>
                        <th> <spring:theme code="text.account.legacyOrderHistory.total" />  </th>
                    </tr>
                </thead>
                
                <c:forEach items="${searchPageData.results}" var="legacyOrder">
                    <c:url value="/my-account/legacy-orders/${legacyOrder.orderNumber}" var="legacyOrderEntryLink" />
                    
                    <tr class="responsive-table-item">
                        <td class="hidden-sm hidden-md hidden-lg">
                            <spring:theme code='text.account.savedCart.name'/>
                        </td>
                        <td class="responsive-table-cell">
                            <a class="btn btn-default  js-shopping-button" href="${legacyOrderEntryLink}">
                                ${legacyOrder.orderNumber}
                            </a>
                        </td>
                        <td>
                            ${legacyOrder.orderStatus}
                        </td>
                        <td>
                            ${legacyOrder.orderTotal}
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</div>

