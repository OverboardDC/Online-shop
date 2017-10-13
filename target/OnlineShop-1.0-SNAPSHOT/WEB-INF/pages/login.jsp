<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fom" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

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
        <h1>Log in</h1>

      </div>
    </div>
  </div>
  <!-- end of intro -->
  
  
  <!-- ********************** --> 
  <!--      C O N T E N T     --> 
  <!-- ********************** --> 
  <div id="content" class="container_16">
  

    <div id="login_page" class="grid_16">
            
      <div class="grid_8 alpha">
        <h2 class="s_title_1"><span class="s_secondary_color">I am a new</span> customer.</h2>
        <div class="clear"></div>
        <form id="account" action="forms.html">
          <div class="s_row_3 clearfix">

            <p>By creating an account you will be able to shop faster, be up to date on an order's status, and keep track of the orders you have previously made.</p>

          </div>
          <span class="clear border_ddd"></span>
          <br />
          <a class="s_button_1 s_main_color_bgr" href="<c:url value="/registration"/>"><span class="s_text">Create account</span></a>
        </form>
      </div>

      <div class="grid_8 omega">
        <h2 class="s_title_1"><span class="s_secondary_color">Returning</span> Customer</h2>

        <div class="clear"></div>
        <form method="POST" action="<c:url value="/login"/>" class="form-signin">
          <div class="s_row_3 clearfix ${error != null ? 'has-error' : ''}">
            I am a returning customer.<br />
            <br />
            <label><strong>Username:</strong></label>
            <input type="text" size="35" class="required email" name="username"/>
            <br />
            <br />
            <label><strong>Password:</strong></label>
            <input type="password" size="35" class="required" name="password"/>
            <br/>
            <label class="s_error_msg">${error}</label>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
          </div>
          <span class="clear border_ddd"></span>
          <br />
          <div class="s_nav s_size_2 left">

          </div>
          <button class="s_button_1 s_main_color_bgr" type="submit"><span class="s_text">Login</span></button>
        </form>
      </div>

      <div class="clear"></div>

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
