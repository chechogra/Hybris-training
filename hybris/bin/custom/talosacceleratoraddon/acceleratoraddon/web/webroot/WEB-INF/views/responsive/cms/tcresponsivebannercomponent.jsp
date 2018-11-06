<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags" %>

<c:if test="${component.visible}">
    <div class="tc-responsive-banner-wp
         <c:if test="${component.showContentOnHoverXs}">show-content-on-hover-xs</c:if>
         <c:if test="${component.showContentOnHoverSm}">show-content-on-hover-sm</c:if>
         <c:if test="${component.showContentOnHoverMd}">show-content-on-hover-md</c:if>
         <c:if test="${component.showContentOnHoverLg}">show-content-on-hover-lg</c:if>
         grid-item grid-item--width${component.gridColumns}"
         <c:if test="${not empty component.mediaXs}">data-media-xs="${component.mediaXs.url}"</c:if>
         <c:if test="${not empty component.mediaSm}">data-media-sm="${component.mediaSm.url}"</c:if>
         <c:if test="${not empty component.mediaMd}">data-media-md="${component.mediaMd.url}"</c:if>
         <c:if test="${not empty component.mediaLg}">data-media-lg="${component.mediaLg.url}"</c:if>
         <c:if test="${not empty component.heightXs}">data-height-xs="${component.heightXs}"</c:if>
         <c:if test="${not empty component.heightSm}">data-height-sm="${component.heightSm}"</c:if>
         <c:if test="${not empty component.heightMd}">data-height-md="${component.heightMd}"</c:if>
         <c:if test="${not empty component.heightLg}">data-height-lg="${component.heightLg}"</c:if>
         <c:if test="${not empty component.backgroundSizeXs}">data-background-size-xs="${component.backgroundSizeXs}"</c:if>
         <c:if test="${not empty component.backgroundSizeSm}">data-background-size-sm="${component.backgroundSizeSm}"</c:if>
         <c:if test="${not empty component.backgroundSizeMd}">data-background-size-md="${component.backgroundSizeMd}"</c:if>
         <c:if test="${not empty component.backgroundSizeLg}">data-background-size-lg="${component.backgroundSizeLg}"</c:if>
         <c:if test="${not empty component.backgroundPositionXs}">data-background-position-xs="${component.backgroundPositionXs}"</c:if>
         <c:if test="${not empty component.backgroundPositionSm}">data-background-position-sm="${component.backgroundPositionSm}"</c:if>
         <c:if test="${not empty component.backgroundPositionMd}">data-background-position-md="${component.backgroundPositionMd}"</c:if>
         <c:if test="${not empty component.backgroundPositionLg}">data-background-position-lg="${component.backgroundPositionLg}"</c:if>
         <c:if test="${not empty component.backgroundColorXs}">data-background-color-xs="${component.backgroundColorXs}"</c:if>
         <c:if test="${not empty component.backgroundColorSm}">data-background-color-sm="${component.backgroundColorSm}"</c:if>
         <c:if test="${not empty component.backgroundColorMd}">data-background-color-md="${component.backgroundColorMd}"</c:if>
         <c:if test="${not empty component.backgroundColorLg}">data-background-color-lg="${component.backgroundColorLg}"</c:if>
         <c:if test="${not empty component.overlayXs}">data-overlay-xs="${component.overlayXs}"</c:if>
         <c:if test="${not empty component.overlaySm}">data-overlay-sm="${component.overlaySm}"</c:if>
         <c:if test="${not empty component.overlayMd}">data-overlay-md="${component.overlayMd}"</c:if>
         <c:if test="${not empty component.overlayLg}">data-overlay-lg="${component.overlayLg}"</c:if>
         <c:if test="${not empty component.textColorXs}">data-text-color-xs="${component.textColorXs}"</c:if>
         <c:if test="${not empty component.textColorSm}">data-text-color-sm="${component.textColorSm}"</c:if>
         <c:if test="${not empty component.textColorMd}">data-text-color-md="${component.textColorMd}"</c:if>
         <c:if test="${not empty component.textColorLg}">data-text-color-lg="${component.textColorLg}"</c:if>
         <c:if test="${not empty component.flexDirectionXs}">data-flex-direction-xs="${component.flexDirectionXs}"</c:if>
         <c:if test="${not empty component.flexDirectionSm}">data-flex-direction-sm="${component.flexDirectionSm}"</c:if>
         <c:if test="${not empty component.flexDirectionMd}">data-flex-direction-md="${component.flexDirectionMd}"</c:if>
         <c:if test="${not empty component.flexDirectionLg}">data-flex-direction-lg="${component.flexDirectionLg}"</c:if>
         <c:if test="${not empty component.justifyContentXs}">data-justify-content-xs="${component.justifyContentXs}"</c:if>
         <c:if test="${not empty component.justifyContentSm}">data-justify-content-sm="${component.justifyContentSm}"</c:if>
         <c:if test="${not empty component.justifyContentMd}">data-justify-content-md="${component.justifyContentMd}"</c:if>
         <c:if test="${not empty component.justifyContentLg}">data-justify-content-lg="${component.justifyContentLg}"</c:if>
         <c:if test="${not empty component.alignItemsXs}">data-align-items-xs="${component.alignItemsXs}"</c:if>
         <c:if test="${not empty component.alignItemsSm}">data-align-items-sm="${component.alignItemsSm}"</c:if>
         <c:if test="${not empty component.alignItemsMd}">data-align-items-md="${component.alignItemsMd}"</c:if>
         <c:if test="${not empty component.alignItemsLg}">data-align-items-lg="${component.alignItemsLg}"</c:if>>
        <div class="tc-responsive-banner-overlay"></div>
        <div class="tc-responsive-banner-inner ${component.contentSpacing}" style="max-width: ${component.maxContentWidth}">
            <c:if test="${not empty component.titleXs}"><h3 class="title title-xs">${component.titleXs}</h3></c:if>
            <c:if test="${not empty component.titleSm}"><h3 class="title title-sm">${component.titleSm}</h3></c:if>
            <c:if test="${not empty component.titleMd}"><h3 class="title title-md">${component.titleMd}</h3></c:if>
            <c:if test="${not empty component.titleLg}"><h3 class="title title-lg">${component.titleLg}</h3></c:if>
            <c:if test="${not empty component.descriptionXs}"><div class="description description-xs">${component.descriptionXs}</div></c:if>
            <c:if test="${not empty component.descriptionSm}"><div class="description description-sm">${component.descriptionSm}</div></c:if>
            <c:if test="${not empty component.descriptionMd}"><div class="description description-md">${component.descriptionMd}</div></c:if>
            <c:if test="${not empty component.descriptionLg}"><div class="description description-lg">${component.descriptionLg}</div></c:if>

            <c:if test="${not empty component.actions}">
                <ul class="action-container">
                    <c:forEach items="${component.actions}" var="action" varStatus="idx">
                        <c:if test="${action.visible}">
                            <cms:component component="${action}"
                                           parentComponent="${component}"
                                           evaluateRestriction="true"
                                           element="li"/>
                        </c:if>
                    </c:forEach>
                </ul>
            </c:if>
        </div>
    </div>
</c:if>