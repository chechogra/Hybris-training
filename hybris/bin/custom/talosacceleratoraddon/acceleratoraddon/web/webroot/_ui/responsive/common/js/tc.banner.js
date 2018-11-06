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

TC.banner = {

    _autoload: [
        ["bindResponsiveBanner", $(".tc-responsive-banner-wp").length > 0],
        ["bindBannerCarousel", $(".tc-rotating-banner-wp").length > 0]
    ],

    bindResponsiveBanner: function () {
        $(".tc-responsive-banner-wp").each(function () {
            var banner = $(this);
            var innerContainer = banner.find(".tc-responsive-banner-inner");
            var overlay = banner.find(".tc-responsive-banner-overlay");

            TC.banner.preloadBannerImages(banner);
            TC.banner.changeAttributesForViewportSize(banner, overlay, innerContainer, 0);

            enquire
                .register("screen and (min-width:768px)", {
                    match: function () {
                        TC.banner.changeAttributesForViewportSize(banner, overlay, innerContainer, 1);
                    },
                    unmatch: function () {
                        TC.banner.changeAttributesForViewportSize(banner, overlay, innerContainer, 0);
                    }
                })
                .register("screen and (min-width:992px)", {
                    match: function () {
                        TC.banner.changeAttributesForViewportSize(banner, overlay, innerContainer, 2);
                    },
                    unmatch: function () {
                        TC.banner.changeAttributesForViewportSize(banner, overlay, innerContainer, 1);
                    }
                })
                .register("screen and (min-width:1200px)", {
                    match: function () {
                        TC.banner.changeAttributesForViewportSize(banner, overlay, innerContainer, 3);
                    },
                    unmatch: function () {
                        TC.banner.changeAttributesForViewportSize(banner, overlay, innerContainer, 2);
                    }
                });

        });
    },

    changeAttributesForViewportSize: function (banner, overlay, innerContainer, index) {
        var viewports = ["Xs", "Sm", "Md", "Lg"];

        var viewportTitle = banner.find(".title-" + viewports[index].toLowerCase());
        var previousViewportTitle = index > 0 ? banner.find(".title-" + viewports[index - 1].toLowerCase()) : null;

        if (viewportTitle.html() === "empty") {
            viewportTitle.css("display", "none");
        } else if (viewportTitle.is(":empty") && null != previousViewportTitle) {
            viewportTitle.html(previousViewportTitle.html());
        }

        var viewportDescription = banner.find(".description-" + viewports[index].toLowerCase());
        var previousViewportDescription = index > 0 ? banner.find(".description-" + viewports[index - 1].toLowerCase()) : null;

        if (viewportDescription.html() === "empty") {
            viewportDescription.css("display", "none");
        } else if (viewportDescription.is(":empty") && null != previousViewportDescription) {
            viewportDescription.html(previousViewportDescription.html());
        }

        if (banner.data("media" + viewports[index])) {
            banner.css("background-image", "url(" + banner.data("media" + viewports[index]) + ")");
        }
        if (banner.data("height" + viewports[index])) {
            banner.css("height", banner.data("height" + viewports[index]));
        }
        if (banner.data("backgroundSize" + viewports[index])) {
            banner.css("background-size", banner.data("backgroundSize" + viewports[index]));
        }
        if (banner.data("backgroundPosition" + viewports[index])) {
            banner.css("background-position", banner.data("backgroundPosition" + viewports[index]));
        }
        if (banner.data("backgroundColor" + viewports[index])) {
            banner.css("background-color", banner.data("backgroundColor" + viewports[index]));
        }
        if (banner.data("overlay" + viewports[index])) {
            overlay.css("background", banner.data("overlay" + viewports[index]));
        }
        if (banner.data("textColor" + viewports[index])) {
            banner.css("color", banner.data("textColor" + viewports[index]));
        }
        if (banner.data("flexDirection" + viewports[index])) {
            innerContainer.css("flex-direction", banner.data("flexDirection" + viewports[index]).replace("_", "-"));
        }
        if (banner.data("justifyContent" + viewports[index])) {
            innerContainer.css("justify-content", banner.data("justifyContent" + viewports[index]).replace("_", "-"));
        }
        if (banner.data("alignItems" + viewports[index])) {
            innerContainer.css("align-items", banner.data("alignItems" + viewports[index]).replace("_", "-"));
        }
    },

    preloadBannerImages: function (banner) {
        if (banner.data("mediaXs")) {
            var xsImg = new Image();
            xsImg.src = banner.data("mediaXs");
        }
        if (banner.data("mediaSm")) {
            var smImg = new Image();
            smImg.src = banner.data("mediaSm");
        }
        if (banner.data("mediaMd")) {
            var mdImg = new Image();
            mdImg.src = banner.data("mediaMd");
        }
        if (banner.data("mediaLg")) {
            var lgImg = new Image();
            lgImg.src = banner.data("mediaLg");
        }
    },

    bindBannerCarousel: function () {
        $(".tc-rotating-banner-wp").each(function () {
            var component = $(this);
            var iconPath = component.data("iconPath");
            var prevArrow, nextArrow;

            if (component.data("navColor")) {
                var navColor = component.data("navColor");
                prevArrow = "<svg class='icon icon-chevron-left tc-prev' style='color: " + navColor + ";'><use xlink:href='" + iconPath + "#icon-chevron-left'></use></svg>";
                nextArrow = "<svg class='icon icon-chevron-right tc-next' style='color: " + navColor + ";'><use xlink:href='" + iconPath + "#icon-chevron-right'></use></svg>";
            } else {
                prevArrow = "<svg class='icon icon-chevron-left tc-prev'><use xlink:href='" + iconPath + "#icon-chevron-left'></use></svg>";
                nextArrow = "<svg class='icon icon-chevron-right tc-next'><use xlink:href='" + iconPath + "#icon-chevron-right'></use></svg>";
            }

            component.find(".tc-rotating-banner-inner").owlCarousel({
                autoplay: true,
                loop: true,
                nav: true,
                dots: false,
                autoplaySpeed: 1000,
                smartSpeed: 1000,
                navText: [prevArrow, nextArrow],
                autoWidth: false,
                items: 1,
                animateOut: 'fadeOut',
                responsive: {
                    0: {
                        items: component.data("itemsShownXs"),
                        animateOut: component.data("itemsShownXs") === 1 ? 'fadeOut' : false
                    },
                    768: {
                        items: component.data("itemsShownSm"),
                        animateOut: component.data("itemsShownSm") === 1 ? 'fadeOut' : false
                    },
                    992: {
                        items: component.data("itemsShownMd"),
                        animateOut: component.data("itemsShownMd") === 1 ? 'fadeOut' : false
                    },
                    1200: {
                        items: component.data("itemsShownLg"),
                        animateOut: component.data("itemsShownLg") === 1 ? 'fadeOut' : false
                    }
                }
            });

            component.find(".tc-rotating-banner-headline").fadeIn(1000);
        });
    }
};