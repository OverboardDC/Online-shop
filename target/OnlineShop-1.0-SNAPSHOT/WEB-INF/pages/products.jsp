<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fom" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="description" content="My Store"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/stylesheet/960.css"/>"
          media="all"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/stylesheet/screen.css"/>"
          media="screen"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/stylesheet/color.css"/>"
          media="screen"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/stylesheet/ie.css"/>"
          media="screen"/>
    <![endif]-->

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.11/jquery-ui.min.js"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/shoppica.js"/>"></script>

</head>

<body class="s_layout_fixed">
<div id="wrapper">
    <%@include file="../templates/header.jsp" %>
    <!-- ********************** -->
    <!--     I N T R O          -->
    <!-- ********************** -->

    <div id="intro">
        <div id="intro_wrap">
            <div class="container_12">
                <div id="breadcrumbs" class="grid_12">
                    <a href=<c:url value="/"/>>Home</a>
                    &gt;
                </div>
                <h1>${category.name}</h1>

            </div>
        </div>
    </div>
    <!-- end of intro -->


    <!-- ********************** -->
    <!--      C O N T E N T     -->
    <!-- ********************** -->
    <div id="content" class="container_12">


        <div id="category" class="grid_9">

            <div class="s_subcategories s_grid_view s_listing clearfix">
                <div class="s_subcategory"><a href=""><img
                        src="${pageContext.request.contextPath}/resources/images/category_100x100.jpg"
                        title="Digital Cameras" alt="Digital Cameras" style="margin-bottom: 3px;"/></a> <a href="">Digital
                    Cameras</a></div>
                <div class="s_subcategory"><a href=""><img
                        src="${pageContext.request.contextPath}/resources/images/category_100x100.jpg"
                        title="Home Audio"
                        alt="Home Audio" style="margin-bottom: 3px;"/></a> <a href="">Home Audio</a></div>
                <div class="s_subcategory"><a href=""><img
                        src="${pageContext.request.contextPath}/resources/images/category_100x100.jpg"
                        title="Home Cinema"
                        alt="Home Cinema" style="margin-bottom: 3px;"/></a> <a href="">Home Cinema</a></div>
                <div class="s_subcategory"><a href=""><img
                        src="${pageContext.request.contextPath}/resources/images/category_100x100.jpg"
                        title="Cell Phones"
                        alt="Cell Phones" style="margin-bottom: 3px;"/></a> <a href="">Cell Phones</a></div>
                <div class="s_subcategory"><a href=""><img
                        src="${pageContext.request.contextPath}/resources/images/category_100x100.jpg"
                        title="MP3 Players"
                        alt="MP3 Players" style="margin-bottom: 3px;"/></a> <a href="">MP3 Players</a></div>
                <div class="s_subcategory"><a href=""><img
                        src="${pageContext.request.contextPath}/resources/images/category_100x100.jpg" title="Car-Audio"
                        alt="Car-Audio" style="margin-bottom: 3px;"/></a> <a href="">Car-Audio</a></div>
                <div class="clear"></div>
            </div>

            <div id="listing_options">
                <div id="listing_sort" class="s_switcher">
                    <span class="s_selected">Default</span>
                    <ul class="s_options" style="display: none;">
                        <li><a href="<spring:url value="?sort=brand.name&isAsc=true"/>">Name A - Z</a></li>
                        <li><a href="<spring:url value="?sort=brand.name&isAsc=false"/>">Name Z - A</a></li>
                        <li><a href="<spring:url value="?sort=price&isAsc=true"/>">Price Low &gt; High</a></li>
                        <li><a href="<spring:url value="?sort=price&isAsc=false"/>">Price High &gt; Low</a></li>
                        <li><a href="<spring:url value="?sort=name&isAsc=true"/>">Model A - Z</a></li>
                        <li><a href="<spring:url value="?sort=name&isAsc=false"/>">Model Z - A</a></li>
                    </ul>
                </div>
                <div id="view_mode" class="s_nav">
                    <ul class="clearfix">
                        <li id="view_grid"><a href="listing_2.html"><span class="s_icon"></span>Grid</a></li>
                        <li id="view_list" class="s_selected"><a href="listing_1.html"><span class="s_icon"></span>List</a>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="clear"></div>

            <div class="s_listing s_list_view clearfix">

                <c:forEach items="${products}" var="product">
                    <div class="s_item clearfix">
                        <div class="grid_3 alpha"><a class="s_thumb" href="<c:url value="/product/${product.id}"/>"><img
                                src="${pageContext.request.contextPath}/image/showImage?index=${product.id}"
                                title="${product.name}" alt="${product.name}"/></a></div>
                        <div class="grid_6 omega">
                            <h3>
                                <a href="<c:url value="/product/${product.id}"/>">${product.brand.name} ${product.name}</a>
                            </h3>
                            <p class="s_model">Product code: ${product.id}</p>
                            <c:if test="${!product.discount}">
                                <p class="s_price"><span class="s_currency s_before">$</span>${product.price}</p>
                            </c:if>
                            <c:if test="${product.discount}">
                                <p class="s_price s_promo_price"><span class="s_old_price"><span
                                        class="s_currency s_before">$</span>${product.oldPrice}</span><span
                                        class="s_currency s_before">$</span>${product.price}</p>
                            </c:if>
                            <p class="s_description">${product.description}</p>
                            <spring:url var="addToCart" value="/addToCart/${product.id}"/>
                            <c:if test="${product.carts.size()==0}">
                                <a class="s_button_add_to_cart" href="${addToCart}"><span class="s_icon_16"><span
                                        class="s_icon"></span>Add to Cart</span></a>
                            </c:if>
                            <c:if test="${product.carts.size()!=0}">
                                    <span class="s_icon_16"><span
                                            class="s_icon"></span>In the cart</span>
                            </c:if>
                        </div>
                    </div>

                    <div class="clear"></div>
                </c:forEach>

            </div>

            <div class="pagination">
                <c:if test="${pages.size() > 1}">
                    <c:if test="${selectedPage > 3}">
                        <a href="<spring:url value="?page=1"/>">1</a>...
                    </c:if>
                <c:forEach items="${pages}" var="page">
                    <c:if test="${page==selectedPage}">
                        <b>${page}</b>
                    </c:if>
                    <c:if test="${page!=selectedPage}">
                    <a href="<spring:url value="?page=${page}"/>">${page}</a>
                    </c:if>
                </c:forEach>
                <div class="results">Showing 1 to 12 of 20 (2 Pages)</div>
                </c:if>
            </div>

        </div>


    </div>
    <!-- end of content -->
    <%@include file="../templates/rightMenu.jsp" %>

    <%@include file="../templates/footer.jsp" %>
</body>
</html>
