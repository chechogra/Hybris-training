<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ attribute name="product" required="true" type="de.hybris.platform.commercefacades.product.data.ProductData" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="formElement" tagdir="/WEB-INF/tags/addons/talosacceleratoraddon/responsive/formElement" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<spring:htmlEscape defaultHtmlEscape="true"/>

<c:set var="symbolDefsPath" value="${contextPath}/_ui/addons/talosacceleratoraddon/responsive/common/images/symbol-defs.svg"/>

<c:url value="${product.url}/reviewhtml/3" var="getPageOfReviewsUrl"/>
<c:url value="${product.url}/reviewhtml/all" var="getAllReviewsUrl"/>
<c:url value="${product.url}/review" var="productReviewActionUrl"/>

<div class="tab-review">
    <div class="review-pagination-bar">
        <div class="right">
            <button class="btn btn-default all-reviews-btn"><spring:theme code="review.show.all"/></button>
            <button class="btn btn-default less-reviews-btn"><spring:theme code="review.show.less"/></button>
        </div>

        <button class="btn btn-primary js-review-write-toggle "><spring:theme code="review.write.title"/></button>
    </div>

    <div class="write-review js-review-write">
        <form:form method="post" action="${productReviewActionUrl}" commandName="reviewForm">
            <div class="form-group tab-review-card">
                <formElement:formInputBox idKey="review.headline" labelKey="review.headline" path="headline"
                                          inputCSS="form-control" mandatory="true"/>
            </div>

            <div class="form-group tab-review-card">
                <formElement:formInputBox idKey="alias" labelKey="review.alias" path="alias" inputCSS="form-control"
                                          mandatory="false"/>

            </div>


            <div class="form-group tab-review-card">
                <formElement:formTextArea idKey="review.comment" labelKey="review.comment" path="comment"
                                          areaCSS="form-control"
                                          rows="6"
                                          mandatory="true"/>
            </div>

            <div class="tab-review-card">
                <div class="form-group ">

                    <label class="tab-review-rating-lbl"><spring:theme code="review.rating"/></label>


                    <div class="rating rating-set js-ratingCalcSet">
                        <div class="rating-stars js-writeReviewStars">
                            <c:forEach begin="1" end="10" varStatus="loop">
                            <span class="js-ratingIcon glyphicon glyphicon-star ${loop.index % 2 == 0 ? 'lh' : 'fh'}">
                                <svg class="icon icon-star">
                                    <use xlink:href="${symbolDefsPath}#icon-star"></use>
                                </svg>
                            </span>
                            </c:forEach>
                        </div>
                    </div>

                    <formElement:formInputBox idKey="review.rating" labelKey="review.rating" path="rating"
                                              inputCSS="sr-only js-ratingSetInput" labelCSS="sr-only" mandatory="true"/>

                </div>

                <button type="submit" class="btn btn-primary btn-block" value="<spring:theme code="review.submit"/>"><spring:theme
                        code="review.submit"/></button>

            </div>
        </form:form>

    </div>

    <ul id="reviews" class="review-list" data-reviews="${getPageOfReviewsUrl}" data-allreviews="${getAllReviewsUrl}"></ul>

    <div class="review-pagination-bar">

        <div class="right">
            <button class="btn btn-default all-reviews-btn"><spring:theme code="review.show.all"/></button>
            <button class="btn btn-default less-reviews-btn"><spring:theme code="review.show.less"/></button>
        </div>
    </div>
</div>
