var TC = TC || {}; // make sure TC is available

TC.cart = {
    _autoload: ['initPageEvents'],

    handleAddQty: function (self) {
        var input = $(self).parents('.tc-input-qty-cart ').find('.js-update-entry-quantity-input');
        var form = $(input).closest('form');
        input.val(Number(input.val()) + 1);
        form.submit();
    },

    handleRemoveQty: function (self) {
        var input = $(self).parents('.tc-input-qty-cart ').find('.js-update-entry-quantity-input');
        var form = $(input).closest('form');
        input.val(Number(input.val()) - 1);
        form.submit();
    },

    initPageEvents: function () {
        $(document).on('click', '.tc-input-qty-cart .tc-qty-selector-minus', function (e) {
            TC.cart.handleRemoveQty(this);
        });

        $(document).on('click', '.tc-input-qty-cart .tc-qty-selector-plus', function (e) {
            TC.cart.handleAddQty(this);
        });
    }
};
