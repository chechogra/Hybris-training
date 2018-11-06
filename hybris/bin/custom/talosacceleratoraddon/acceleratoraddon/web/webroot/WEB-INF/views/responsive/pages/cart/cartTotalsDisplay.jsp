<%@ taglib prefix="cart" tagdir="/WEB-INF/tags/responsive/cart" %>
<%@ taglib prefix="tc-cart" tagdir="/WEB-INF/tags/addons/talosacceleratoraddon/responsive/cart" %>

<%-- Verified that there's a pre-existing bug regarding the setting of showTax; created issue  --%>
<div class="cart-totals">
    <tc-cart:cartTotals cartData="${cartData}" showTax="false"/>
    <cart:ajaxCartTotals/>
</div>
