<%-- 
    Document   : update_cart
    Created on : May 14, 2014, 10:33:17 PM
    Author     : Tazbeea Tazakka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jspcode.DBConnect" %>
<!DOCTYPE html>
<!-- Include the Header -->                   
 <%@ include file="main_component/header.jsp" %>
<!-- Include the Menu -->
<%@ include file="main_component/menu.jsp" %>
<!-- Include the sidebar -->
<%@ include file="main_component/sidebar.jsp" %>



<%

    String total=DBConnect.getProductQty(request.getParameter("product_code"));
    Double totalqty=Double.parseDouble(total);
    if(totalqty>=Double.parseDouble(request.getParameter("quantity"))){
        if(Global.user_id==0){
            DBConnect.update_cart(request.getParameter("product_code"), request.getParameter("quantity"), null, session.getAttribute("guest_id").toString());
        }
        else
            DBConnect.update_cart(request.getParameter("product_code"), request.getParameter("quantity"), session.getAttribute("user_id").toString(),null);


        response.sendRedirect("show_cart.jsp");
    }

    else
       response.sendRedirect("show_cart.jsp");

%>


</div>
 <!-- Include the Footer -->               
 <%@ include file="main_component/footer.jsp" %>

</div> <!-- /container -->

