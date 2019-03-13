<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="legacyOrder" required="true" type="com.talos.utrend.facades.order.data.LegacyOrderData" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/responsive/product" %>

<c:if test="${not empty legacyOrderData.entries}">
    <table class="responsive-table">
        <tr class="responsive-table-head hidden-xs">
            <th></th>
            <th><spring:theme code="text.account.legacyOrderEntry.page.product"/></th>
            <th><spring:theme code="text.account.legacyOrderEntry.page.quantity"/></th>
            <th><spring:theme code="text.account.legacyOrderEntry.page.price"/></th>
            <th><spring:theme code="text.account.legacyOrderEntry.page.total"/></th>
        </tr>
        <c:forEach items="${legacyOrderData.entries}" var="entry" varStatus="loop">
            <tr class="responsive-table-item">
                <td>
                    <product:productPrimaryImage product="${entry.product}" format="thumbnail"/>
                </td>
                <td class="responsive-table-cell">
                    <a href="${entry.product.purchasable ? entry.product.url : ''}">
                        ${fn:escapeXml(entry.product.name)}
                    </a>
                </td>
                <td class="responsive-table-cell">
                    ${fn:escapeXml(entry.quantity)}
                </td>
                <td class="responsive-table-cell">
                    ${fn:escapeXml(entry.basePrice)}
                </td>
                <td class="responsive-table-cell responsive-table-cell-bold">
                    <fmt:formatNumber value = "${fn:escapeXml(entry.quantity * entry.basePrice)}" type = "currency"/>
                </td>
            </tr>
        </c:forEach>
    </table>
</c:if>