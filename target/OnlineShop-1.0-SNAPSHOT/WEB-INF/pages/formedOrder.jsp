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
    <!--      C O N T E N T     -->
    <!-- ********************** -->
    <div id="content" class="container_16">

        <div id="order_details" class="grid_16">

            <div class="s_order clearfix">
                <c:if test="${order.state.equals('Pending')}">
                    <p class="s_status"><span class="s_999">Status: </span> <span
                            style="color: #ff7700">${order.state}</span></p>
                </c:if>
                <c:if test="${order.state.equals('Shipping')}">
                    <p class="s_status"><span class="s_999">Status: </span> <span
                            style="color: #4cb1ca">${order.state}</span></p>
                </c:if>
                <c:if test="${order.state.equals('Complete')}">
                    <p class="s_status"><span class="s_999">Status: </span> <span
                            style="color: #7ebd1e">${order.state}</span></p>
                </c:if>
                <p class="s_id"><span class="s_999">Order ID</span> <span class="s_main_color">#${order.id}</span></p>


                <span class="clear border_eee"></span>

                <dl class="grid_5 alpha clearfix">
                    <dt>Customer</dt>
                    <dd>${order.firstName} ${order.lastName}</dd>
                    <dt>Telephone</dt>
                    <dd>${order.phone}</dd>
                    <dt>Shipping Method</dt>
                    <dd>${order.delivery}</dd>
                </dl>

                <span class="clear border_eee"></span>

                <c:if test="${order.adress != ''}">
                    <div class="grid_7 omega">
                        <h2>Shipping Address</h2>
                            ${order.adress}
                    </div>
                </c:if>

                <span class="clear border_eee"></span>

                <h2>Product</h2>
                <table class="s_table" width="100%" cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <th>Product</th>
                        <th>Id</th>
                        <th>Quantity</th>
                        <th width="130">Price</th>
                    </tr>
                    <c:forEach items="${order.orderedProducts}" var="item">
                        <tr>
                            <td class="align_left"><strong><a href="<c:url value="/product/${item.product.id}"/>">${item.product.brand.name} ${item.product.name}</a></strong>
                            </td>
                            <td>${item.product.id}</td>
                            <td>${item.quantity}</td>
                            <td><span class="s_currency s_before">$</span>${item.product.price}</td>
                        </tr>
                    </c:forEach>
                    <tr class="last">
                        <td class="align_right" colspan="4"><strong>Total:</strong></td>
                        <td class="s_secondary_color"><span class="s_currency s_before">$</span>${order.totalPrice}</td>
                    </tr>
                </table>


                <h2>Order History</h2>
                <table class="s_table" width="100%" cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <th>Date Added</th>
                        <th>Status</th>
                        <th>Comments</th>
                    </tr>
                    <tr>
                        <td>${order.orderTime}</td>
                        <td>Added</td>
                        <td>${order.commentary}
                        </td>
                    </tr>
                </table>

                <c:if test="${!order.state.equals('Complete')}">
                    <a href="<c:url value="/admin/changeStatus/${order.id}"/>" class="s_button_1 s_main_color_bgr"><span
                            class="s_text">Confirm changes</span></a>
                </c:if>
                <c:if test="${!order.state.equals('Pending')}">
                    <a href="<c:url value="/admin/rollbackOrder/${order.id}"/>" class="s_button_1 s_main_color_bgr"><span
                            class="s_text">Rollback</span></a>
                </c:if>
                <a href="<c:url value="/admin/removeOrder/${order.id}"/>" class="s_button_1 s_secondary_color_bgr"><span
                        class="s_text">Delete order</span></a>
                <a href="<c:url value="/admin/formedOrders"/>" class="s_button_1 s_secondary_color_bgr"><span
                        class="s_text">Back</span></a>

            </div>

        </div>

        <div class="clear"></div>

    </div>
    <!-- end of content -->
    <%@include file="../templates/footer.jsp" %>
</div>
</body>
</html>
