<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<spring:htmlEscape defaultHtmlEscape="true"/>

<spring:url value="/cart/addQuickOrder" var="quickOrderAddToCartUrl" htmlEscape="false"/>
<spring:theme code="text.quickOrder.product.quantity.max" var="maxProductQtyMsg"/>
<spring:theme code="text.quickOrder.form.product.exists" var="productExistsInFormMsg"/>
<c:set var="symbolDefsPath" value="${contextPath}/_ui/addons/talosacceleratoraddon/responsive/common/images/symbol-defs.svg"/>

<div class="js-quick-order-container" data-quick-order-min-rows="${quickOrderMinRows}"
     data-quick-order-max-rows="${quickOrderMaxRows}" data-quick-order-add-to-cart-url="${quickOrderAddToCartUrl}"
     data-product-exists-in-form-msg="${productExistsInFormMsg}">

    <ul class="item__list item__list__cart quick-order__list js-ul-container">
        <li class="hidden-xs hidden-sm">
            <ul class="item__list--header">
                <li class="item__sku__input"><spring:theme code="text.quickOrder.page.product"/></li>
                <li class="item__image"></li>
                <li class="item__info"></li>
                <li class="item__price"><spring:theme code="text.quickOrder.page.price"/></li>
                <li class="item__quantity"><span><spring:theme code="text.quickOrder.page.qty"/></span></li>
                <li class="item__total--column"><spring:theme code="text.quickOrder.page.total"/></li>
                <li class="item__remove"></li>
            </ul>
        </li>

        <c:forEach begin="1" end="${quickOrderMinRows}">
            <li class="tc-quick-cart-item__list--item js-li-container">
                <div class="item__sku__input js-sku-container">
                    <div class="tc-quick-order-input-group">
                        <div class="tc-product-label-wp">
                            <label for="sku_input">
                                <spring:theme code="basket.page.product"/>
                            </label>
                        </div>
                        <input id="sku_input" type="text" placeholder="<spring:theme code="quick.order.placeholder"/>"
                               class="js-sku-input-field form-control tc-input"/>
                        <input type="hidden" class="js-hidden-sku-field"/>
                    </div>
                    <div class="js-sku-validation-container help-block quick-order__help-block"></div>
                </div>

                <div class="item__remove">
                    <button class="visible-xs visible-sm btn btn-default js-remove-quick-order-row" tabindex="-1">
                        <span><spring:theme code="general.delete.button"/></span>
                    </button>
                    <button type="button" class="close-icon hidden-xs hidden-sm js-remove-quick-order-row">
                        <svg class="icon icon-close">
                            <use xmlns:xlink="http://www.w3.org/1999/xlink"
                                 xlink:href="${symbolDefsPath}#icon-close"></use>
                        </svg>
                    </button>
                </div>
            </li>
        </c:forEach>
    </ul>
</div>
<script id="quickOrderRowTemplate" type="text/x-jquery-tmpl">
	<div class="item__image js-product-info">
		<a href="${request.contextPath}{{= url}}" tabindex="-1">
			{{if images != null && images.length > 0}}
				<img src="{{= images[0].url}}"/>
			{{else}}
				<theme:image code="img.missingProductImage.responsive.thumbnail"/>
			{{/if}}

		</a>
	</div>
	<div class="item__info js-product-info">
		<a href="${request.contextPath}{{= url}}" tabindex="-1">
			<span class="item__name">{{= name}}</span>
		</a>

	   <div class="item__stock">
			<div>
				{{if stock.stockLevelStatus.code && stock.stockLevelStatus.code != 'outOfStock'}}
					<span class="stock">
						<spring:theme code="product.variants.in.stock"/>
					</span>
				{{else}}
					<span class="out-of-stock">
						<spring:theme code="product.variants.out.of.stock"/>
					</span>
				{{/if}}
			</div>
		</div>
	</div>

	<div class="item__price js-product-price js-product-info" data-product-price="{{= price.value}}">
		<span class="visible-xs visible-sm">
			<spring:theme code="basket.page.itemPrice"/>:
		</span>
		{{= price.formattedValue}}
	</div>

	<div class="item__quantity js-product-info">
	    <div class="tc-quick-qty-input-wp">
            <button type="button" class="tc-square-button tc-qty-selector-minus">
                <svg class="icon icon-minus">
                    <use xmlns:xlink="http://www.w3.org/1999/xlink"
                        xlink:href="${symbolDefsPath}#icon-minus">
                     </use>
                </svg>
            </button>
            <input type="text" class="js-quick-order-qty form-control" value="1" maxlength="3" size="1"
                data-max-product-qty="{{= stock.stockLevel}}" data-stock-level-status="{{= stock.stockLevelStatus.code}}"/>
            <button type="button" class="tc-square-button tc-qty-selector-plus">
                <svg class="icon icon-minus">
                    <use xmlns:xlink="http://www.w3.org/1999/xlink"
                        xlink:href="${symbolDefsPath}#icon-plus">
                    </use>
                </svg>
            </button>
        </div>
		<div class="js-product-info js-qty-validation-container help-block quick-order__help-block" data-max-product-qty-msg="${maxProductQtyMsg}"></div>
	</div>


	<div class="item__total js-product-info js-quick-order-item-total">
		{{if stock.stockLevelStatus.code && stock.stockLevelStatus.code != 'outOfStock'}}
			{{= price.formattedValue}}
		{{/if}}
	</div>
</script>
