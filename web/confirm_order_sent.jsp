<%-- 
    Document   : confirm_order_sent
    Created on : May 17, 2014, 12:28:22 PM
    Author     : Tazbeea Tazakka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jspcode.DBConnect" %>

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
    DBConnect.confirm_order(request.getParameter("order_id"));
    response.sendRedirect(session.getAttribute("back_url").toString());
    
%>