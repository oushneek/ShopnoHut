<%-- 
    Document   : index
    Created on : Nov 8, 2013, 2:53:58 PM
    Author     : Tazbeea Tazakka
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="jspcode.*" %>

<%if(session.getAttribute("user_name")!= null)
    {
        //out.print("alredy logged in");
        response.sendRedirect(session.getAttribute("back_url").toString());
    }
%>
 <!-- Include the Header -->               
 <%@ include file="main_component/header.jsp" %>
		
<!-- Include the Menu -->
<%@ include file="main_component/menu.jsp" %>
                    
 <!-- Include the Sidebar -->               
 <%@ include file="main_component/sidebar.jsp" %>
 
 
 
                 
        <div class="span9">
		     <ul class="breadcrumb">User Registration Form</ul>
	
        <%@ include file="user_component/signup_form.jsp" %>
                     
                     
                     
	</div>
		  
		  
		  
		
        
	  
      </div>
 <!-- Include the Footer -->               
 <%@ include file="main_component/footer.jsp" %>

</div> <!-- /container -->


