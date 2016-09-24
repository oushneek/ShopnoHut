<%-- 
    Document   : add_special_product_to_DB
    Created on : May 14, 2014, 2:25:10 PM
    Author     : Tazbeea Tazakka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="specialProduct.specialProduct" %>

<%
    //String[] special=new String[9];
    specialProduct.delete_special_product();
    specialProduct.add_special_product(request.getParameter("featuredProduct"),"featured");
    specialProduct.add_special_product(request.getParameter("chooseProduct1"),"popular");
    specialProduct.add_special_product(request.getParameter("chooseProduct2"),"popular");
    specialProduct.add_special_product(request.getParameter("chooseProduct3"),"popular");
    specialProduct.add_special_product(request.getParameter("chooseProduct4"),"popular");
    specialProduct.add_special_product(request.getParameter("chooseProduct5"),"popular");
    specialProduct.add_special_product(request.getParameter("chooseProduct6"),"popular");
    
    response.sendRedirect("admin.jsp");
%>