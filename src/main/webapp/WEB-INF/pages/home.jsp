<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en" xml:lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="description" content="My Store"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/stylesheet/960.css"
          media="all"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/stylesheet/screen.css"
          media="screen"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/stylesheet/color.css"
          media="screen"/>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/stylesheet/ie.css"
          media="screen"/>


    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.11/jquery-ui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/shoppica.js"></script>
</head>
<body class="s_layout_fixed">
<div id="wrapper">


    <%@include file="../templates/header.jsp" %>
    <!-- ********************** -->
    <!--     I N T R O          -->
    <!-- ********************** -->
    <div id="intro">
        <div id="intro_wrap">
            <div id="product_intro" class="container_12">
                <div id="product_intro_info" class="grid_5">
                    <c:forEach items="${specialProducts}" var="specialProduct" >
                        <c:if test="${specialProducts.indexOf(specialProduct) ==0 }">
                        <div style="position: relative;">
                        </c:if>
                            <c:if test="${specialProducts.indexOf(specialProduct) != 0}">
                            <div style="position: relative; display: none">
                                </c:if>
                                <h2>
                                <a href="<c:url value="/product/${specialProduct.product.id}"/>">${specialProduct.product.brand.name} ${specialProduct.product.name}</a>
                            </h2>
                            <div class="s_price_holder">
                                <c:if test="${!specialProduct.product.discount}">
                                    <p class="s_price"><span class="s_currency s_before">$</span>${specialProduct.product.price}</p>
                                </c:if>
                                <c:if test="${specialProduct.product.discount}">
                                    <p class="s_price s_promo_price"><span class="s_old_price"><span
                                            class="s_currency s_before">$</span>${specialProduct.product.oldPrice}</span><span
                                            class="s_currency s_before">$</span>${specialProduct.product.price}</p>
                                </c:if>
                            </div>
                            <p class="s_desc">${specialProduct.product.description} </p>
                        </div>
                    </c:forEach>
                </div>
                <div id="product_intro_preview">
                    <div class="slides_container">
                        <c:forEach items="${specialProducts}" var="specialProduct">
                            <div class="slideItem" style="display: none"><a
                                    href="<c:url value="/product/${specialProduct.product.id}"/>"><img
                                    width="300"
                                    height="250"
                                    src="${pageContext.request.contextPath}/image/showImage?index=${specialProduct.product.id}"
                                    alt="${specialProduct.product.name}"/></a></div>
                        </c:forEach>
                    </div>
                    <a class="s_button_prev" href="javascript:"></a>
                    <a class="s_button_next" href="javascript:"></a>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/resources/js/jquery/jquery.slides.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/resources/js/shoppica.products_slide.js"></script>
    <!-- end of intro -->

    <!-- ********************** -->
    <!--      C O N T E N T     -->
    <!-- ********************** -->
    <div id="content" class="container_12">

        <div id="welcome" class="grid_12">
            <h2>Welcome to Shoppica store</h2>
            <p><a href="">Shoppica</a> is a stylish premium OpenCart theme (currently supported versions are
                1.4.9.3/1.4.9.4). The clean and modern design allows you to use the theme for every kind of online shop:
                clothes, accessories, gifts, electronics, furniture, health and cosmetics store and so on.</p>
            <p> One of the main features is to choose different types of slideshows for every category, so you can
                personalise every part of your store. Shoppica allows you to customize product listing size, column
                position and layout type, giving you the power to easy adapt the theme to your produc or service. With
                the color themer tool you can change site&#39;s elements and make your store unique and stand out of the
                crowd.</p>
        </div>

        <div class="clear"></div>

        <div id="special_home" class="grid_12">
            <h2 class="s_title_1"><span class="s_main_color">Specials</span> Products</h2>
            <div class="clear"></div>
            <div class="s_listing s_grid_view clearfix">
                <c:forEach items="${specialProducts}" var="specialProduct">
                    <div class="s_item grid_2"><a class="s_thumb"
                                                  href="<c:url value="/product/${specialProduct.product.id}"/>"><img
                            src="${pageContext.request.contextPath}/image/showImage?index=${specialProduct.product.id}"
                            title="${specialProduct.product.name}" alt="${specialProduct.product.name}"/></a>
                        <h3>
                            <a href="<c:url value="/product/${specialProduct.product.id}"/>">${specialProduct.product.brand.name} ${specialProduct.product.name}</a>
                        </h3>
                        <p class="s_model">Product ${specialProduct.product.id}</p>
                        <p class="s_price s_promo_price"><span class="s_old_price"><span
                                class="s_currency s_before">$</span>${specialProduct.product.oldPrice}</span><span
                                class="s_currency s_before">$</span>${specialProduct.product.price}</p>
                        <spring:url var="addToCart" value="/addToCart/${specialProduct.product.id}"/>
                        <c:if test="${specialProduct.product.carts.size()==0}">
                            <a class="s_button_add_to_cart" href="${addToCart}"><span class="s_icon_16"><span
                                    class="s_icon"></span>Add to Cart</span></a>
                        </c:if>
                        <c:if test="${specialProduct.product.carts.size()!=0}">
                                    <span class="s_icon_16"><span
                                            class="s_icon"></span>In the cart</span>
                        </c:if>
                    </div>
                </c:forEach>
                <div class="clear"></div>
            </div>
        </div>

        <div id="latest_home" class="grid_12">
            <h2 class="s_title_1"><span class="s_main_color">Latest</span> Products</h2>
            <div class="clear"></div>
            <div class="s_listing s_grid_view clearfix">
                <c:forEach items="${latestProducts}" var="latestProduct">
                    <div class="s_item grid_2"><a class="s_thumb"
                                                  href="<c:url value="/product/${latestProduct.id}"/>"><img
                            src="${pageContext.request.contextPath}/image/showImage?index=${latestProduct.id}"
                            title="${latestProduct.name}" alt="${latestProduct.name}"/></a>
                        <h3>
                            <a href="<c:url value="/product/${latestProduct.id}"/>">${latestProduct.brand.name} ${latestProduct.name}</a>
                        </h3>
                        <p class="s_model">Product ${latestProduct.id}</p>
                        <c:if test="${!latestProduct.discount}">
                            <p class="s_price"><span class="s_currency s_before">$</span>${latestProduct.price}</p>
                        </c:if>
                        <c:if test="${latestProduct.discount}">
                            <p class="s_price s_promo_price"><span class="s_old_price"><span
                                    class="s_currency s_before">$</span>${latestProduct.oldPrice}</span><span
                                    class="s_currency s_before">$</span>${latestProduct.price}</p>
                        </c:if>
                        <spring:url var="addToCart" value="/addToCart/${latestProduct.id}"/>
                        <c:if test="${latestProduct.carts.size()==0}">
                            <a class="s_button_add_to_cart" href="${addToCart}"><span class="s_icon_16"><span
                                    class="s_icon"></span>Add to Cart</span></a>
                        </c:if>
                        <c:if test="${latestProduct.carts.size()!=0}">
                                    <span class="s_icon_16"><span
                                            class="s_icon"></span>In the cart</span>
                        </c:if>
                    </div>
                </c:forEach>
                <div class="clear"></div>
            </div>
        </div>

    </div>
    <!-- end of content -->

    <%@include file="../templates/footer.jsp" %>

</div>
<div id="fb-root"></div>
<script type="text/javascript">
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