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

TC.carousel = {

    _autoload: [
        ["bindProductCarousel", $(".tc-product-carousel-wp").length > 0]
    ],

    bindProductCarousel: function () {
        $(".tc-product-carousel-wp").each(function () {
            var component = $(this);
            var iconPath = component.data("iconPath");

            var prevArrow = "<svg class='icon icon-chevron-left tc-prev'><use xlink:href='" + iconPath + "#icon-chevron-left'></use></svg>";
            var nextArrow = "<svg class='icon icon-chevron-right tc-next'><use xlink:href='" + iconPath + "#icon-chevron-right'></use></svg>";

            component.find(".tc-product-carousel-inner").owlCarousel({
                autoplay: true,
                loop: true,
                nav: true,
                dots: false,
                autoplaySpeed: 1000,
                smartSpeed: 1000,
                navText: [prevArrow, nextArrow],
                center: true,
                autoWidth: false,
                items: 1,
                animateOut: 'fadeOut',
                responsive: {
                    0: {
                        autoWidth: false,
                        items: 1,
                        animateOut: 'fadeOut'
                    },
                    768: {
                        autoWidth: false,
                        items: 1,
                        animateOut: 'fadeOut'
                    },
                    992: {
                        autoWidth: true,
                        items: 2
                    }
                }

            });

            component.find($(".tc-prev")).css("color", component.data("nav-color"));
            component.find($(".tc-next")).css("color", component.data("nav-color"));

            component.find($(".tc-product-carousel-item > a")).each(function () {
                $(this).css("background", component.data("background-color"));
            });

            component.fadeIn();

            enquire
                .register("screen and (min-width:768px)", {
                    match: function () {
                        component.find(".tc-product-carousel-inner").trigger("refresh.owl.carousel");
                    },
                    unmatch: function () {
                        component.find(".tc-product-carousel-inner").trigger("refresh.owl.carousel");
                    }
                })
                .register("screen and (min-width:992px)", {
                    match: function () {
                        component.find(".tc-product-carousel-inner").trigger("refresh.owl.carousel");
                    },
                    unmatch: function () {
                        component.find(".tc-product-carousel-inner").trigger("refresh.owl.carousel");
                    }
                })
                .register("screen and (min-width:1200px)", {
                    match: function () {
                        component.find(".tc-product-carousel-inner").trigger("refresh.owl.carousel");
                    },
                    unmatch: function () {
                        component.find(".tc-product-carousel-inner").trigger("refresh.owl.carousel");
                    }
                });
        });
    }
};