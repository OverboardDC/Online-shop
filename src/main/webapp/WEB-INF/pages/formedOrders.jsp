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
    <div id="content" class="container_12">

        <div id="order_history" class="grid_12">

            <div class="s_listing s_grid_view clearfix">
                <c:forEach items="${orders}" var="order">
                    <div class="grid_4">
                        <div class="s_order clearfix">
                            <p class="s_id"><span class="s_999">Order ID:</span> <span class="s_main_color">${order.id}</span></p>
                            <c:if test="${order.state.equals('Pending')}">
                                <p class="s_status s_secondary_color" style="color: #ff7700">${order.state}</p>
                                <span class="clear"></span>
                            </c:if>
                            <c:if test="${order.state.equals('Shipping')}">
                                <p class="s_status s_secondary_color" style="color: #4cb1ca">${order.state}</p>
                                <span class="clear"></span>
                            </c:if>
                            <c:if test="${order.state.equals('Complete')}">
                                <p class="s_status s_secondary_color" style="color: #7ebd1e" >${order.state}</p>
                                <span class="clear"></span>
                            </c:if>

                            <dl class="clearfix">
                                <dt>Date Added::</dt>
                                <dd>${order.orderTime}</dd>
                                <dt>Customer::</dt>
                                <dd>${order.firstName} ${order.lastName}</dd>

                                <dt>Products::</dt>
                                <dd>${order.orderedProducts.size()}</dd>
                                <dt>Shipping method: </dt>
                                <dd>${order.delivery}</dd>
                            </dl>
                            <span class="clear border_eee"></span>
                            <br/>
                            <p class="s_total left">${order.totalPrice}<span class="s_currency s_after"> $</span></p>

                            <a href="<c:url value="/admin/viewOrder/${order.id}"/>" class="s_main_color right"><strong>View</strong></a>
                        </div>
                    </div>
                </c:forEach>
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


            <div class="clear"></div>
            <br/>

            <br/>

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
