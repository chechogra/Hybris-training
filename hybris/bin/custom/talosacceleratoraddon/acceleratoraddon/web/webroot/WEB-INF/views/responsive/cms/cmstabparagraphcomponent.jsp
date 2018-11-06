<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="symbolDefsPath" value="${contextPath}/_ui/addons/talosacceleratoraddon/responsive/common/images/symbol-defs.svg"/>
<li class="tc-collapsible-parent">
    <a href="javascript:void(0)" class="tc-collapse-trigger collapsed" data-toggle="collapse"
       data-target="#tc_${component.uid}_collapsible">

        ${fn:escapeXml(component.title)}

        <svg version="1.1" xmlns="http://www.w3.org/2000/svg" x="0px"
             y="0px" width="15px" class="icon-plus"
             height="15px" viewBox="0 0 15 15" enable-background="new 0 0 15 15">
            <g id="Layer_1">
                <rect x="7" width="1" height="15"/>
            </g>
            <g id="Layer_2">
                <rect y="7" width="15" height="1"/>
            </g>
        </svg>
    </a>

    <div class="tc-collapsible-content collapse tc-tab-content-${component.uid}" id="tc_${component.uid}_collapsible">
        <div class="tc-collapsible-content-inner">
            ${ycommerce:sanitizeHTML(component.content)}
        </div>
    </div>
</li>
