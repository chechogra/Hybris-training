<%@ taglib prefix="tc-cart" tagdir="/WEB-INF/tags/addons/talosacceleratoraddon/responsive/cart" %>
<%@ taglib prefix="cart" tagdir="/WEB-INF/tags/responsive/cart" %>

<tc-cart:cartPromotions cartData="${cartData}"/>
<cart:ajaxCartPromotions/>

<div class="cart-voucher">
    <tc-cart:cartVoucher cartData="${cartData}"/>
</div>
