<%-- 
    Document   : add_sub_cat_to_DB
    Created on : Apr 22, 2014, 10:21:11 AM
    Author     : Tazbeea Tazakka
--%>

<%@page import="jspcode.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            addNewType.addNewType.add_new_subcateogry(request.getParameter("catChoose"),request.getParameter("subcat_name"));
        
            response.sendRedirect("admin.jsp");
        
        %>
    </body>
</html>
