<%-- 
    Document   : contact_us_confirmation
    Created on : Apr 8, 2014, 11:10:20 PM
    Author     : Tazbeea Tazakka
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="jspcode.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="main_component/header.jsp" %>
		
<!-- Include the Menu -->
<%@ include file="main_component/menu.jsp" %>
                    
 <!-- Include the Sidebar -->               
 <%@ include file="main_component/sidebar.jsp" %>
<div class="span9">
        
        <%
            String email,name,message;
            
            email=request.getParameter("email");
            name=request.getParameter("name");
            message=request.getParameter("message");
             Calendar currentdate=Calendar.getInstance();
            SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd");
            String dateNow=formatter.format(currentdate.getTime());
            DBConnect.new_message(name, email, message, dateNow);
            out.println("<div class='span9'>Dear "+name+", We have received your message.</div>");
            out.println("<div class='span9'>Your Email address is "+email+".</div>");
            out.println("<div class='span9'>Your Message is ' "+message+" '.</div>");
         
        %>
        
        
</div>
        
   </div>
 <!-- Include the Footer -->               
 <%@ include file="main_component/footer.jsp" %>

</div> <!-- /container -->

