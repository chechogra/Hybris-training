<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags" %>
<c:set var="symbolDefsPath" value="${contextPath}/_ui/addons/talosacceleratoraddon/responsive/common/images/symbol-defs.svg"/>

<c:set var="currentComponent" value="${component}"/>
<c:set var="navigationNode" value="${currentComponent.navigationNode}"/>

<c:if test="${currentComponent.visible}">
    <ul class="tc-mn-categories tc-collapsible-group">
        <c:forEach items="${navigationNode.children}" var="childLevel1" varStatus="categoryItemLoop">
            <li id="tc_mn_category_item_${categoryItemLoop.index}"
                class="tc-mn-category-item tc-collapsible-parent <c:if test="${not empty childLevel1.children}">tc-has-sub tc-collapsed</c:if>"  <c:if test="${not empty childLevel1.children}"> data-toggle="collapse" data-target="#tc_mn_category_sub_navigation_${categoryItemLoop.index}"</c:if>>
                <c:forEach items="${childLevel1.entries}" var="childlink1">
                    <cms:component component="${childlink1.item}" evaluateRestriction="true" element="span"
                                   data-collapse="#tc_mn_category_sub_navigation_${categoryItemLoop.index}"
                                   data-collapse-parent="#tc_mn_category_item_${categoryItemLoop.index}"
                                   class="tc-mn-category-link"/>
                </c:forEach>

                    <%-- Calculate how many sub columns are needed -- Start --%>
                <c:set var="totalSubNavigationColumns" value="${0}"/>
                <c:set var="hasSubChild" value="false"/>
                <c:forEach items="${childLevel1.children}" var="childLevel2">
                    <c:if test="${not empty childLevel2.children}">
                        <c:set var="hasSubChild" value="true"/>
                        <c:set var="subSectionColumns" value="${fn:length(childLevel2.children)/currentComponent.wrapAfter}"/>
                        <c:if test="${subSectionColumns > 1 && fn:length(childLevel2.children)%currentComponent.wrapAfter > 0}">
                            <c:set var="subSectionColumns" value="${subSectionColumns + 1}"/>
                        </c:if>
                        <c:choose>
                            <c:when test="${subSectionColumns > 1}">
                                <c:set var="totalSubNavigationColumns"
                                       value="${totalSubNavigationColumns + subSectionColumns}"/>
                            </c:when>

                            <c:when test="${subSectionColumns < 1}">
                                <c:set var="totalSubNavigationColumns" value="${totalSubNavigationColumns + 1}"/>
                            </c:when>
                        </c:choose>
                    </c:if>
                </c:forEach>
                    <%-- Calculate how many sub columns are needed -- End --%>


                <c:if test="${not empty childLevel1.children}">
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
                    <div id="tc_mn_category_sub_navigation_${categoryItemLoop.index}"
                         class="tc-mn-category-sub-navigation tc-collapsible-content collapse">
                        <div class="tc-header-separator"></div>
                        <div class="tc-mn-category-sub-navigation-wp">
                            <div class="tc-mn-category-sub-navigation-container">
                                <div class="tc-mn-category-sub-navigation-inner tc-categories-grid">
                                    <c:choose>
                                        <c:when test="${hasSubChild}">
                                            <c:forEach items="${childLevel1.children}" var="childLevel2">
                                                <div class="tc-mn-category-sub-navigation-section tc-categories-grid-item">
                                                <c:if test="${not empty childLevel2.title}">

                                                    <c:forEach items="${childLevel2.entries}" var="childlink2">
                                                        <cms:component component="${childlink2.item}" evaluateRestriction="true"
                                                                       element="span"
                                                                       class="tc-nav-link-secondary title"/>
                                                    </c:forEach>

                                                </c:if>
                                                <ul class="tc-mn-category-sub-navigation-list <c:if
                                                    test="${not empty childLevel2.title}">has-title</c:if>">
                                                <c:forEach items="${childLevel2.children}" var="childLevel3"
                                                           step="${currentComponent.wrapAfter}" varStatus="i">
                                                    <%-- wrap if more than 'component.wrapAfter' rows in one sub column --%>
                                                    <c:if test="${i.index>=currentComponent.wrapAfter}">
                                                        <c:if test="${!i.first}">
                                                            </ul>
                                                            </div>
                                                        </c:if>
                                                        <div class="tc-mn-category-sub-navigation-section tc-categories-grid-item">
                                                        <ul class="tc-mn-category-sub-navigation-list <c:if
                                                            test="${not empty childLevel2.title}">has-title</c:if>">
                                                    </c:if>
                                                    <c:forEach items="${childLevel2.children}" var="childLevel3"
                                                               begin="${i.index}"
                                                               end="${i.index + currentComponent.wrapAfter - 1}">
                                                        <c:forEach items="${childLevel3.entries}" var="childlink3">
                                                            <cms:component component="${childlink3.item}"
                                                                           evaluateRestriction="true" element="li"
                                                                           class="tc-nav-link-secondary"/>
                                                        </c:forEach>
                                                    </c:forEach>
                                                </c:forEach>
                                                </ul>
                                                </div>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="tc-mn-category-sub-navigation-section tc-categories-grid-item">
                                                <ul class="tc-mn-category-sub-navigation-list <c:if test="${not empty childLevel2.title}">has-title</c:if>">
                                                    <c:forEach items="${childLevel1.children}" var="childLevel2">
                                                        <c:forEach items="${childLevel2.entries}" var="childlink2">
                                                            <cms:component component="${childlink2.item}"
                                                                           evaluateRestriction="true" element="li"
                                                                           class="tc-nav-link-secondary"/>
                                                        </c:forEach>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>

                            <c:if test="${not empty childLevel1.banner}">
                                <div class="tc-category-image-wp">
                                    <cms:component component="${childLevel1.banner}"
                                                   evaluateRestriction="true"/>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </c:if>
            </li>
        </c:forEach>
    </ul>
    <div class="magic-line"></div>
</c:if>
