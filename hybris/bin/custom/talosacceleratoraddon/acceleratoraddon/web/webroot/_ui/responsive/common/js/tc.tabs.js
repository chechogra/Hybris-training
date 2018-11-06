var TC = TC || {}; // make sure TC is available

TC.tabs = {
    smScreen: true,

    _autoload: [
        ["bindTabs", $(".js-tc-tabs").length > 0],
        "hideReviewBtn",
        "determineToDisplayReviews",
        "bindProductTabsNavigation"
    ],

    bindTabs: function () {
        var $e = $(".js-tc-tabs");

        $e.on("click", ".all-reviews-btn", function (e) {
            e.preventDefault();
            TC.tabs.showReviewsAction("allreviews");
            TC.tabs.hideReviewBtn(".all-reviews-btn");
            TC.tabs.showReviewBtn(".less-reviews-btn");
        });

        $e.on("click", ".less-reviews-btn", function (e) {
            e.preventDefault();
            TC.tabs.showReviewsAction("reviews");
            TC.tabs.hideReviewBtn(".less-reviews-btn");
            TC.tabs.showReviewBtn(".all-reviews-btn");
        });

        $(document).on("click", '.js-writeReviewTab', function (e) {
            if ($(window).width() < 768) {
                e.preventDefault();
                var collapsible = $('#tc_product_reviews_collapsible');
                collapsible.collapse('show');
                $(".js-review-write").show();
                $("html, body").delay(100).animate({scrollTop: (collapsible.offset().top + 20)}, 'slow', function () {
                    $('#reviewForm input[name=headline]').focus();
                });
            } else {
                e.preventDefault();
                var reviewsTab = $("#ProductReviewsTabComponent");
                TC.tabs.tabHandler(reviewsTab);
                $(".js-review-write").show();
                $('#reviewForm input[name=headline]').focus();
                $("html, body").animate({scrollTop: (reviewsTab.offset().top + 20)}, 'slow');
            }
        });

        $(document).on("click", ".js-openTab", function (e) {
            if ($(window).width() < 768) {
                e.preventDefault();
                var collapsible = $('#tc_product_reviews_collapsible');
                collapsible.collapse('show');
                $("html, body").delay(100).animate({scrollTop: (collapsible.offset().top + 20)}, 'slow');
            } else {
                e.preventDefault();
                var reviewsTab = $("#ProductReviewsTabComponent");
                TC.tabs.tabHandler(reviewsTab);
                $("html, body").animate({scrollTop: (reviewsTab.offset().top + 20)}, 'slow');
            }
        });

        $(document).on("click", ".js-review-write-toggle", function (e) {
            e.preventDefault();
            if ($(".js-review-write:visible").length < 1) {
                $(".js-review-write").show();
            } else {
                $(".js-review-write").hide();
            }
        });

        $("#tc_product_reviews_collapsible").on('shown.bs.collapse', function () {
            TC.tabs.determineToDisplayReviews();
        });

    },

    showReviewsAction: function (s) {
        $.get($("#reviews").data(s), function (result) {
            $('#reviews').html(result);

            if ($(".js-ratingCalc").length > 0) {
                TC.tabs.bindRatingStars();
                TC.tabs.showingAllReviews();
            } else {
                $(".review-pagination-bar .right").hide();
                $(".review-pagination-bar:last").hide();
            }
        });

    },

    hideReviewBtn: function (btnClass) {
        btnClass = (btnClass == undefined) ? ".less-reviews-btn" : btnClass;
        $(btnClass).hide();
    },

    showReviewBtn: function (btnClass) {
        $(btnClass).show();
    },

    showingAllReviews: function () {
        var isShowingAllReviews = $("#showingAllReviews").data("showingallreviews");
        if (isShowingAllReviews) {
            TC.tabs.hideReviewBtn(".all-reviews-btn");
        }
    },

    determineToDisplayReviews: function () {
        TC.tabs.showReviewsAction('reviews');
    },


    bindProductTabsNavigation: function () {
        enquire.register("screen and (max-width: " + tcScreenSmMax + ")", {
            match: function () {
                TC.tabs.smScreen = true;
                TC.tabs.closeOpenItems();
            }
        });
        enquire.register("screen and (min-width: " + tcScreenSmMin + ")", {
            match: function () {
                TC.tabs.smScreen = false;
                TC.tabs.closeOpenItems();
                TC.tabs.tabHandler($('.tc-tab-trigger:first-child'));
            }
        });
        var triggerElement = $('.tc-tab-trigger');
        triggerElement.click(function (e) {
            if (!TC.tabs.smScreen) {
                e.preventDefault();
                TC.tabs.tabHandler($(this));
            }
        });
    },

    tabHandler: function (triggerElement) {
        if (triggerElement) {
            if (!triggerElement.hasClass("active")) {

                $('.tc-tab-trigger.active').removeClass("active");
                triggerElement.addClass("active");

                var tabContentId = triggerElement.data('tabcontainer');
                var collapsibleContent = $('.tc-tab-content-' + tabContentId);

                if (collapsibleContent) {
                    if (collapsibleContent.is('#tc_product_reviews_collapsible')) {
                        TC.tabs.determineToDisplayReviews();
                    }

                    $('.tc-pdp-tabs .tc-collapsible-content').css("display", "none");
                    collapsibleContent.css("display", "block");
                    collapsibleContent.css("height", "auto");
                }
            }
        }

    },

    closeTabItem: function (collapsibleParent) {
        collapsibleParent.removeClass("active");
        var collapsibleContent = collapsibleParent.find(".tc-collapsible-content");

        if (collapsibleContent) {
            collapsibleContent.css("display", "none");
        }
    },

    closeOpenItems: function () {
        if (TC.tabs.smScreen) {
            $('.tc-collapse-trigger').attr("data-toggle", "collapse");
            var collapsibleContent = $('.tc-pdp-tabs .tc-collapsible-content');
            $('.tc-tab-trigger.active').removeClass('active');
            $('.tc-pdp-tabs .tc-collapsible-parent').removeClass("open");

            TC.common.removeDisplayStyle(collapsibleContent);
        } else {
            $('.tc-pdp-tabs .tc-collapse-trigger').removeAttr("data-toggle").addClass('collapsed');

            var openContent = $('.tc-pdp-tabs .tc-collapsible-content.in');
            openContent.removeClass("in");
        }
    },

    bindRatingStars: function () {
        var counterBig = 1;
        $(".review-entry .js-ratingCalc").each(function () {
            var rating = $(this).data("rating");
            var limit = parseFloat(rating.rating, 10);
            var counter = 1;
            var stars = $(this).find(".js-greenStars").find('span');
            console.log("im in " + counterBig);
            stars.each(function () {
                if (counter <= limit) {
                    $(this).css('width', '1em');
                    console.log("painted star " + counter + " from set " + counterBig);
                }
                else {
                    if ((counter - limit) > 0 && (counter - limit) < 1) {
                        $(this).css('width', '0.5em');
                        console.log("painted half star " + counter + " from set " + counterBig);
                    }
                    else {
                        return false;
                    }
                }
                counter = counter + 1;
            });
            counterBig = counterBig + 1;
        })
    }
};
