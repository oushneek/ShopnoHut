<%-- 
    Document   : add_product_to_DB
    Created on : Apr 22, 2014, 12:50:29 PM
    Author     : Tazbeea Tazakka
--%>

<%@page import="java.io.InputStream"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="jspcode.*"%>
<%@page import="javax.servlet.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Calendar currentdate=Calendar.getInstance();
            SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd");
            String dateNow=formatter.format(currentdate.getTime());
            
            /*Part myPart=request.getPart("product_image");
            InputStream inputStream=null;
            inputStream=myPart.getInputStream();
            String iamge_url=myPart.getName();*/
            addNewType.addNewType.add_new_product(request.getParameter("product_name"),request.getParameter("catChoose"),request.getParameter("subcatChoose"),request.getParameter("discount"),request.getParameter("price_sell"),request.getParameter("description"),dateNow);
            response.sendRedirect("add_product_image.jsp");
        %>
    </body>
</html>
