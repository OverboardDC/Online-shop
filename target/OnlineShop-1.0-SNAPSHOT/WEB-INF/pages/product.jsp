<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en" xml:lang="en"
      xmlns:fb="http://www.facebook.com/2008/fbml">
<head>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/stylesheet/960.css"/>" media="all"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/stylesheet/screen.css"/>" media="screen"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/stylesheet/color.css"/>" media="screen"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/stylesheet/prettyPhoto.css"/>" media="all"/>
    <!--[if lt IE 9]>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/stylesheet/ie.css"/>" media="screen" />
    <![endif]-->

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.11/jquery-ui.min.js"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/jquery/jquery.prettyPhoto.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/shoppica.js"/>"></script>


    <script type="text/javascript">

        $(document).ready(function () {

            $(".s_tabs").tabs({fx: {opacity: 'toggle', duration: 300}});

            $("#product_images a[rel^='prettyPhoto'], #product_gallery a[rel^='prettyPhoto']").prettyPhoto({
                theme: 'light_square',
                opacity: 0.5
            });

        });

    </script>

</head>

<body class="s_layout_fixed">

<div id="wrapper">

    <%@include file="../templates/header.jsp" %>


    <!-- ********************** -->
    <!-- I N T R O -->
    <!-- ********************** -->

    <div id="intro">
        <div id="intro_wrap">
            <div class="container_12">
                <div id="breadcrumbs" class="grid_12">
                    <a href="<c:url value="/"/>">Home</a>
                    &gt;
                    <a href="<c:url value="/category/${product.category.id}"/>">${product.category.name}</a>
                </div>
                <h1>${product.brand.name} ${product.name}</h1>
            </div>
        </div>
    </div>
    <!-- end of intro -->


    <!-- ********************** -->
    <!-- C O N T E N T -->
    <!-- ********************** -->
    <div id="content" class="product_view container_16">

        <div id="product" class="grid_12">
            <div id="product_images" class="grid_6 alpha">
                <a id="product_image_preview" rel="prettyPhoto[gallery]"
                   href="${pageContext.request.contextPath}/image/showImage?index=${product.id}"><img id="image"
                                                                                                      height="280"
                                                                                                      width="340"
                                                                                                      src="${pageContext.request.contextPath}/image/showImage?index=${product.id}"
                                                                                                      title="${product.name}"
                                                                                                      alt="${product.name}"/></a>
            </div>
            <div id="product_info" class="grid_6 omega">
                <c:if test="${!product.discount}">
                    <p class="s_price"><span class="s_currency s_before">$</span>${product.price}</p>
                </c:if>
                <c:if test="${product.discount}">
                    <p class="s_price s_promo_price"><span class="s_old_price"><span
                            class="s_currency s_before">$</span>${product.oldPrice}</span><span
                            class="s_currency s_before">$</span>${product.price}</p>
                </c:if>
                <dl class="clearfix">
                    <dt>Availability</dt>
                    <c:if test="${product.amount > 0}">
                        <dd>In Stock</dd>
                    </c:if>
                    <c:if test="${product.amount == 0}">
                        <dd>Is not avaliable</dd>
                    </c:if>
                    <dt>Model</dt>
                    <dd>${product.name}</dd>
                    <dt>Manufacturer</dt>
                    <dd><a href="#">${product.brand.name}</a></dd>
                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                        <dt>Amount</dt>
                        <dd>${product.amount}</dd>
                        <dt>Selled</dt>
                        <dd>${product.selled}</dd>
                    </sec:authorize>
                </dl>
                <div id="product_share" class="clearfix">
                    <!-- AddThis Button BEGIN -->
                    <div class="addthis_toolbox addthis_default_style ">
                        <a class="addthis_button_facebook_like" fb:like:layout="button_count"></a>
                        <a class="addthis_button_tweet"></a>
                        <a class="addthis_counter addthis_pill_style"></a>
                    </div>
                    <script type="text/javascript"
                            src="http://s7.addthis.com/js/250/addthis_widget.js#pubid=xa-4de0eff004042e7a"></script>
                    <!-- AddThis Button END -->
                </div>
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <div class="adminPanel">
                        <c:url value="/admin/editProduct/${product.id}" var="editProduct"/>
                        <a href="${editProduct}">Edit</a>
                        <c:url value="/admin/removeProduct/${product.id}" var="removeProduct"/>
                        <a href="${removeProduct}">Remove</a>
                    </div>
                </sec:authorize>

                <c:if test="${product.amount > 0}">
                    <div id="product_buy" class="clearfix">

                        <c:if test="${product.carts.size()==0}">
                            <spring:url var="addToCart" value="/addToCart/${product.id}"/>
                            <a id="add_to_cart" class="s_main_color_bgr" href="${addToCart}"><span class="s_text"><span
                                    class="s_icon"></span> Add to Cart</span></a>
                        </c:if>
                        <c:if test="${product.carts.size()!=0}">
                        <span class="s_text"><span
                                class="s_icon"></span>Product in cart</span>
                        </c:if>
                    </div>
                </c:if>

            </div>
            <div class="clear"></div>
            <div class="s_tabs grid_12 alpha omega">
                <ul class="s_tabs_nav clearfix">
                    <li><a href="#product_description">Description</a></li>
                    <li><a href="#product_reviews">Reviews ${product.commentaries.size()}</a></li>
                    <li><a href="#product_gallery">Photos ${product.images.size()}</a></li>
                </ul>
                <div class="s_tab_box">

                    <div id="product_description">
                        <div class="cpt_product_description ">
                            ${product.description}
                        </div>
                        <!-- cpt_container_end -->
                    </div>
                    <div id="product_reviews" class="s_listing">
                        <c:forEach items="${product.commentaries}" var="commentary">
                            <div class="s_review last">
                                <p class="s_author"><strong>${commentary.user.username}</strong>
                                    <small>${commentary.date}</small>
                                </p>
                                <c:if test="${commentary.user.username == pageContext.request.userPrincipal.name
                                 || pageContext.request.isUserInRole('ROLE_ADMIN')}">
                                    <a style="padding-left: 40px;"
                                       href="<c:url value="/removeCommentary/${commentary.id}"/>">Remove</a>
                                </c:if>
                                <div class="clear"></div>
                                <p>${commentary.commentary}</p>

                            </div>
                        </c:forEach>
                        <div class="pagination">
                            <div class="results">Showing 1 to 1 of 1 (1 Pages)</div>
                        </div>
                        <sec:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
                            <c:url value="/addCommentary" var="addCommentary"/>
                            <form:form modelAttribute="commentary" action="${addCommentary}" method="post">
                                <h2 class="s_title_1"><span class="s_main_color">Write</span> Review</h2>
                                <div id="review_title" class="clear"></div>
                                <div class="s_row_3 clearfix">
                                    <label><strong>Your Review:</strong></label>
                                    <form:textarea path="commentary" style="width: 98%;" rows="8"/>
                                </div>
                                <input type="hidden" name="username" value="${pageContext.request.userPrincipal.name}"/>
                                <input type="hidden" name="product_id" value="${product.id}"/>
                                <span class="clear border_ddd"></span>
                                <button type="submit" class="s_button_1 s_main_color_bgr"><span
                                        class="s_text">Continue</span></button>
                                <span
                                        class="clear"></span>
                            </form:form>
                        </sec:authorize>
                    </div>

                    <div id="product_gallery">
                        <ul class="s_thumbs clearfix">
                            <c:forEach items="${product.images}" var="image">
                                <li><a class="s_thumb"
                                       href="${pageContext.request.contextPath}/image/showOtherImage?index=${image.id}"
                                       title="${product.name}"
                                       rel="prettyPhoto[gallery]"><img
                                        src="${pageContext.request.contextPath}/image/showOtherImage?index=${image.id}"
                                        width="120"
                                        title="${product.name}" alt="${product.name}"/></a>
                                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                                        <c:url value="/admin/removeImage/${image.id}?product_id=${product.id}"
                                               var="removeImage"/>
                                        <a href="${removeImage}">Remove</a>
                                    </sec:authorize>
                                </li>
                            </c:forEach>

                        </ul>
                        <c:url value="/admin/addImage" var="addImage"/>
                        <sec:authorize access="hasRole('ROLE_ADMIN')">
                            <div>
                                <form:form cssClass="clearfix"
                                           action="${addImage}?${_csrf.parameterName}=${_csrf.token}"
                                           modelAttribute="image" enctype="multipart/form-data" method="post">
                                    <label>Add new image: </label>
                                    <form:input type="file" path="file" enctype="multipart/form-data"/>
                                    <input type="hidden" name="product_id" value="${product.id}"/>
                                    <input type="submit" value="Submit">
                                </form:form>
                            </div>
                        </sec:authorize>
                    </div>
                </div>
            </div>


        </div>

    </div>
    <!-- end of content -->
    <%@include file="../templates/rightMenu.jsp" %>

    <%@include file="../templates/footer.jsp" %>

</div>

<div id="fb-root"></div>
<script>
    window.fbAsyncInit = function () {
        FB.init({
            appId: '0c18007de6f00f7ecda8c040fb76cd90', status: true, cookie: true,
            xfbml: true
        });
    };
    (function () {
        var e = document.createElement('script');
        e.async = true;
        e.src = document.location.protocol +
            '//connect.facebook.net/en_US/all.js';
        document.getElementById('fb-root').appendChild(e);
    }());
</script>

</body>
</html>
