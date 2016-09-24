<%-- 
    Document   : wishlist
    Created on : May 12, 2014, 7:49:34 AM
    Author     : Tazbeea Tazakka
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="getQuery.getQuery" %>

 <!-- Include the Header -->                   
 <%@ include file="main_component/header.jsp" %>
<!-- Include the Menu -->
<%@ include file="main_component/menu.jsp" %>
<!-- Include the sidebar -->
<%@ include file="main_component/sidebar.jsp" %>

<div class="span9">
    <ul class="breadcrumb">Cart</ul>
<%
    String product_code=request.getParameter("product_code");
    String product_name=request.getParameter("product_name");
    String unit_price=request.getParameter("unit_price");
    System.out.println("product code at add_to_cart.jsp "+product_code);
    DBConnect product=new DBConnect();
    //ArrayList<String> productDetails= product.getProductDetails(product_code);
    
    Calendar currentdate=Calendar.getInstance();
    SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd");
    String dateNow=formatter.format(currentdate.getTime());
    
    if(Global.user_id==0){
        product.insertIntoCart(product_code, unit_price,"1", dateNow,null,session.getAttribute("guest_id").toString());

    }
    else{
        product.insertIntoCart(product_code, unit_price,"1", dateNow,session.getAttribute("user_id").toString(),null);
    }
    
    response.sendRedirect("show_cart.jsp");
%>
    
		
        
	  
      </div>
 <!-- Include the Footer -->               
 <%@ include file="main_component/footer.jsp" %>

</div> <!-- /container -->

