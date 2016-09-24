<%-- 
    Document   : add_product_image
    Created on : May 22, 2014, 7:37:03 AM
    Author     : Tazbeea Tazakka
--%>

<%
    if(session.getAttribute("user_type") == null)
    {

        response.sendRedirect("user_login.jsp");
    }
    else {
        if(!(session.getAttribute("user_type").toString().equals("1"))){
           response.sendRedirect("user_login.jsp");

        }
    }
%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="jspcode.*" %>


<script src="js/jquery.min.js" ></script>
 <!-- Include the Header -->               
 <%@ include file="main_component/header.jsp" %>

<!-- Include the Menu -->
<%@ include file="main_component/menu.jsp" %>
                    
 <!-- Include the Sidebar -->               
 <%@ include file="main_component/sidebar.jsp" %>



<form action="FileUploadExample" method="post" enctype="multipart/form-data" >   
    <div class="span9"><h4>Please rename the image name exactly as your product name and then choose and upload.</h4><hr></div><br>
    <div class="span3">Image: </div><div class="span5"><input type="file" name="product_image" size="30" multiple="multiple" required=""></div></br>
    <div class="span9"><input type="submit" value="Submit"/></div></br>

</form>

 
 </div>
 <!-- Include the Footer -->               
 <%@ include file="main_component/footer.jsp" %>

</div> <!-- /container -->


