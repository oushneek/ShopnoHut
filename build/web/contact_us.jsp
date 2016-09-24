<%-- 
    Document   : contact_us
    Created on : Apr 8, 2014, 10:52:48 PM
    Author     : Tazbeea Tazakka
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="jspcode.*" %>

<!DOCTYPE html>
<!-- Include the Header -->               
 <%@ include file="main_component/header.jsp" %>
		
<!-- Include the Menu -->
<%@ include file="main_component/menu.jsp" %>
                    
 <!-- Include the Sidebar -->               
 <%@ include file="main_component/sidebar.jsp" %>
                 
        <div class="span9">
		     <ul class="breadcrumb">Contact Us</ul>
        <%@ include file="user_component/contact_form.jsp" %>
	</div>
		 
      </div>
 <!-- Include the Footer -->               
 <%@ include file="main_component/footer.jsp" %>

</div> <!-- /container -->

