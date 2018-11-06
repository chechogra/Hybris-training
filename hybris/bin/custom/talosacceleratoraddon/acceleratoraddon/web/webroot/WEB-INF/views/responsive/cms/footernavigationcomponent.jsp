<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags" %>
<%@ taglib prefix="footer" tagdir="/WEB-INF/tags/responsive/common/footer" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="symbolDefsPath" value="${contextPath}/_ui/addons/talosacceleratoraddon/responsive/common/images/symbol-defs.svg"/>
<c:set var="optInComponent" value="${component.optInComponent}"/>
<c:set var="socialCollectionComponent" value="${component.socialCollectionComponent}"/>
<c:set var="navigationNode" value="${component.navigationNode}"/>
<c:set var="notice" value="${component.notice}"/>

<c:if test="${component.visible}">
    <div class="tc-footer-nav-wp">
        <div class="container-fluid tc-container">
            <div class="tc-footer-nav-inner">
                <span class="tc-back-to-top">
                    <svg class="icon icon-chevron-up">
                        <use xlink:href="${symbolDefsPath}#icon-chevron-up"></use>
                    </svg>
                </span>
                <div class="row">
                    <div class="col-xs-12 col-md-4 col-md-push-8">
                        <cms:component component="${optInComponent}"/>
                        <cms:component component="${socialCollectionComponent}"/>
                    </div>
                    <div class="tc-footer-nodes-wp col-xs-12 col-md-8 col-md-pull-4">
                        <div class="row tc-collapsible-group">
                            <c:forEach items="${navigationNode.children}" var="childLevel1" varStatus="itemLoop">
                                <div class="col-xs-12 col-md-3 tc-collapsible-parent tc-collapsed">
                                    <div class="tc-footer-node">
                                        <a class="tc-footer-node-title tc-collapse-trigger" data-toggle="collapse"
                                           data-target="#tc_footer_node${itemLoop.index}">
                                                ${fn:escapeXml(childLevel1.title)}
                                            <svg version="1.1" xmlns="http://www.w3.org/2000/svg" x="0px"
                                                 y="0px" width="15px" class="icon-plus"
                                                 height="15px" viewBox="0 0 15 15"
                                                 enable-background="new 0 0 15 15">
                                                <g id="Layer_1">
                                                    <rect x="7" width="1" height="15"/>
                                                </g>
                                                <g id="Layer_2">
                                                    <rect y="7" width="15" height="1"/>
                                                </g>
                                            </svg>
                                        </a>
                                        <div class="tc-footer-node-links-wp tc-collapsible-content collapse"
                                             id="tc_footer_node${itemLoop.index}">
                                            <ul class="tc-footer-node-links">
                                                <c:forEach items="${childLevel1.children}" var="childLevel2">
                                                    <c:forEach items="${childLevel2.entries}" var="childlink">
                                                        <cms:component component="${childlink.item}"
                                                                       evaluateRestriction="true"
                                                                       element="li" class="footer__link"/>
                                                    </c:forEach>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="tc-footer-copyright">
            <div class="container">${fn:escapeXml(notice)}</div>
        </div>
    </div>
</c:if>
