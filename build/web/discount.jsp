<%-- 
    Document   : discount
    Created on : May 11, 2014, 11:10:05 PM
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
<!DOCTYPE html>
<!-- Include the Header -->               
 <%@ include file="main_component/admin_header.jsp" %>
		
<!-- Include the Menu -->
<%@ include file="main_component/admin_menu.jsp" %>
                    
 <!-- Include the Sidebar -->               
 <%@ include file="main_component/admin_sidebar.jsp" %>
 
 
 <div class="span9">
    <ul class="breadcrumb">Add discount to a product</ul>	
    <%@ include file="user_component/discount_form.jsp" %>
 </div>
 