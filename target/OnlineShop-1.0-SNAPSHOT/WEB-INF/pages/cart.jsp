<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en" xml:lang="en"
>
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
                    <a href="<c:url value="/"/>">Home</a>
                    &gt; <a href="<c:url value="/cart"/>">Basket</a>
                </div>
                <h1>Shopping Cart (${cart.size()} items)</h1>
            </div>
        </div>
    </div>
    <!-- end of intro -->


    <!-- ********************** -->
    <!--      C O N T E N T     -->
    <!-- ********************** -->
    <div id="content" class="container_12">

        <div id="shopping_cart" class="grid_12">
            <c:if test="${cart.size()==0}">
                <h1>Shopping Cart is empty</h1>
            </c:if>

            <c:if test="${cart.size()!=0}">


                <table class="s_table_1" width="100%" cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <th width="65">Remove</th>
                        <th width="60">Image</th>
                        <th width="320">Name</th>
                        <th>Model</th>
                        <th>Quantity</th>
                        <th>Total</th>
                    </tr>
                    <c:forEach items="${cart}" var="item">
                        <tr class="even">
                            <td valign="middle"><a id="hremove_87" class="s_button_remove_in_cart"
                                                   href="<c:url value="/removeFromCart/${item.id}"/>">&nbsp;</a>
                            </td>
                            <td valign="middle"><a href="<c:url value="/product/${item.product.id}"/>"><img
                                    src="${pageContext.request.contextPath}/image/showImage?index=${item.product.id}"
                                    width="60"
                                    height="60" alt="${item.product.name}"/></a></td>
                            <td valign="middle"><a
                                    href="<c:url value="/product/${item.product.id}"/>"><strong>${item.product.brand.name} ${item.product.name}</strong></a>
                            </td>
                            <td valign="middle">Product ${item.product.id}</td>
                            <c:url value="/updateQuantity/${item.id}/" var="updateQuantity"/>
                            <form:form action="${updateQuantity}" method="get">
                                <td valign="middle"><input name="quantity" type="text" size="3"
                                                           value="${item.quantity}"/><input type="submit"
                                                                                            value="Change"/></td>

                            </form:form>
                            <td valign="middle">${item.product.price}<span class="s_currency s_after"> $</span></td>
                        </tr>
                    </c:forEach>
                </table>
                <br/>
                <p class="s_total s_secondary_color last"><strong>Total:</strong>${totalPrice}<span
                        class="s_currency s_after"> $</span></p>

                <div class="clear"></div>
                <br/>

                <a class="s_button_1 s_ddd_bgr left" href="<c:url value="/"/>"><span
                        class="s_text">Continue Shopping</span></a>
                <a class="s_button_1 s_ddd_bgr left" href="<c:url value="/clearCart"/>"><span
                        class="s_text">Clear cart</span></a>


                <a class="s_button_1 s_main_color_bgr" href="<c:url value="/checkout"/>"><span class="s_text">Checkout</span></a>

            </c:if>
        </div>

        <div class="clear"></div>
        <br/>
        <br/>

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
