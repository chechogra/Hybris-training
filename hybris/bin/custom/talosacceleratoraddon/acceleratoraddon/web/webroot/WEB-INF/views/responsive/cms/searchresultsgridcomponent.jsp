<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags/responsive/nav" %>
<%@ taglib prefix="tc-nav" tagdir="/WEB-INF/tags/addons/talosacceleratoraddon/responsive/nav" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/addons/talosacceleratoraddon/responsive/product" %>

<c:set var="currentComponent" value="${component}"/>

<div class="product__list--wrapper">
    <div class="tc-product-grid-wp">
        <div class="results">
            <h1><spring:theme code="search.page.searchText" arguments="${searchPageData.freeTextSearch}"/></h1>
        </div>

        <nav:searchSpellingSuggestion spellingSuggestion="${searchPageData.spellingSuggestion}"/>

        <tc-nav:pagination top="true" supportShowPaged="${isShowPageAllowed}" supportShowAll="${isShowAllAllowed}"
                           searchPageData="${searchPageData}" searchUrl="${searchPageData.currentQuery.url}"
                           numberPagesShown="${numberPagesShown}"/>

        <div class="product__listing product__grid">
            <c:forEach items="${searchPageData.results}" var="product" varStatus="status">
                <product:productListerGridItem product="${product}" currentComponent="${currentComponent}"/>
            </c:forEach>
        </div>

        <div id="addToCartTitle" class="display-none">
            <div class="add-to-cart-header">
                <div class="headline">
                    <span class="headline-text"><spring:theme code="basket.added.to.basket"/></span>
                </div>
            </div>
        </div>

        <tc-nav:pagination top="false" supportShowPaged="${isShowPageAllowed}" supportShowAll="${isShowAllAllowed}"
                           searchPageData="${searchPageData}" searchUrl="${searchPageData.currentQuery.url}"
                           numberPagesShown="${numberPagesShown}"/>
    </div>
</div>
