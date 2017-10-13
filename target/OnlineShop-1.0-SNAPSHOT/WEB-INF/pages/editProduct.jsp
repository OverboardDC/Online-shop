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
>
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
        <c:url value="/admin/editTheProduct" var="editProduct"/>
        <form:form modelAttribute="product" method="post" action="${editProduct}?${_csrf.parameterName}=${_csrf.token}"
                   enctype="multipart/form-data">
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
                        <form:errors path="amount" cssClass="s_error_msg"/>
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

                    <input type="hidden" value="${product.id}" name="id"/>

                    <input type="submit" value="Edit product"/>
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

                        <div id="product_gallery">
                            <ul class="s_thumbs clearfix">
                                <c:forEach items="${product.images}" var="image">
                                    <li><a class="s_thumb"
                                           href="${pageContext.request.contextPath}/image/showOtherImage?index=${image.id}"
                                           title="${product.name}"
                                           rel="prettyPhoto[gallery]"><img
                                            src="${pageContext.request.contextPath}/image/showOtherImage?index=${image.id}"
                                            width="120"
                                            title="${product.name}" alt="${product.name}"/></a></li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>


            </div>
        </form:form>

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
