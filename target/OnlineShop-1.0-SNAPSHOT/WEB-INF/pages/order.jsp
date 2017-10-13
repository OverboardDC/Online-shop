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
    <script type="text/javascript">
        $(document).ready(function()  {
            if (window.PIE) {
                $('.rounded').each(function() {
                    PIE.attach(this);
                });
            }
        });
    </script>
    <script type="text/javascript">
        $(function() {
            $("#checkout form").accordion({
                autoHeight: false
            });
        });
    </script>

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
                    <a href="">Home</a>
                    &gt;
                    <a href="">Checkout</a>
                </div>
                <h1>Thank you for the order</h1>
            </div>
        </div>
    </div>
    <!-- end of intro -->


    <!-- ********************** -->
    <!--      C O N T E N T     -->
    <!-- ********************** -->
    <div id="content" class="container_12">

        <div id="checkout" class="grid_12">
            <h2>Your order id is ${order.id}</h2>
            <p>We will call you in the nearest time</p>
            <h4>Your ordered products:</h4>
            <table class="s_table_1" width="100%" cellpadding="0" cellspacing="0" border="0">
                <tr>
                    <th width="60">Image</th>
                    <th width="320">Name</th>
                    <th>Product id</th>
                    <th>Quantity</th>
                    <th>Total</th>
                </tr>
                <c:forEach items="${order.orderedProducts}" var="item">
                    <tr class="even">
                        <td valign="middle"><a href="<c:url value="/product/${item.product.id}"/>"><img
                                src="${pageContext.request.contextPath}/image/showImage?index=${item.product.id}"
                                width="60"
                                height="60" alt="${item.product.name}"/></a></td>
                        <td valign="middle"><a
                                href="<c:url value="/product/${item.product.id}"/>"><strong>${item.product.brand.name} ${item.product.name}</strong></a>
                        </td>
                        <td valign="middle">Product ${item.product.id}</td>
                            <td valign="middle"><label name="quantity" type="text" size="3">${item.quantity}</label></td>
                        <td valign="middle">${item.product.price}<span class="s_currency s_after"> $</span></td>
                    </tr>
                </c:forEach>
            </table>
            <h4>Your personal details:</h4>
            <h5><label>First name: ${order.firstName}</label></h5>
            <h5><label>Last name: ${order.lastName}</label></h5>
            <h5><label>Phone number: ${order.phone}</label></h5>
            <c:if test="${!order.adress.equals('')}">
                <h5><label>Adress: ${order.adress}</label></h5>
            </c:if>
            <h5><label>Shipping method: ${order.delivery}</label></h5>
            <h5><label>Time: ${order.orderTime}</label></h5><br>
            <c:if test="${!order.commentary.equals('')}">
             <h5><label>Commentary: ${order.commentary}</label></h5><br>
            </c:if>
            <h3>Total price</h3>
            <h4>${order.totalPrice}</h4>
            <c:if test="${order.delivery=='Citylink'}">
                <h5>Including delivery</h5>
            </c:if>
            <a class="s_button_1 s_ddd_bgr left" href="<c:url value="/"/>"><span
                    class="s_text">Continue Shopping</span></a>




            <br/>
        </div>

    </div>
    <!-- end of content -->

    <%@include file="../templates/footer.jsp" %>

</div>

<div id="fb-root"></div>
<script type="text/javascript">
    window.fbAsyncInit = function() {
        FB.init({appId: '0c18007de6f00f7ecda8c040fb76cd90', status: true, cookie: true,
            xfbml: true});
    };
    (function() {
        var e = document.createElement('script'); e.async = true;
        e.src = document.location.protocol +
            '//connect.facebook.net/en_US/all.js';
        document.getElementById('fb-root').appendChild(e);
    }());
</script>

</body>
</html>
