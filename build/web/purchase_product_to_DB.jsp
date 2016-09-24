<%-- 
    Document   : purchase_product_to_DB
    Created on : May 11, 2014, 11:23:00 AM
    Author     : Tazbeea Tazakka
--%>

<%@page import="jspcode.Global"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import=" purchaseProduct.purchaseProduct"%>


        <%
            
            Calendar currentdate=Calendar.getInstance();
            SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd");
            String dateNow=formatter.format(currentdate.getTime());
            
            purchaseProduct.update_purchase_history(request.getParameter("unit_cost"), request.getParameter("quantity"), dateNow);
            
            String purchase_id=purchaseProduct.getLastPurchaseId();
            
            purchaseProduct.update_product_info(request.getParameter("chooseProduct"),request.getParameter("quantity") , request.getParameter("selling_price"));
            purchaseProduct.insert_into_relational_table(purchase_id,request.getParameter("chooseProduct"));
            
            int qty=Integer.parseInt(request.getParameter("quantity"));
            for(int i=0;i<qty;i++){
                purchaseProduct.create_product_id(purchase_id,request.getParameter("chooseProduct"));
            }
           // Global.purchaseID++;
            
            response.sendRedirect("admin.jsp");
        %>
    