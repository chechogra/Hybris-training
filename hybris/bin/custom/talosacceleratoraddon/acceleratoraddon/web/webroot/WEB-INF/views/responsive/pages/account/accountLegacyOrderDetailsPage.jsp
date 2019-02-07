<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags/responsive/nav" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="common" tagdir="/WEB-INF/tags/responsive/common" %>
<%@ taglib prefix="legacyOrder" tagdir="/WEB-INF/tags/addons/talosacceleratoraddon/responsive/legacy-order" %>

<spring:htmlEscape defaultHtmlEscape="true" />

<spring:url value="/my-account/legacy-orders" var="legacyOrderHistoryUrl"/>
<spring:url value="/my-account/legacy-orders/" var="legacyOrderDetailsUrl" htmlEscape="false"/>

<c:set var="searchUrl" value="/my-account/legacy-orders?sort=${ycommerce:encodeUrl(searchPageData.pagination.sort)}"/>

<div class="container-fluid tc-container">

<common:headline url="${legacyOrderHistoryUrl}" labelKey="text.account.legacyOrderDetails.title" />

<div class="well well-tertiary well-lg">
	<legacyOrder:accountLegacyOrderDetailsOverview legacyOrder="${legacyOrderData}"/>
</div>

<c:if test="${not empty legacyOrderData.customer.displayUid}">
	<div class="alert alert-info order-placedby">
		<spring:theme code="text.account.order.placedBy" arguments="${legacyOrderData.customer.displayUid}"/>
	</div>
</c:if>

<c:if test="${not empty legacyOrderData.entries}">
<div class="account-orderdetail account-consignment">
	<legacyOrder:accountLegacyOrderDetailsEntries legacyOrder="${legacyOrderData}"/>
</div>
</c:if>

<div class="row">
    <div class="col-xs-12 col-sm-6 col-md-5 col-lg-4 pull-right">
		<div class="orderBackBtn">
			<button type="button" class="btn btn-default btn-block" data-back-to-orders="${legacyOrderHistoryUrl}">
				<spring:theme code="text.account.legacyOrderDetails.backToLegacyOrderHistory"/>
			</button>
		</div>
    </div>
</div>

</div>
