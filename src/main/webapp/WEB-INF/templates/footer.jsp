<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<!-- ********************** -->
<!--   S H O P   I N F O    -->
<!-- ********************** -->
<div id="shop_info">
    <div id="shop_info_wrap">
        <div class="container_12">
            <div id="shop_description" class="grid_3">
                <h2>Shoppica Theme</h2>
                <p>Pellentesque a arcu ut nisi semper cursus. Nullam vehicula dapibus ultrices. Integer nunc risus,
                    fringilla ut hendrerit a, dapibus vestibulum ante. In ullamcorper erat et orci mattis rutrum et
                    a enim. Curabitur semper, erat sit amet condimentum volutpat, enim nisi auctor augue, id
                    fringilla est dui non lectus. Cras in urna ante, sit amet dignissim orci. Proin nibh urna,
                    consectetur vitae placerat luctus.</p>
            </div>
            <div id="shop_contacts" class="grid_3">
                <h2>Contact Us</h2>
                <table width="100%" cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <td valign="middle"><span class="s_icon_32"><span
                                class="s_icon s_phone_32"></span>5234452 <br/></span></td>
                    </tr>
                    <tr>
                        <td valign="middle"><span class="s_icon_32"><span
                                class="s_icon s_fax_32"></span>5234452 <br/></span></td>
                    </tr>
                    <tr>
                        <td valign="middle"><span class="s_icon_32"><span class="s_icon s_mail_32"></span>pinko@example.com <br/> pinko@example.com</span>
                        </td>
                    </tr>
                    <tr>
                        <td valign="middle"><span class="s_icon_32"><span
                                class="s_icon s_skype_32"></span>my_skype <br/> </span>
                        </td>
                    </tr>
                </table>
            </div>
            <div id="twitter" class="grid_3">
                <h2>Twitter</h2>
                <ul id="twitter_update_list">
                    <li></li>
                </ul>
                <script type="text/javascript" src="http://twitter.com/javascripts/blogger.js"></script>
                <script type="text/javascript"
                        src="http://twitter.com/statuses/user_timeline/themeburn.json?callback=twitterCallback2&amp;count=2"></script>
            </div>
            <div id="facebook" class="grid_3">
                <h2>Facebook</h2>
                <div class="s_widget_holder">
                    <fb:fan profileid="111188056908" stream="0" connections="6" logobar="0" width="220"
                            css="http://svest.no-ip.org/test/opencart/catalog/view/theme/shoppica/stylesheet/facebook.css.php?300"></fb:fan>
                </div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>
<!-- end of shop info -->

<!-- ********************** -->
<!--      F O O T E R       -->
<!-- ********************** -->
<div id="footer" class="container_12">
    <div id="footer_categories" class="clearfix">
        <c:forEach items="${sections}" var="section">
            <div class="grid_2">
                <h2>${section.name}</h2>
                <ul class="s_list_1">
                    <c:forEach items="${section.categories}" var="category">
                        <li><a href="<c:url value="/category/${category.id}"/>">${category.name}</a></li>
                    </c:forEach>
                </ul>
            </div>
        </c:forEach>
        <div class="clear"></div>
        <div class="grid_12 border_eee"></div>
    </div>
    <div id="payments" class="right clearfix">
        <img src="${pageContext.request.contextPath}resources/images/payments/discover_straight_32px.png" alt=""/>
        <img src="${pageContext.request.contextPath}resources/images/payments/american_express_straight_32px.png"
             alt=""/>
        <img src="${pageContext.request.contextPath}resources/images/payments/moneybookers_straight_32px.png" alt=""/>
        <img src="${pageContext.request.contextPath}resources/images/payments/paypal_straight_32px.png" alt=""/>
        <img src="${pageContext.request.contextPath}resources/images/payments/visa_straight_32px.png" alt=""/>
        <img src="${pageContext.request.contextPath}resources/images/payments/american_express_straight_32px.png"
             alt=""/>
    </div>
    <p id="copy">&copy; Copyright 2017. Powered by <a class="blue" href="">Open Cart</a>.<br/> <a class="s_main_color"
                                                                                                  href="http://www.shoppica.net">Shoppica
        theme</a> made by <a href="http://www.themeburn.com">ThemeBurn.com</a></p>
</div>
<!-- end of FOOTER -->
</body>
</html>