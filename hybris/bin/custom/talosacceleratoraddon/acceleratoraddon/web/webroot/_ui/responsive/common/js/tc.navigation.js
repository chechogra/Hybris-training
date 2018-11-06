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

TC.navigation = {
    passiveeventlisteners: false,
    maxScrollTop: 10,
    autoHeight: 0,

    _autoload: [
        "init",
        "checkBreadcrumbPresence",
        "bindHamburgerMenu",
        "bindHeaderNavigation",
        "bindMenuNavigationBack",
        "bindUserPreferencesNavigation",
        "bindOrderToolsNavigation",
        "bindScrollToTopAction",
        "bindSearchAction",
        "bindAutocompleteMutationObserver",
        "bindBreadcrumbEntrance",
        "bindMenuOnHover",
        "bindCategoryLinksCalculation",
        "bindKeyEvents"
    ],

    init: function () {
        this.passiveeventlisteners = this.checkSupportsPassive();
    },

    bindHamburgerMenu: function () {
        var categoryItemElement = $(".tc-mn-category-item");
        $('.tc-hamburger').click(function () {
            var htmlElement = $(document.documentElement);
            var hamburgerBtn = $(this);

            if (htmlElement.hasClass('tc-searchbox-open')) {
                hamburgerBtn.removeClass("is-active");
                htmlElement.removeClass("tc-mn-noscroll tc-mn-noscroll-long tc-searchbox-open");
                TC.navigation.clearSearchBox();
                return;
            }

            var navElement = $('#tc_main_nav');

            if (hamburgerBtn.hasClass("is-active")) {
                TC.navigation.bindMobileListItemsAnimation(true);
                navElement.removeClass("tc-offcanvas");
                navElement.removeClass("tc-user-pref-open");
                navElement.removeClass("tc-order-tools-open");
                hamburgerBtn.removeClass("is-active");
                navElement.removeClass("tc-expanded");
                htmlElement.removeClass("tc-mn-noscroll tc-mn-noscroll-long");
                categoryItemElement.css('opacity', '0');
            } else {
                categoryItemElement.css('opacity', '1');
                TC.navigation.bindMobileListItemsAnimation(false);
                hamburgerBtn.addClass("is-active");
                navElement.addClass("tc-expanded");
                htmlElement.addClass("tc-mn-noscroll tc-mn-noscroll-long");
            }
        });
        enquire.register("screen and (max-width:767px)", {
            match: function () {
                $('.tc-mn-category-sub-navigation-container').css('width', '100%');
                $('.tc-mn-category-sub-navigation-wp').css('max-width', '100%');
                TC.common.removeDisplayStyle($('.tc-mn-category-sub-navigation'));
                categoryItemElement.css('opacity', '0');
            }
        });
        enquire.register("screen and (min-width:768px)", {
            match: function () {
                categoryItemElement.css('opacity', '1');
            }
        });
    },

    bindHeaderNavigation: function () {
        var navElement = $('#tc_main_nav');
        var triggerElement = $('.tc-mn-category-item.tc-has-sub > .tc-mn-category-link a');
        enquire.register("screen and (max-width:767px)", {
            match: function () {
                triggerElement.click(function (e) {
                    e.preventDefault();
                    $(this).closest(".tc-collapsible-parent").removeClass('tc-collapsed');
                    TC.common.collapseHandler($(this));
                });
                $('.tc-hamburger').removeClass("is-active");
            }
        });
        enquire.register("screen and (min-width:768px)", {
            match: function () {
                TC.navigation.closeOpenCategories();
                triggerElement.off('click');
                navElement.removeClass("tc-expanded");
            }
        });

    },


    closeOpenCategories: function () {
        $('.tc-mn-category-item.open').each(function () {
            TC.common.closeCollapsibleItem($(this));
        });
    },

    bindMobileListItemsAnimation: function (isDecremental) {

        var listItems = $('#tc_main_nav .tc-header-content > ul > li');
        var incrementInSeconds = 0.05;

        var delay = 0.35;
        var opacityDelay = 0.35;

        if (isDecremental) {
            delay = delay + (listItems.length * incrementInSeconds);
            opacityDelay = (listItems.length * incrementInSeconds);
        }

        listItems.each(function () {
            $(this).css({transitionDelay: opacityDelay + 's,' + delay + 's,' + delay + 's'});

            if (isDecremental) {
                delay = delay - incrementInSeconds;
                opacityDelay = opacityDelay - incrementInSeconds;
            } else {
                delay = delay + incrementInSeconds;
                opacityDelay = opacityDelay + incrementInSeconds;
            }


        });
    },

    bindMenuNavigationBack: function () {

        $(".js-tc-navigation-back").click(function () {
            var navElement = $('#tc_main_nav');
            navElement.removeClass("tc-offcanvas tc-user-pref-open tc-order-tools-open");
        });
    },

    bindUserPreferencesNavigation: function () {

        $(".js-tc-open-user-pref").click(function () {
            var navElement = $('#tc_main_nav');
            navElement.addClass("tc-offcanvas tc-user-pref-open");
        });
    },

    bindOrderToolsNavigation: function () {

        $(".js-tc-open-order-tools").click(function () {
            var navElement = $('#tc_main_nav');
            navElement.addClass("tc-offcanvas tc-order-tools-open")
        });
    },

    bindScrollToTopAction: function () {
        $('.tc-back-to-top').click(function () {
            $('html,body').animate({scrollTop: 0}, 'slow');
        });
    },

    bindSearchAction: function () {
        $('.tc-mn-search').click(function () {
            var htmlElement = $(document.documentElement);
            var hamburgerBtn = $('.tc-hamburger');
            var siteSearchInput = $('.js-site-search-input');
            htmlElement.addClass("tc-mn-noscroll tc-mn-noscroll-long tc-searchbox-open");
            hamburgerBtn.addClass("is-active");
            siteSearchInput.focus();
        });

        $('.search-close-btn').click(function () {
            var htmlElement = $(document.documentElement);
            if (htmlElement.hasClass('tc-searchbox-open')) {
                htmlElement.removeClass("tc-mn-noscroll tc-mn-noscroll-long tc-searchbox-open");
                TC.navigation.clearSearchBox();
            }
        });
    },

    clearSearchBox: function () {
        var siteSearchInput = $('.js-site-search-input');
        siteSearchInput.val('');
    },

    bindKeyEvents: function () {
        document.addEventListener("keydown", function (ev) {
            var htmlElement = $(document.documentElement);
            if (ev.keyCode === 27 && htmlElement.hasClass('tc-searchbox-open')) {
                var hamburgerBtn = $('.tc-hamburger');
                hamburgerBtn.removeClass("is-active");
                htmlElement.removeClass("tc-mn-noscroll tc-mn-noscroll-long tc-searchbox-open");
                TC.navigation.clearSearchBox();
            }
        });
    },

    bindMenuOnHover: function () {
        var masonryOptions = {
            itemSelector: '.tc-categories-grid-item',
            columnWidth: 130,
            transitionDuration: 0
        };
        var categoriesGridElement = $('.tc-categories-grid');
        var breadcrumbElement = $('.tc-breadcrumb-section');
        var htmlElement = $(document.documentElement);
        var magicLine = $('.magic-line');
        var currentElement;
        var leftPos;
        var currentLinkWidth;
        var currentLinkElement;
        var newWidth;
        var triggerElement = $(".tc-mn-category-item");

        $('.tc-mn-category-link a').removeAttr('title');
        categoriesGridElement.masonry(masonryOptions);

        enquire.register("screen and (max-width:767px)", {
            match: function () {
                categoriesGridElement.masonry(masonryOptions);
                categoriesGridElement.masonry('destroy');
                $('.tc-mn-category-sub-navigation-wp').css('opacity', '1');
                triggerElement.unbind('mouseenter mouseleave');
                $('.tc-mn-category-sub-navigation-section').removeClass('tc-categories-grid-item');
            }
        });
        enquire.register("screen and (min-width:768px)", {
            match: function () {
                $('.tc-mn-category-sub-navigation-section').addClass('tc-categories-grid-item');
                categoriesGridElement.masonry(masonryOptions);
                triggerElement.hover(
                    function () {
                        breadcrumbElement.addClass('hidden');
                        currentElement = $(this);
                        currentLinkElement = currentElement.find('.tc-mn-category-link a');
                        currentLinkWidth = currentLinkElement.width();
                        leftPos = currentLinkElement.position().left + 30;
                        newWidth = currentLinkWidth;
                        $(this).find('.tc-mn-category-sub-navigation').css('display', 'block');
                        magicLine.stop().animate({
                            left: leftPos,
                            width: newWidth,
                            backgroundColor: '#1E1E1E'
                        });
                        currentElement.find(".tc-collapsible-content").css('height', 'auto');
                        htmlElement.addClass('tc-category-expanded');
                        categoriesGridElement.masonry(masonryOptions);
                        $(this).find('.tc-mn-category-sub-navigation-wp').stop().animate({
                            opacity: 1
                        }, 600);
                    }, function () {
                        breadcrumbElement.removeClass('hidden');
                        categoriesGridElement.masonry('destroy');
                        $(this).find(".tc-collapsible-content").height(0);
                        $(this).find('.tc-mn-category-sub-navigation').css('display', 'none');
                        htmlElement.removeClass('tc-category-expanded');
                        magicLine.stop().animate({
                            backgroundColor: 'transparent'
                        });
                        $(this).find('.tc-mn-category-sub-navigation-wp').stop().animate({
                            opacity: 0
                        }, 400);
                    }
                );
                $('.tc-mn-icon-js').hover(
                    function () {
                        htmlElement.addClass('tc-category-expanded');
                    }, function () {
                        htmlElement.removeClass('tc-category-expanded');
                    }
                );
            }
        });
    },
    bindCategoryLinksCalculation: function () {

        var categorySectionElements = $('.tc-mn-category-sub-navigation-container');
        var columnLimitMdWithImage = 2;
        var columnLimitMd = 4;
        var columnLimitLgWithImage = 3;
        var columnLimitLg = 6;
        var columnLimitXlWithImage = 4;
        var columnLimitXl = 8;

        enquire.register("screen and (min-width:768px) and (max-width:991px)", {
            match: function () {
                TC.navigation.calculateCategoriesSize(categorySectionElements, columnLimitMd, columnLimitMdWithImage);
            }
        });

        enquire.register("screen and (min-width:992px) and (max-width:1199px)", {
            match: function () {
                TC.navigation.calculateCategoriesSize(categorySectionElements, columnLimitLg, columnLimitLgWithImage);
            }
        });

        enquire.register("screen and (min-width:1200px)", {
            match: function () {
                TC.navigation.calculateCategoriesSize(categorySectionElements, columnLimitXl, columnLimitXlWithImage);
            }
        });
    },

    calculateCategoriesSize: function (categorySectionElements, columnLimit, columnLimitWidthImage) {
        var categorySectionWidth = 130;
        var maxElementWidth = 0;
        var categoryImageWidth;
        var maxCategoriesElementWidth = 0;
        var imgElement;
        var colLimit;

        categorySectionElements.each(function () {
            colLimit = columnLimit;
            categoryImageWidth = 0;
            imgElement = $(this).find('~ .tc-category-image-wp');
            if (imgElement.length) {
                categoryImageWidth = imgElement.outerWidth();
            }
            if (categoryImageWidth > 0) {
                colLimit = columnLimitWidthImage;
            }

            var numberOfChildren = 0;
            $(this).find('.tc-mn-category-sub-navigation-inner').children().each(function () {
                numberOfChildren = numberOfChildren + 1;
            });
            if (numberOfChildren <= colLimit && numberOfChildren > 0) {
                maxCategoriesElementWidth = numberOfChildren * categorySectionWidth;
            }
            else {
                maxCategoriesElementWidth = colLimit * categorySectionWidth;
            }

            maxElementWidth = maxCategoriesElementWidth + categoryImageWidth;
            $(this).closest('.tc-mn-category-sub-navigation-wp').css('max-width', maxElementWidth + 'px');
            $(this).css('width', maxCategoriesElementWidth + 'px');
        });
    },

    bindAutocompleteMutationObserver: function () {
        var observer = new MutationObserver(function (mutations) {
            // For the sake of...observation...let's output the mutation to console to see how this all works
            mutations.forEach(function (mutation) {
                if (mutation.addedNodes && mutation.addedNodes.length) {
                    for (var i = 0; i < mutation.addedNodes.length; i++) {
                        var $el = $(mutation.addedNodes[i]);
                        if ($el.find('.thumb').length) {
                            $el.addClass('tc-suggestion-has-thumb');
                        }
                    }
                }
            });
        });

        var observerConfig = {
            attributes: false,
            childList: true,
            characterData: false
        };

        var targetNode = document.getElementsByClassName('ui-autocomplete');

        if (targetNode.length) {
            observer.observe(targetNode[0], observerConfig);
        }
    },

    bindBreadcrumbEntrance: function () {
        var breadCrumbElement = $('.breadcrumb');

        if (breadCrumbElement.length) {
            var $window = $(window);
            var breadCrumbLiElements = $('.breadcrumb li:not(.tc-breadcrumb-band)');
            var bandElement = $('.tc-breadcrumb-band');
            var viewPortWidth = $window.outerWidth();
            var containerWidth = $('.tc-container').width();

            //Calculates how much distance the band must move from it's parent right.
            var distanceToMove = ((viewPortWidth - containerWidth) / 2) + breadCrumbElement.outerWidth();

            bandElement.css("right", distanceToMove + "px");
            bandElement.css("opacity", "1");
            bandElement.animate({
                right: 0
            }, 1000, function () {
                breadCrumbLiElements.animate({
                    opacity: 1
                }, 700);
            });

            var breadcrumbSection = $('.breadcrumb-section');
            var closed = false;

            var scrollHandler = function () {
                var scrollTop = $(window).scrollTop();

                if (!closed && scrollTop > TC.navigation.maxScrollTop) {
                    breadcrumbSection.animate({height: 0}, 300);

                    closed = true;
                } else if (closed && scrollTop <= TC.navigation.maxScrollTop) {
                    breadcrumbSection.animate({height: TC.navigation.autoHeight}, 300);
                    closed = false;
                }
            };

            enquire.register("screen and (min-width:" + screenSmMin + ")", {
                match: function () {
                    if (0 !== breadcrumbSection.height()) {
                        TC.navigation.autoHeight = breadcrumbSection.height();
                    }

                    window.addEventListener('scroll', scrollHandler
                        , TC.navigation.passiveeventlisteners ? {passive: true} : false);

                },
                unmatch: function () {
                    window.removeEventListener('scroll', scrollHandler);
                }
            });
        }
    },

    checkSupportsPassive: function () {
        var supportsPassive = false;
        try {
            var opts = Object.defineProperty({}, 'passive', {
                get: function () {
                    supportsPassive = true;
                }
            });
            window.addEventListener("test", null, opts);
        } catch (e) {
        }

        return supportsPassive;
    },

    checkBreadcrumbPresence: function () {
        var breadCrumbElement = $('.breadcrumb');

        if (!breadCrumbElement.length) {
            var htmlElement = $(document.documentElement);
            htmlElement.addClass("breadcrumb-not-present");
        }
    }
};

