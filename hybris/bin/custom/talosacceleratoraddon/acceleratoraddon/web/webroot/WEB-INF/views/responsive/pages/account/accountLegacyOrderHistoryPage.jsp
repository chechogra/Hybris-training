<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags/responsive/nav" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<spring:htmlEscape defaultHtmlEscape="true" />

<spring:url value="/my-account/legacy-orders/" var="legacyOrderDetailsUrl" htmlEscape="false"/>

<c:set var="searchUrl" value="/my-account/legacy-orders?sort=${ycommerce:encodeUrl(searchPageData.pagination.sort)}"/>

<div class="container-fluid tc-container">

<div class="account-section-header">
	<spring:theme code="text.account.legacyOrderHistory" />
</div>

<c:if test="${empty searchPageData.results}">
	<div class="account-section-content content-empty">
		<ycommerce:testId code="orderHistory_noOrders_label">
			<spring:theme code="text.account.legacyOrderHistory.noOrders" />
		</ycommerce:testId>
	</div>
</c:if>
<c:if test="${not empty searchPageData.results}">
	<div class="account-section-content">
		<div class="account-orderhistory">
			<div class="account-orderhistory-pagination">
				<nav:pagination top="true" msgKey="text.account.legacyOrderHistory.page" showCurrentPageInfo="true" hideRefineButton="true" supportShowPaged="${isShowPageAllowed}" supportShowAll="${isShowAllAllowed}" searchPageData="${searchPageData}" searchUrl="${searchUrl}"  numberPagesShown="${numberPagesShown}"/>
			</div>
            <div class="account-overview-table">
				<table class="orderhistory-list-table responsive-table">
					<tr class="account-orderhistory-table-head responsive-table-head hidden-xs">
						<th><spring:theme code="text.account.legacyOrderHistory.orderNumber" /></th>
						<th><spring:theme code="text.account.legacyOrderHistory.orderStatus"/></th>
						<th><spring:theme code="text.account.legacyOrderHistory.total"/></th>
					</tr>
					<c:forEach items="${searchPageData.results}" var="order">
						<tr class="responsive-table-item">
							<ycommerce:testId code="orderHistoryItem_orderDetails_link">
								<td class="hidden-sm hidden-md hidden-lg"><spring:theme code="text.account.legacyOrderHistory.orderNumber" /></td>
								<td class="responsive-table-cell">
									<a href="${legacyOrderDetailsUrl}${ycommerce:encodeUrl(order.orderNumber)}" class="responsive-table-link">
										${fn:escapeXml(order.orderNumber)}
									</a>
								</td>
								<td class="hidden-sm hidden-md hidden-lg"><spring:theme code="text.account.legacyOrderHistory.orderStatus"/></td>																
								<td class="status">
								    ${fn:escapeXml(order.orderStatus)}
								</td>
								<td class="hidden-sm hidden-md hidden-lg"><spring:theme code="text.account.legacyOrderHistory.orderTotal"/></td>
								<td class="responsive-table-cell responsive-table-cell-bold">
									${fn:escapeXml(order.orderTotal)}
								</td>
							</ycommerce:testId>
						</tr>
					</c:forEach>
				</table>
            </div>
		</div>
		<div class="account-orderhistory-pagination">
			<nav:pagination top="false" msgKey="text.account.legacyOrderHistory.page" showCurrentPageInfo="true" hideRefineButton="true" supportShowPaged="${isShowPageAllowed}" supportShowAll="${isShowAllAllowed}" searchPageData="${searchPageData}" searchUrl="${searchUrl}"  numberPagesShown="${numberPagesShown}"/>
		</div>
	</div>
</c:if>

</div>