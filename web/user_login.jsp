<%-- 
    Document   : user_login
    Created on : Apr 7, 2014, 10:35:28 AM
    Author     : Tazbeea Tazakka
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="jspcode.*" %>
<%@ page import="userInfo.*" %>

<%
    if(session.getAttribute("user_id") != null)
    {
        String redirectURL = "index.jsp";
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
		     <ul class="breadcrumb">User Log in</ul>
	<%
        
                        if(Global.login==false){
                            
                            out.print("<h4>Incorrect Email or Password. Try Again.</h4><hr>");
                        }
        
        %>
       <%@ include file="user_component/login_form.jsp" %>
        
       
       
	</div>
		 
     
</div >
 <!-- Include the Footer -->               


</div> <!-- /container -->


