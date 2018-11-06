/*
 * [y] hybris Platform
 *
 * Copyright (c) 2017 SAP SE or an SAP affiliate company.  All rights reserved.
 *
 * This software is the confidential and proprietary information of SAP
 * ("Confidential Information"). You shall not disclose such Confidential
 * Information and shall use it only in accordance with the terms of the
 * license agreement you entered into with SAP.
 */

var TC = TC || {}; // make sure TC is available

TC.common = {

    _autoload: [
        "bindCollapsibleComponents",
        "bindCurrencySelector",
        "bindLanguageSelector"
    ],

    bindCollapsibleComponents: function () {

        $(".tc-collapse-trigger").click(function (e) {
            e.preventDefault();
            $(this).closest(".tc-collapsible-parent").removeClass('tc-collapsed');
            TC.common.collapseHandler($(this));
        });
    },

    collapseHandler: function (triggerElement) {
        if (triggerElement) {

            var collapsibleParent = triggerElement.closest(".tc-collapsible-parent");

            if (collapsibleParent.hasClass("open")) {
                TC.common.closeCollapsibleItem(collapsibleParent);
            } else {
                collapsibleParent.addClass("open");
                var collapsibleGroup = collapsibleParent.closest(".tc-collapsible-group");
                if (collapsibleGroup) {
                    collapsibleGroup.children(".tc-collapsible-parent.open").each(function () {
                        if (!$(this).is(collapsibleParent)) {
                            TC.common.closeCollapsibleItem($(this));
                        }
                    });
                }
            }
        }
    },
    closeCollapsibleItem: function (collapsibleParent) {
        var collapsibleContent = collapsibleParent.find(".tc-collapsible-content");
        collapsibleParent.removeClass("open");
        collapsibleContent.collapse("hide");
    },

    bindCurrencySelector: function () {
        $('#currency-form input[type=radio][name=code]').change(function () {
            $('#currency-form').submit();
        });
    },

    bindLanguageSelector: function () {
        $('#lang-form input[type=radio][name=code]').change(function () {
            $('#lang-form').submit();
        });
    },

    removeDisplayStyle: function (element) {
        element.attr('style', function (i, style) {
            return style && style.replace(/display[^;]+;?/g, '');
        });
    }
};


function _tcAutoload() {
    $.each(TC, function (section, obj) {
        if ($.isArray(obj._autoload)) {
            $.each(obj._autoload, function (key, value) {
                if ($.isArray(value)) {
                    if (value[1]) {
                        TC[section][value[0]]();
                    } else {
                        if (value[2]) {
                            TC[section][value[2]]()
                        }
                    }
                } else {
                    TC[section][value]();
                }
            })
        }
    })
}

$(function () {
    _tcAutoload();
});

