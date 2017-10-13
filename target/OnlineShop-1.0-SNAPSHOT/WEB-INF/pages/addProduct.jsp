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
                    <a href="">Home</a>
                    &gt;
                    <a href="">Add product</a>
                </div>
                <h1>Add product</h1>
            </div>
        </div>
    </div>
    <!-- end of intro -->


    <!-- ********************** -->
    <!--      C O N T E N T     -->
    <!-- ********************** -->
    <div id="content" class="container_12">
        <c:url value="/admin/addNewProduct" var="addProduct"/>
        <form:form action="${addProduct}?${_csrf.parameterName}=${_csrf.token}" modelAttribute="product" method="post" enctype="multipart/form-data">
            <div>
                <div class="grid_12">
                    <div class="s_row_2 clearfix">
                        <label>Category: *</label>
                        <form:select path="category.id" itemValue="id" items="${categories}" itemLabel="name"/>
                    </div>

                    <div class="s_row_2 clearfix">
                        <label>Brand: *</label>
                            <form:select path="brand.id" itemValue="id" items="${brands}" itemLabel="name"/>
                    </div>

                    <div class="s_row_2 clearfix">
                        <label>Name: *</label>
                        <form:input type="text" size="30" path="name"/>
                        <form:errors path="name" cssClass="s_error_msg"/>
                    </div>
                    <div class="s_row_2 clearfix">
                        <label>Description:</label>
                        <form:textarea type="text" size="30" path="description"/>
                        <form:errors path="description" cssClass="s_error_msg"/>
                    </div>
                    <div class="s_row_2 clearfix">
                        <label>Amount: *</label>
                        <form:input type="text" size="30" path="amount" AUTOCOMPLETE="off"/>
                        <form:errors path="amount" cssClass="s_error_msg" />
                    </div>

                    <div class="s_row_2 clearfix">
                        <label>Price: *</label>
                        <form:input type="text" size="30" path="price" AUTOCOMPLETE="off"/>
                        <form:errors path="price" cssClass="s_error_msg"/>
                    </div>


                    <div class="s_row_2 clearfix">
                        <label>Old price: (Fill if discount is true)</label>

                        <form:input type="text" size="30" path="oldPrice" AUTOCOMPLETE="off"/>
                        <form:errors path="oldPrice" cssClass="s_error_msg"/>
                    </div>
                    <div class="s_row_2 clearfix">
                        <label>Image: </label>
                        <form:input type="file" path="file" enctype="multipart/form-data"/>

                    </div>
                    <input type="submit" value="Add product"/>
                </div>
            </div>
        </form:form>

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
