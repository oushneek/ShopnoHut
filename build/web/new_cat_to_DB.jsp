<%-- 
    Document   : add_cat_to_DB
    Created on : Apr 21, 2014, 10:03:51 PM
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
           // DBConnect add_category = new DBConnect();
            //out.println(add_category.add_new_cateogry(request.getParameter("cat_name")));
            
            addNewType.addNewType.add_new_cateogry(request.getParameter("cat_name"));
            response.sendRedirect("admin.jsp");
        %>
    </body>
</html>
