<%-- 
    Document   : profit
    Created on : May 17, 2014, 1:15:38 PM
    Author     : Tazbeea Tazakka
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jspcode.DBConnect" %>

<!-- Include the Header -->                   
 <%@ include file="main_component/admin_header.jsp" %>
<!-- Include the Menu -->
<%@ include file="main_component/admin_menu.jsp" %>
<!-- Include the sidebar -->
<%@ include file="main_component/admin_sidebar.jsp" %>


<div class="span9">
    
    <ul class="breadcrumb">Transaction History and Account Balance</ul>
    
<% 

if(session.getAttribute("user_type") == null)
    {

        response.sendRedirect("user_login.jsp");
    }
    else {
        if(!(session.getAttribute("user_type").toString().equals("1"))){
           response.sendRedirect("user_login.jsp");

        }
    }


int pageid=Integer.parseInt(request.getParameter("page"));
 
 int pageprev=pageid-1;
 int pagenext=pageid+1;
 int num_of_profit=DBConnect.countprevorder();

    ArrayList<String> profit_history=DBConnect.getProfit();
    if(profit_history.size()==0){
        out.print("No Transaction done yet.");
    }
    else{
        out.print("<div class='9'><h4>The profit shown here should be same as the profit after sending the orders and receiving payments if the prices are just as shown.</h4> </div><hr></br>");
    for(int i=0;i<profit_history.size();i=i+1){
        out.print("<div class='row'>");
        String order_id=profit_history.get(i);
        out.print("<div class='span3' ><p><b>TRANSACTON ID : </b>: "+profit_history.get(i)+"</div>");
        i=i+1;
        out.print("<div class='span3'><p><b> Product</b> ID : "+profit_history.get(i)+"</p></div>");
        i=i+1;
        out.print("<div class='span3'><p><b>"+profit_history.get(i)+"</b></p></div>");
        i=i+1;
        out.print("<div class='span3'><p><b>Buying Price : </b>"+profit_history.get(i) +"</p></div>");
        i=i+1;
        out.print("<div class='span3'><p><b>Selling Price : </b>"+profit_history.get(i) +"</p></div>");
        i=i+1;
        out.print("<div class='span3'><p><b>Total Profit : </b>"+profit_history.get(i) +"</p></div></br>");
         i=i+1;
        out.print("<div class='span9'><p><b> Date </b>: "+profit_history.get(i)+"</p></div></div><hr>");

    }
    }
    
%>

</div>