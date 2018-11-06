<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ attribute name="pageData" required="true" type="de.hybris.platform.commerceservices.search.facetdata.FacetSearchPageData" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags/addons/talosacceleratoraddon/responsive/nav" %>

<div class="tc-facet-nav-refinements">
	<c:forEach items="${pageData.facets}" var="facet" varStatus="status">
		<c:choose>
			<c:when test="${facet.code eq 'availableInStores'}">
				<nav:facetNavRefinementStoresFacet facetData="${facet}" userLocation="${userLocation}"/>
			</c:when>
			<c:when test="${facet.code eq 'swatchColors'}">
				<nav:facetNavRefinementSwatchColorsFacet facetData="${facet}" index="${status.index}"/>
			</c:when>
			<c:otherwise>
				<nav:facetNavRefinementFacet facetData="${facet}" index="${status.index}"/>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</div>
