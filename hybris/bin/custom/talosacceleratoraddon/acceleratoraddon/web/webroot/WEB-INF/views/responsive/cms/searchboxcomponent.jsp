<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<spring:htmlEscape defaultHtmlEscape="true"/>

<c:set var="symbolDefsPath" value="${contextPath}/_ui/addons/talosacceleratoraddon/responsive/common/images/symbol-defs.svg"/>

<c:url value="/search/" var="searchUrl"/>
<spring:url value="/search/autocomplete/{/componentuid}" var="autocompleteUrl" htmlEscape="false">
    <spring:param name="componentuid" value="${component.uid}"/>
</spring:url>

<div class="tc-searchbox-content ui-front">
    <form name="search_form_${fn:escapeXml(component.uid)}" method="get" action="${searchUrl}">
        <div class="tc-search-input-group">
            <spring:theme code="search.placeholder" var="searchPlaceholder"/>

            <svg class="icon icon-search searchbox-item">
                <use xlink:href="${symbolDefsPath}#icon-search"></use>
            </svg>

            <input type="text" id="js-site-search-input"
                   class="tc-search-input js-site-search-input searchbox-item" name="text" value=""
                   maxlength="100" placeholder="${searchPlaceholder}"
                   data-options='{"autocompleteUrl" : "${autocompleteUrl}","minCharactersBeforeRequest" : "${component.minCharactersBeforeRequest}","waitTimeBeforeRequest" : "${component.waitTimeBeforeRequest}","displayProductImages" : ${component.displayProductImages}}'>
            <div class="search-close-btn">
                <svg class="icon icon-close">
                    <use xlink:href="${symbolDefsPath}#icon-close"></use>
                </svg>
            </div>
        </div>
    </form>
</div>


<%--<div class="ui-front">
    <form name="search_form_${fn:escapeXml(component.uid)}" method="get"
          action="${searchUrl}">
        <div class="input-group">
            <spring:theme code="search.placeholder" var="searchPlaceholder"/>

            <ycommerce:testId code="header_search_input">
                <input type="text" id="js-site-search-input"
                       class="form-control js-site-search-input" name="text" value=""
                       maxlength="100" placeholder="${searchPlaceholder}"
                       data-options='{"autocompleteUrl" : "${autocompleteUrl}","minCharactersBeforeRequest" : "${component.minCharactersBeforeRequest}","waitTimeBeforeRequest" : "${component.waitTimeBeforeRequest}","displayProductImages" : ${component.displayProductImages}}'>
            </ycommerce:testId>

            <span class="input-group-btn"> <ycommerce:testId code="header_search_button">
					<button class="btn btn-link js_search_button" type="submit" disabled="true">
						<span class="glyphicon glyphicon-search"></span>
					</button>
            </ycommerce:testId>
			</span>
        </div>
    </form>

</div>--%>
