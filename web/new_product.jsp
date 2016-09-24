<%-- 
    Document   : index
    Created on : Nov 8, 2013, 2:53:58 PM
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
 <%@ include file="main_component/admin_header.jsp" %>

<!-- Include the Menu -->
<%@ include file="main_component/admin_menu.jsp" %>
                    
 <!-- Include the Sidebar -->               
 <%@ include file="main_component/admin_sidebar.jsp" %>
                    
 <div class="span9">
    <ul class="breadcrumb">Add new Product</ul>	
    <%@ include file="user_component/add_product_form.jsp" %>
 </div>
	  

      </div>
 <!-- Include the Footer -->               
 <%@ include file="main_component/footer.jsp" %>

</div> <!-- /container -->


