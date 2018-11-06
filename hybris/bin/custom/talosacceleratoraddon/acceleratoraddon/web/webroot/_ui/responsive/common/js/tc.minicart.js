//Overriding bindMiniCart to change colorbox size

ACC.minicart.bindMiniCart = function () {

    $(document).on("click", ".js-mini-cart-link", function (e) {
        e.preventDefault();
        var url = $(this).data("miniCartUrl");
        var cartName = ($(this).find(".js-mini-cart-count").html() != 0) ? $(this).data("miniCartName") : $(this).data("miniCartEmptyName");

        ACC.colorbox.open(cartName, {
            href: url,
            maxWidth: "100%",
            width: "550px",
            initialWidth: "380px"
        });
    });

    $(document).on("click", ".js-mini-cart-close-button", function (e) {
        e.preventDefault();
        ACC.colorbox.close();
    });
};

ACC.product.displayAddToCartPopup = function (cartResult, statusText, xhr, formElement) {
    $ajaxCallEvent = true;
    $('#addToCartLayer').remove();
    if (typeof ACC.minicart.updateMiniCartDisplay == 'function') {
        ACC.minicart.updateMiniCartDisplay();
    }
    var titleHeader = $('#addToCartTitle').html();

    ACC.colorbox.open(titleHeader, {
        html: cartResult.addToCartLayer,
        width: "550px"
    });

    var productCode = $('[name=productCodePost]', formElement).val();
    var quantityField = $('[name=qty]', formElement).val();

    var quantity = 1;
    if (quantityField != undefined) {
        quantity = quantityField;
    }

    var cartAnalyticsData = cartResult.cartAnalyticsData;

    var cartData = {
        "cartCode": cartAnalyticsData.cartCode,
        "productCode": productCode, "quantity": quantity,
        "productPrice": cartAnalyticsData.productPostPrice,
        "productName": cartAnalyticsData.productName
    };
    ACC.track.trackAddToCart(productCode, quantity, cartData);
};
