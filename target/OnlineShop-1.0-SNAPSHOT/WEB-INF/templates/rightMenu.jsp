<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div id="right_col" class="grid_3">

    <div id="categories_module" class="s_box">
        <h2>Categories</h2>
        <div class="s_list_1">
            <ul>
                <c:forEach items="${sections}" var="section">
                    <li>
                        <a href="<c:url value="/section/${section.id}"/>"><b>${section.name}</b></a>
                        <ul>
                            <c:forEach items="${section.categories}" var="category">
                                <li><a href="<c:url value="/category/${category.id}"/>">${category.name}</a>
                                </li>
                            </c:forEach>
                        </ul>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>

    <c:if test="${brands!=null}">
        <div id="brands_module" class="s_box">
            <h2>Brands</h2>


            <c:forEach items="${brands}" var="brand">
                   <li> <a href="<spring:url value="?brand=${brand.name}"/>">${brand.name}</a></li>
            </c:forEach>

        </div>
    </c:if>

    <div id="bestseller_side" class="s_box clearfix">
        <h2>Bestsellers</h2>
        <c:forEach items="${bestsellers}" var="bestseller">
            <div class="s_item s_size_1 clearfix">
                <a class="s_thumb" href="<c:url value="/product/${bestseller.id}"/>"><img
                        src="${pageContext.request.contextPath}/image/showImage?index=${bestseller.id}"
                        width="38"
                        height="38"
                        alt="${bestseller.name}"/></a>
                <h3><a href="<c:url value="/product/${bestseller.id}"/>">${bestseller.brand.name} ${bestseller.name}</a>
                </h3>

                <c:if test="${!bestseller.discount}">
                    <p><a href="<c:url value="/product/${bestseller.id}"/>"><span class="s_main_color"><span
                            class="s_currency s_before">£</span>${bestseller.price}</span></a></p>
                </c:if>
                <c:if test="${bestseller.discount}">
                    <p><a href="<c:url value="/product/${bestseller.id}"/>"><span class="s_old"><span
                            class="s_currency s_before">£</span>${bestseller.oldPrice}</span>
                        <span class="s_secondary_color"><span
                                class="s_currency s_before">£</span>${bestseller.price}</span></a></p>
                </c:if>
            </div>
        </c:forEach>

    </div>

    <div id="information_module" class="s_box">
        <h2>Information</h2>
        <ul class="s_list_1">
            <li><a href="home.jsp">About Shoppica</a></li>
            <li><a href="static.html">Privacy Policy</a></li>
            <li><a href="static.html">Terms &amp; Conditions</a></li>
            <li><a href="contacts.html">Contact Us</a></li>
            <li><a href="sitemap.html">Site Map</a></li>
        </ul>
    </div>

    <div id="featured_side" class="s_box clearfix">
        <h2>Featured</h2>
        <c:forEach items="${featuredProducts}" var="featuredProduct">
            <div class="s_item s_size_1 clearfix">
                <a class="s_thumb" href="<c:url value="/product/${featuredProduct.id}"/>"><img
                        src="${pageContext.request.contextPath}/image/showImage?index=${featuredProduct.id}"
                        width="38" height="38"
                        alt="${featuredProduct.name}"/></a>
                <h3>
                    <a href="<c:url value="/product/${featuredProduct.id}"/>">${featuredProduct.brand.name} ${featuredProduct.name}</a>
                </h3>

                <c:if test="${!featuredProduct.discount}">
                    <p><a href="<c:url value="/product/${featuredProduct.id}"/>"><span class="s_main_color"><span
                            class="s_currency s_before">£</span>${featuredProduct.price}</span></a></p>
                </c:if>
                <c:if test="${featuredProduct.discount}">
                    <p><a href="<c:url value="/product/${featuredProduct.id}"/>"><span class="s_old"><span
                            class="s_currency s_before">£</span>${featuredProduct.oldPrice}</span>
                        <span class="s_secondary_color"><span
                                class="s_currency s_before">£</span>${featuredProduct.price}</span></a></p>
                </c:if>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>
