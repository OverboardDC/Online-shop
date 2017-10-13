<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Online Shop</title>
</head>
<body>
<!-- ********************** -->
<!--      H E A D E R       -->
<!-- ********************** -->
<div id="header" class="container_12">
    <div class="grid_12">

        <a id="site_logo" href="<c:url value="/"/>">Online shop - Premium e-Commerce Theme</a>

        <div id="system_navigation" class="s_nav">
            <ul class="s_list_1 clearfix">
                <li><a href="<c:url value="/"/>">Home</a></li>
                <li><a href="<c:url value="/cart"/>">Shopping Cart</a></li>
                <li><a href="">About Us</a></li>
                <li><a href="<c:url value="/contacts"/>">Contact</a></li>
                <c:if test="${pageContext.request.userPrincipal.name != null}">
                    <form id="logoutForm" method="POST" action="<c:url value="/logout"/>">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </form>

                    Welcome ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()">Logout</a>


                </c:if>
                <c:if test="${pageContext.request.userPrincipal.name == null}">
                    <li><a href="<c:url value="/loginPage"/>">Log In</a></li>
                </c:if>
            </ul>
        </div>

        <div id="site_search">
            <a id="show_search" href="javascript:" title="Search:"></a>
            <div id="search_bar" class="clearfix">
                <spring:url var="search" value="/search"/>
                <form:form action="${search}" method="get">
                    <input type="text" id="filter_keyword" name="searchString"/>
                    <input type="submit" class="s_button_1 s_secondary_color_bgr" value="Search"/>
                </form:form>
            </div>
        </div>


        <div id="categories" class="s_nav">
            <ul>
                <li id="menu_home"><a href="<c:url value="/"/>">Home</a></li>
                <c:forEach items="${sections}" var="section">
                    <li><a href="<c:url value="/section/${section.id}"/>">${section.name}</a>
                        <div class="s_submenu">
                            <h3>Inside ${section.name}</h3>
                            <ul class="s_list_1 clearfix">
                                <c:forEach items="${section.categories}" var="category">
                                <li><a href="<c:url value="/category/${category.id}"/>">${category.name}</a>
                                    </c:forEach>
                            </ul>
                            <span class="clear border_eee"></span>
                            <h3>${section.name} brands</h3>
                            <ul class="s_list_1 clearfix">
                                <c:forEach items="${section.brands}" var="brand">
                                    <li><a href="<c:url value="/brand/${brand.id}"/>">${brand.name}</a></li>
                                </c:forEach>
                            </ul>

                        </div>
                    </li>
                </c:forEach>
                <sec:authorize access="hasRole('ROLE_ADMIN')" >
                <li><a href="">Admin panel</a>
                    <div class="s_submenu">
                        <h3>Inside admin panel</h3>
                        <ul class="s_list_1 clearfix">
                            <li><a href="<c:url value="/admin/addProductPage"/>">Add product</a>
                            <li><a href="<c:url value="/admin/formedOrders"/>">Orders</a>
                        </ul>
                    </div>
                </li>
                </sec:authorize>
            </ul>
        </div>

        <div id="cart_menu" class="s_nav">
            <a href="<c:url value="/cart"/>"><span class="s_icon"></span>
                <small class="s_text">Cart</small>
                <span class="s_grand_total s_main_color">$${totalPrice}</span></a>
            <div class="s_submenu s_cart_holder">
                <p class="s_mb_0">${cart.size()}x items</p>
                <c:forEach items="${cart}" var="item">
                    <div class="s_cart_item">
                        <a id="hremove_95" class="s_button_remove" href="<c:url value="/removeFromCart/${item.id}"/>">&nbsp;</a>
                        <span class="block">${item.quantity}x <a
                                href="<c:url value="/product/${item.product.id}" />">${item.product.brand.name} ${item.product.name}</a></span>
                    </div>

                </c:forEach>
                <div class="s_total clearfix"><strong class="cart_module_total left">Total:</strong><span
                        class="cart_module_total">${totalPrice}<span class="s_currency s_after"> $</span></span>
                </div>
                <span class="clear s_mb_15"></span>
                <div class="align_center clearfix">
                    <a class="s_button_1 s_secondary_color_bgr s_ml_0" href="<c:url value="/cart"/>"><span
                            class="s_text">View Cart</span></a>
                    <a class="s_button_1 s_secondary_color_bgr" href="<c:url value="/checkout"/>"><span
                            class="s_text">Checkout</span></a>
                </div>
            </div>
        </div>

    </div>
</div>
<!-- end of header -->
</body>
</html>