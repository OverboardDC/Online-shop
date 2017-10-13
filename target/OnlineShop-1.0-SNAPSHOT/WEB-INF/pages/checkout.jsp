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
        <h1>Checkout</h1>
      </div>
    </div>
  </div>
  <!-- end of intro -->

  
  <!-- ********************** --> 
  <!--      C O N T E N T     -->
  <!-- ********************** --> 
  <div id="content" class="container_12">
    <c:if test="${cart.size()==0}">
      <p class="s_error_msg">Your cart is empty</p>
    </c:if>
    <div id="checkout" class="grid_12">
      <c:url value="/createOrder" var="createOrder"/>
    	<form:form id="checkout_form" class="s_accordion" action="${createOrder}" commandName="order">

        <h2>Order details</h2>
        <div>
          <div class="grid_6 alpha">
            <h3><span class="s_secondary_color">Your</span> Personal Details</h3>

            <div class="s_row_2 clearfix">
              <label>First Name: *</label>
              <form:input type="text" size="30" path="firstName"/>
              <form:errors path="firstName" cssClass="s_error_msg"/>
            </div>
            <div class="s_row_2 clearfix">
              <label>Last Name: *</label>
              <form:input type="text" size="30" path="lastName"/>
              <form:errors path="lastName" cssClass="s_error_msg" />
            </div>
            <div class="s_row_2 clearfix">
              <label>Telephone: *</label>
              <form:input type="text" size="30" path="phone"/>
              <form:errors path="phone" cssClass="s_error_msg"/>
            </div>
          </div>
          <div class="grid_6 omega">
            <h3><span class="s_secondary_color">Your</span> Address</h3>
            <div class="s_row_2 clearfix">
              <label>Address :</label>
              <form:input type="text" size="30" path="adress"/>
            </div>
            <div class="clear"></div>
            <h3><span class="s_secondary_color">Shipping</span> Method</h3>
            <div class="s_row_3 clearfix">
                <form:radiobutton path="delivery" value="Citylink"/>
              <span class="s_desc"><strong>Citylink</strong><br />Citylink - 10$<span class="s_currency s_after"> $</span></span></br>
              <form:radiobutton path="delivery" value="Pickup"/>
              <span class="s_desc"><strong>Pickup</strong><br /><span class="s_currency s_after"></span></span></br>
              <form:errors path="delivery" cssClass="s_error_msg"/>
            </div>
          </div>
          <div class="clear"></div>
          <h3><span class="s_secondary_color">Order</span> comments</h3>
          <div class="s_row_3 clearfix">
            <form:textarea rows="8" style="width: 99%;" path="commentary"/>
          </div>
          <div class="s_row_3 clearfix">
            <label class="s_checkbox"><form:checkbox path="licenseAgreement" /> I have read and agree to the Terms &amp; Conditions</label>
            <form:errors path="licenseAgreement" cssClass="s_error_msg"/>
          </div>
          <div class="clear"></div>
          <input type="submit" value="Create order"/>
          <span class="clear"></span>
          <br />
        </div>
      </form:form>
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
