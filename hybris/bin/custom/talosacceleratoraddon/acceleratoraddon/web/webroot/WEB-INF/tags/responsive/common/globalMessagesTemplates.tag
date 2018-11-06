<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>

<c:set var="symbolDefsPath" value="${contextPath}/_ui/addons/talosacceleratoraddon/responsive/common/images/symbol-defs.svg"/>

<script id="global-alert-info-template" type="text/x-jquery-tmpl">
    <div class="alert alert-info alert-dismissable">
        <div class="tc-global-message-wp info container tc-container">
            \${message}
            <button class="close" aria-hidden="true" data-dismiss="alert" type="button">
                <svg class="icon icon-close">
                    <use xmlns:xlink="http://www.w3.org/1999/xlink"
                        xlink:href="${symbolDefsPath}#icon-close">
                    </use>
                </svg>
            </button>
        </div>
    </div>
</script>

<script id="global-alert-warning-template" type="text/x-jquery-tmpl">
    <div class="alert alert-warning alert-dismissable">
        <div class="tc-global-message-wp warning container tc-container">
            \${message}
            <button class="close" aria-hidden="true" data-dismiss="alert" type="button">
                <svg class="icon icon-close">
                    <use xmlns:xlink="http://www.w3.org/1999/xlink"
                        xlink:href="${symbolDefsPath}#icon-close">
                    </use>
                </svg>
            </button>
        </div>
    </div>
</script>

<script id="global-alert-danger-template" type="text/x-jquery-tmpl">
        <div class="alert alert-danger alert-dismissable">
            <div class="tc-global-message-wp danger container tc-container">
            \${message}
            <button class="close" aria-hidden="true" data-dismiss="alert" type="button">
                <svg class="icon icon-close">
                                <use xmlns:xlink="http://www.w3.org/1999/xlink"
                                     xlink:href="${symbolDefsPath}#icon-close"></use>
                </svg>
            </button>
        </div>
    </div>
</script>
