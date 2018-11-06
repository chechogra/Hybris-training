var TC = TC || {}; // make sure TC is available

TC.colorbox = {

    _autoload: [
        "configColorbox"
    ],

    configColorbox: function () {
        var symbolDefsPath = ACC.config.contextPath + "/_ui/addons/talosacceleratoraddon/responsive/common/images/symbol-defs.svg";
        ACC.colorbox.config.close = '<svg class="icon icon-close"><use xlink:href="' + symbolDefsPath + '#icon-close"></use></svg>';
        ACC.colorbox.config.onComplete = function () {
            $.colorbox.resize();
            ACC.common.refreshScreenReaderBuffer();
            $("body").css("overflow", "hidden");
        };
        ACC.colorbox.config.onClosed = function () {
            ACC.common.refreshScreenReaderBuffer();
            $("body").css("overflow", "unset");
        };
    }
};
