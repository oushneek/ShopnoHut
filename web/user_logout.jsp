<%-- 
    Document   : user_logout
    Created on : May 6, 2014, 12:14:27 PM
    Author     : Tazbeea Tazakka
--%>

<%@page import="jspcode.Global"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>

</head>
<%
    //session destroyer 
    session.invalidate();
    Global.user_id=0;
    Global.user_type_id=-100;
    Global.cart_count=0;
    response.sendRedirect("index.jsp");
%>