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

TC.grid = {

    _autoload: [
        ["bindResponsiveGrid", $(".tc-responsive-grid-wp").length > 0]
    ],

    bindResponsiveGrid: function () {
        $(".tc-responsive-grid-wp").each(function () {
            var grid = $(this);

            grid.masonry({
                columnWidth: '.grid-sizer',
                itemSelector: '.grid-item',
                percentPosition: true,
                isAnimated: true
            });
        });
    }

};