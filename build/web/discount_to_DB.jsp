<%-- 
    Document   : discount_to_DB
    Created on : May 12, 2014, 12:08:28 AM
    Author     : Tazbeea Tazakka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="getQuery.getQuery"%>



<!DOCTYPE html>
<%
    discount.discount.add_discount_to_product(request.getParameter("chooseProduct"), request.getParameter("discount"));
    
    response.sendRedirect("admin.jsp");
%>