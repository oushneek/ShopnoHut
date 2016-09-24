<%-- 
    Document   : remove_from_wishlist
    Created on : May 15, 2014, 9:59:40 AM
    Author     : Tazbeea Tazakka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="wishlist.delete" %>
<!DOCTYPE html>

<%
    String product_code=request.getParameter("product_code");
    
    delete.delete_from_wishlist(product_code,session.getAttribute("user_id").toString());
    
    response.sendRedirect(session.getAttribute("back_url").toString());
%>
