<%-- 
    Document   : remove_from_cart
    Created on : May 15, 2014, 9:41:01 AM
    Author     : Tazbeea Tazakka
--%>

<%@page import="jspcode.Global"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jspcode.DBConnect" %>
<!DOCTYPE html>

<%
    String product_code=request.getParameter("product_code");
    if(Global.user_id==0){
        DBConnect.delete_item_from_my_cart(product_code, null, session.getAttribute("guest_id").toString());
    }
    else
        DBConnect.delete_item_from_my_cart(product_code,session.getAttribute("user_id").toString(),null);
    
    response.sendRedirect(session.getAttribute("back_url").toString());
%>
