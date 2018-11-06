<%@ taglib prefix="nav" tagdir="/WEB-INF/tags/addons/talosacceleratoraddon/responsive/nav" %>

<div id="tc-product-facet-wp" class="hidden-xs hidden-sm">
    <nav:facetNavAppliedFilters pageData="${searchPageData}"/>
    <div id="product-facet" class="product__facet js-product-facet">
        <nav:facetNavRefinements pageData="${searchPageData}"/>
    </div>
</div>