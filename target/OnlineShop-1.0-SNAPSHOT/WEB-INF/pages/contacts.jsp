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
    <script type="text/javascript"
            src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.8/jquery.validate.min.js"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/shoppica.js"/>"></script>
    <script type="text/javascript">
        $(document).ready(function () {

            jQuery.validator.setDefaults({
                errorElement: "p",
                errorClass: "s_error_msg",
                errorPlacement: function (error, element) {
                    error.insertAfter(element);
                },
                highlight: function (element, errorClass, validClass) {
                    $(element).addClass("error_element").removeClass(validClass);
                    $(element).parent("div").addClass("s_error_row");
                },
                unhighlight: function (element, errorClass, validClass) {
                    $(element).removeClass("error_element").addClass(validClass);
                    $(element).parent("div").removeClass("s_error_row");
                }
            });
            $("#contact_form").validate({
                rules: {
                    enquiry: {
                        required: true,
                        minlength: 10
                    }
                }
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
                    <a href="">Contact Us</a>
                </div>
                <h1>Contact Us</h1>
            </div>
        </div>
    </div>
    <!-- end of intro -->

    <!-- ********************** -->
    <!--      C O N T E N T     -->
    <!-- ********************** -->
    <div id="content" class="container_16">


        <div id="contacts" class="s_info_page grid_12">

            <h2><span class="s_secondary_color">Shop</span> address</h2>

            <p class="alpha grid_4"><strong>Shoppica store</strong><br/> 5 Shoppica Blvd<br/> New York<br/> 1000</p>
            <p class="grid_4"><strong>Telephone:</strong><br/> +1 (0) 7007001</p>
            <p class="omega grid_4"><strong>Fax:</strong><br/> +1 (0) 7007002</p>

            <br/>
            <span class="clear border_ddd"></span>
            <br/>


            <h2><span class="s_secondary_color">Send</span> a message</h2>

            <form id="contact_form" action="#" method="post" enctype="multipart/form-data">
                <div id="contact_form_icon"></div>

                <div class="s_row_3 clearfix">
                    <label><strong>First Name:</strong> *</label>
                    <input type="text" size="40" class="required" title="Name must be between 3 and 32 characters!"/>
                </div>
                <div class="s_row_3 clearfix">
                    <label><strong>E-Mail Address:</strong> *</label>
                    <input type="text" size="40" class="required email"
                           title="E-Mail Address does not appear to be valid!"/>
                </div>
                <div class="s_row_3 clearfix">
                    <label><strong>Enquiry:</strong> *</label>
                    <div class="s_full">
                        <textarea id="enquiry" style="width: 98%;" rows="10" class="required"
                                  title="Enquiry must be between 10 and 3000 characters!"></textarea>
                    </div>
                </div>
                <a class="s_button_1 s_main_color_bgr" onclick="$('#contact_form').submit();"><span class="s_text">Send message</span></a>
            </form>

        </div>

        <%@include file="../templates/rightMenu.jsp" %>

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
