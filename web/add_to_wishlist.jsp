<%-- 
    Document   : add_to_wishlist
    Created on : May 14, 2014, 2:00:33 PM
    Author     : Tazbeea Tazakka
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="wishlist.*" %>
<%
String product_code=request.getParameter("product_code");

    
    Calendar currentdate=Calendar.getInstance();
    SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd");
    String dateNow=formatter.format(currentdate.getTime());
    
    add_wishlist.add_to_wishlist(product_code,dateNow);
    
    response.sendRedirect(session.getAttribute("back_url").toString());
%>