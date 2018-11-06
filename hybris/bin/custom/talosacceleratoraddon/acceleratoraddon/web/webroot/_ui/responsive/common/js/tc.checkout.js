var TC = TC || {}; // make sure TC is available

TC.checkout = {

    _autoload: [
        ["bindSavedPayments", $(".js-tc-saved-payments").length > 0],
        ["bindViewAddressBook", $(".js-tc-address-book").length > 0]
    ],


    bindSavedPayments: function () {
        $(document).on("click", ".js-tc-saved-payments", function (e) {
            e.preventDefault();

            ACC.colorbox.open("Use a saved card", {
                href: "#savedpaymentsbody",
                inline: true,
                width: "380px",
                height: window.innerHeight > parseInt("960px") ? "960px" : "95%",
                onComplete: function () {
                    $("body").css("overflow", "hidden");
                },
                onClosed: function () {
                    $("body").css("overflow", "unset");
                }
            });
        });
    },

    bindViewAddressBook: function () {
        $(document).on("click", ".js-tc-address-book", function (e) {
            e.preventDefault();

            ACC.colorbox.open("Saved Addresses", {
                href: "#addressbook",
                inline: true,
                width: "380px",
                height: window.innerHeight > parseInt("960px") ? "960px" : "95%",
                onComplete: function () {
                    $("body").css("overflow", "hidden");
                },
                onClosed: function () {
                    $("body").css("overflow", "unset");
                }
            });
        });
    }
};
