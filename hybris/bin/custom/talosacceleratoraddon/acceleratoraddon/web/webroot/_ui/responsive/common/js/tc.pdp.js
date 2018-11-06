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

TC.pdp = {

    _autoload: [
        ["bindProductGallery", $(".tc-product-gallery-wp").length > 0]
    ],

    bindProductGallery: function () {
        $(".tc-product-gallery-wp").each(function () {
            var component = $(this);
            var gallerySize = component.data("gallerySize");
            var iconPath = ACC.config.contextPath + "/_ui/addons/talosacceleratoraddon/responsive/common/images/symbol-defs.svg";

            var prevArrow = "<svg class='icon icon-chevron-left tc-up'><use xlink:href='" + iconPath + "#icon-chevron-left'></use></svg>";
            var nextArrow = "<svg class='icon icon-chevron-right tc-down'><use xlink:href='" + iconPath + "#icon-chevron-right'></use></svg>";
            var topArrow = "<svg class='icon icon-chevron-up tc-up'><use xlink:href='" + iconPath + "#icon-chevron-up'></use></svg>";
            var bottomArrow = "<svg class='icon icon-chevron-down tc-down'><use xlink:href='" + iconPath + "#icon-chevron-down'></use></svg>";

            if (gallerySize === 1) {
                component.addClass("hidden-nav");
                component.addClass("hidden-gallery");
            }

            var slider = component.find(".tc-product-gallery-inner").lightSlider({
                loop: true,
                prevHtml: prevArrow,
                nextHtml: nextArrow,
                enableDrag: false,
                item: 1,
                slideMargin: 0,
                speed: 600,
                adaptiveHeight: true,
                mode: 'fade'
            });

            enquire
                .register("screen and (min-width:768px)", {
                    match: function () {
                        if (gallerySize <= 3) {
                            component.addClass("hidden-nav");
                        } else {
                            component.removeClass("hidden-nav");
                        }

                        slider.destroy();
                        slider = component.find(".tc-product-gallery-inner").lightSlider({
                            loop: true,
                            prevHtml: topArrow,
                            nextHtml: bottomArrow,
                            gallery: true,
                            vertical: true,
                            enableDrag: false,
                            item: 1,
                            thumbItem: 3,
                            thumbMargin: 40,
                            slideMargin: 0,
                            speed: 0,
                            verticalHeight: 400
                        });
                    },
                    unmatch: function () {
                        if (gallerySize === 1) {
                            component.addClass("hidden-nav");
                        } else {
                            component.removeClass("hidden-nav");
                        }

                        slider.destroy();
                        slider = component.find(".tc-product-gallery-inner").lightSlider({
                            loop: true,
                            prevHtml: prevArrow,
                            nextHtml: nextArrow,
                            enableDrag: false,
                            item: 1,
                            slideMargin: 0,
                            speed: 600,
                            adaptiveHeight: true,
                            mode: 'fade'
                        });
                    }
                })
                .register("screen and (min-width:992px)", {
                    match: function () {
                        if (gallerySize <= 4) {
                            component.addClass("hidden-nav");
                        } else {
                            component.removeClass("hidden-nav");
                        }

                        slider.destroy();
                        slider = component.find(".tc-product-gallery-inner").lightSlider({
                            loop: true,
                            prevHtml: prevArrow,
                            nextHtml: nextArrow,
                            gallery: true,
                            enableDrag: false,
                            item: 1,
                            thumbItem: 4,
                            thumbMargin: 40,
                            slideMargin: 0,
                            speed: 0,
                            verticalHeight: 400
                        });
                    },
                    unmatch: function () {
                        if (gallerySize <= 3) {
                            component.addClass("hidden-nav");
                        } else {
                            component.removeClass("hidden-nav");
                        }

                        slider.destroy();
                        slider = component.find(".tc-product-gallery-inner").lightSlider({
                            loop: true,
                            prevHtml: topArrow,
                            nextHtml: bottomArrow,
                            gallery: true,
                            vertical: true,
                            enableDrag: false,
                            item: 1,
                            thumbItem: 3,
                            thumbMargin: 40,
                            slideMargin: 0,
                            speed: 0,
                            verticalHeight: 400
                        });
                    }
                })
                .register("screen and (min-width:1200px)", {
                    match: function () {
                        if (gallerySize <= 4) {
                            component.addClass("hidden-nav");
                        } else {
                            component.removeClass("hidden-nav");
                        }

                        slider.destroy();
                        slider = component.find(".tc-product-gallery-inner").lightSlider({
                            loop: true,
                            prevHtml: topArrow,
                            nextHtml: bottomArrow,
                            gallery: true,
                            vertical: true,
                            enableDrag: false,
                            item: 1,
                            thumbItem: 4,
                            thumbMargin: 40,
                            slideMargin: 0,
                            speed: 0
                        });
                    },
                    unmatch: function () {
                        if (gallerySize <= 4) {
                            component.addClass("hidden-nav");
                        } else {
                            component.removeClass("hidden-nav");
                        }

                        slider.destroy();
                        slider = component.find(".tc-product-gallery-inner").lightSlider({
                            loop: true,
                            prevHtml: prevArrow,
                            nextHtml: nextArrow,
                            gallery: true,
                            enableDrag: false,
                            item: 1,
                            thumbItem: 4,
                            thumbMargin: 40,
                            slideMargin: 0,
                            speed: 0,
                            verticalHeight: 400
                        });
                    }
                });

            component.find(".tc-product-gallery-inner li").each(function () {
                var image = $(this);

                image.zoom({
                    url: image.data("src"),
                    target: image.find(".tc-image-zoom-wp")
                });
            });

            component.css("opacity", "1");
        });
    }
};