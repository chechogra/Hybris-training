var TC = TC || {};

TC.quickorder = {
    _autoload: [
        'initPageEvents'
    ],

    handleAddQty: function (self) {
        var input = $(self).parents(".tc-quick-qty-input-wp").find(".js-quick-order-qty");
        var maxQty = input.data('maxProductQty');
        if (input.val() <= maxQty) {
            input.val(Number(input.val()) + 1);
            TC.quickorder.triggerFocusOutEvent(input);
            $(self).siblings('.tc-qty-selector-minus').prop("disabled", false);
        }

    },

    handleRemoveQty: function (self) {
        var input = $(self).parents(".tc-quick-qty-input-wp").find(".js-quick-order-qty");
        if (input.val() > 0) {
            input.val(Number(input.val()) - 1);
            TC.quickorder.triggerFocusOutEvent(input);
        }

        if (input.val() <= 0) {
            $(self).prop("disabled", true);
        }
    },

    initPageEvents: function () {
        $(document.body).focus();

        $(document).on('click', '.tc-quick-qty-input-wp .tc-qty-selector-minus', function (e) {
            TC.quickorder.handleRemoveQty(this);
        });

        $(document).on('click', '.tc-quick-qty-input-wp .tc-qty-selector-plus', function (e) {
            TC.quickorder.handleAddQty(this);
        });
    },

    triggerFocusOutEvent: function (input) {
        input.trigger('focusin');
        input.trigger('focusout');
    }
};

