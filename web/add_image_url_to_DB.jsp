<%-- 
    Document   : add_image_url_to_DB
    Created on : May 22, 2014, 7:44:24 AM
    Author     : Tazbeea Tazakka
--%>

<%@page import="jspcode.Global"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="addNewType.addNewType" %>
<%
    String image_url=Global.image;
    //out.print("image name"+image_url);
    int code=addNewType.countProduct();
    addNewType.add_new_product_image(image_url,code);
    response.sendRedirect("admin.jsp");
    
%>