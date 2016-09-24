<%-- 
    Document   : my_profile
    Created on : May 14, 2014, 4:56:05 PM
    Author     : Tazbeea Tazakka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if(session.getAttribute("user_name")==null)
        response.sendRedirect("user_login.jsp");
%>
<script src="js/jquery.min.js" ></script>
 <!-- Include the Header -->               
 <%@ include file="main_component/header.jsp" %>

<!-- Include the Menu -->
<%@ include file="main_component/menu.jsp" %>
                    
 <!-- Include the Sidebar -->               
 <%@ include file="main_component/sidebar.jsp" %>

 <div class="span9">
     
    <ul class="breadcrumb">MY PROFILE</ul>	
    
    
    <div class="span8" style="margin-bottom: 50px">
    <a href="edit_user_profile.jsp"><div class="thumbnail span3 pull-left">
        <img style="height:100px ;width:150px" alt="" src="images/profile_photo/my_profile.jpg" />
        <div class="caption">
            <p style="font-size: 20px ;text-align: center">Edit Profile</p><br /><br />
        </div>
    </div></a>
    <a href="show_cart.jsp"><div class="thumbnail span3 pull-right">
        <img style="height:100px ;width:150px" alt="" src="images/profile_photo/cart.png" />
        <div class="caption">
            <p style="font-size: 20px;text-align: center">My Cart</p><br /><br />
        </div>
    </div></a>
        
    </div>
    <br><br>
    
    <div class="span8">
    <a href="wishlist.jsp?page=1"><div class="thumbnail span3 pull-left">
        <img style="height:100px ;width:150px" alt="" src="images/profile_photo/wishlist.gif" />
        <div class="caption">
            <p style="font-size: 20px;text-align: center">My Wishlist</p><br /><br />
        </div>
    </div></a>
    <a href="my_orders.jsp"><div class="thumbnail span3 pull-right">
        <img style="height:100px ;width:150px" alt="" src="images/profile_photo/my_orders.jpg" />
        <div class="caption">
            <p style="font-size: 20px;text-align: center">My Orders</p><br /><br />
        </div>
    </div></a>
    </div>
   <!-- <ol>
        <li><a href="edit_user_profile.jsp">Edit your Profile</a></li>
        <li><a href="wishlist.jsp">My Wishlist</a></li>
        <li><a href="show_cart.jsp">My Cart</a></li>
        <li><a href="my_orders.jsp">My Previous Orders</a></li>
        
        
        
    </ol>-->
 </div>
	  
      </div>
 <!-- Include the Footer -->               
 <%@ include file="main_component/footer.jsp" %>

</div> <!-- /container -->


