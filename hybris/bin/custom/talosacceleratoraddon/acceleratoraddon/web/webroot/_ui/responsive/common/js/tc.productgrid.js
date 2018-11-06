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

TC.productGrid = {

    _autoload: [
        "bindHoverEvents",
        "bindVariantsCarousel",
        "bindThumbnailsHover",
        ["bindFacets", $(".js-tc-show-facets").length > 0]
    ],

    bindHoverEvents: function () {

        enquire.register("screen and (max-width:767px)", {
            match: function () {
                $('.product-item-wp').unbind('mouseenter mouseleave');

            }
        });


        enquire.register("screen and (min-width:768px)", {
            match: function () {
                $('.product-item-wp').hover(
                    function () {
                        var owl = $(this).find('.variant-option-container');
                        if (owl.hasClass('owl-loaded')) {
                            owl.trigger("refresh.owl.carousel");
                        } else {
                            TC.productGrid.loadCarouselForVariants(owl);
                        }
                    }
                );
            }
        });
    },

    bindVariantsCarousel: function () {

        enquire.register("screen and (max-width:767px)", {
            match: function () {
                if ($('.variant-option-container-inner').length) {
                    var owl = $('.variant-option-container');
                    TC.productGrid.loadCarouselForVariants(owl);
                }
            }
        });

        enquire.register("screen and (min-width:768px)", {
            match: function () {
                $('.variant-option-container').owlCarousel('destroy');
            }
        });
    },

    loadCarouselForVariants: function (element) {
        var iconPath = ACC.config.contextPath + "/_ui/addons/talosacceleratoraddon/responsive/common/images/symbol-defs.svg";
        var prevArrow = "<svg class='icon icon-chevron-left tc-prev'><use xlink:href='" + iconPath + "#icon-chevron-left'></use></svg>";
        var nextArrow = "<svg class='icon icon-chevron-right tc-next'><use xlink:href='" + iconPath + "#icon-chevron-right'></use></svg>";

        element.owlCarousel({
            autoplay: false,
            nav: true,
            margin: 8,
            dots: false,
            navText: [prevArrow, nextArrow],
            animateOut: 'fadeOut',
            responsive: {
                0: {
                    items: 3,
                    slideBy: 3
                },
                350: {
                    items: 4,
                    slideBy: 4
                },
                420: {
                    items: 5,
                    slideBy: 5
                },

                490: {
                    items: 6,
                    slideBy: 6
                },
                520: {
                    items: 4,
                    slideBy: 4
                },
                620: {
                    items: 5,
                    slideBy: 5
                },
                720: {
                    items: 6,
                    slideBy: 6
                },
                768: {
                    items: 4,
                    slideBy: 4
                },
                900: {
                    items: 5,
                    slideBy: 5
                },
                992: {
                    items: 4,
                    slideBy: 4
                },
                1180: {
                    items: 5,
                    slideBy: 5
                },
                1400: {
                    items: 4,
                    slideBy: 4
                }
            }
        });
    },

    bindThumbnailsHover: function () {

        $('.variant-option-container-inner').hover(
            function () {
                var currentElement = $(this);
                var imgUrl = currentElement.data('imageUrl');
                var parentElement = currentElement.closest('.product-item-inner');
                var gridElement = parentElement.find('.thumb img');
                var thumbElement = parentElement.find('.thumb');
                thumbElement.attr('href', currentElement.data('targetUrl'));
                gridElement.attr('src', imgUrl);

            }, function () {

            }
        );
    },

    bindFacets: function () {
        $(document).on("click", ".js-tc-show-facets", function (e) {
            e.preventDefault();
            var selectRefinementsTitle = $(this).data("selectRefinementsTitle");
            ACC.colorbox.open(selectRefinementsTitle, {
                href: "#tc-product-facet-wp",
                inline: true,
                width: "480px",
                height: window.innerHeight > parseInt("960px") ? "960px" : "95%",
                onComplete: function () {
                    $("body").css("overflow", "hidden");
                },
                onClosed: function () {
                    $("body").css("overflow", "unset");
                }
            });
        });
        enquire.register("screen and (min-width:" + screenSmMax + ")", function () {
            $("#cboxClose").click();
        });
    }
};
