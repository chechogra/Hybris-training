<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ attribute name="legacyOrder" required="true" type="com.talos.utrend.facades.order.data.LegacyOrderData" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>

<table class="responsive-table">
	<tr class="account-orderhistory-table-head responsive-table-head hidden-xs">
		<th><spring:theme code="text.account.legacyOrderHistory.orderNumber" /></th>
		<th><spring:theme code="text.account.legacyOrderHistory.orderStatus"/></th>
		<th><spring:theme code="text.account.legacyOrderHistory.total"/></th>
	</tr>
	<tr class="responsive-table-item">
		<td class="hidden-sm hidden-md hidden-lg"><spring:theme code="text.account.legacyOrderHistory.orderNumber" /></td>
		<td class="responsive-table-cell">
			<a href="${legacyOrderDetailsUrl}${ycommerce:encodeUrl(legacyOrderData.orderNumber)}" class="responsive-table-link">
				${fn:escapeXml(legacyOrderData.orderNumber)}
			</a>
		</td>
		<td class="hidden-sm hidden-md hidden-lg"><spring:theme code="text.account.legacyOrderHistory.orderStatus"/></td>																
		<td class="status">
			${fn:escapeXml(legacyOrderData.orderStatus)}
		</td>
		<td class="hidden-sm hidden-md hidden-lg"><spring:theme code="text.account.legacyOrderHistory.orderTotal"/></td>
		<td class="responsive-table-cell responsive-table-cell-bold">
			${fn:escapeXml(legacyOrderData.orderTotal)}
		</td>
	</tr>
</table>