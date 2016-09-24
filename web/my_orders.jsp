<%-- 
    Document   : my_orders
    Created on : May 17, 2014, 2:32:49 PM
    Author     : Tazbeea Tazakka
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jspcode.DBConnect" %>

<!-- Include the Header -->                   
 <%@ include file="main_component/header.jsp" %>
<!-- Include the Menu -->
<%@ include file="main_component/menu.jsp" %>
<!-- Include the sidebar -->
<%@ include file="main_component/sidebar.jsp" %>

<div class="span9">
    
    <ul class="breadcrumb">MY PREVIOUS ORDERS</ul>
    
    
<%
    ArrayList<String> my_order=DBConnect.getMyOrder(session.getAttribute("user_id").toString());
    if(my_order.size()==0){
        out.print("No orders Given yet.");
    }
    else{
    for(int i=0;i<my_order.size();i=i+1){
        out.print("<div class='row'>");
        out.print("<div class='span4' ><p><b>NAME : </b>: "+my_order.get(i)+"</div>");
        i=i+1;
        out.print("<div class='span3'><p><b> ADDRESS</b>: "+my_order.get(i)+"</p></div>");
        i=i+1;
        out.print("<div class='span2'><p><b> Date </b>: "+my_order.get(i)+"</p></div></div><hr>");
        
    }
    }


%>

</div>

</div>
 <!-- Include the Footer -->               
 <%@ include file="main_component/footer.jsp" %>

</div> <!-- /container -->


