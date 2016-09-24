<%-- 
    Document   : place_order
    Created on : May 13, 2014, 4:53:28 PM
    Author     : Tazbeea Tazakka
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="jspcode.*" %>
<%@page  import= "getQuery.getQuery" %>
<%@page import="userInfo.userInfo" %>

<%
    if(session.getAttribute("user_name")==null)
        response.sendRedirect("user_login.jsp");

%>

 <%@ include file="main_component/header.jsp" %>
		
<!-- Include the Menu -->
<%@ include file="main_component/menu.jsp" %>

<%@ include file="main_component/sidebar.jsp" %>

<%
    String get_address=request.getParameter("address");
    String new_address=null;
    if (get_address.equals("new")){
        new_address=request.getParameter("new_address");
        out.print(new_address);
    }
    
    Calendar currentdate=Calendar.getInstance();
        SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd");
        String dateNow=formatter.format(currentdate.getTime());
    ArrayList<String> cart=DBConnect.getCartHistory(session.getAttribute("user_id").toString(), null);
    for(int i=0;i<cart.size();i++){
        String code=cart.get(i);
        i=i+2;
        String price=cart.get(i);
        i=i+1;
        int quantity=Integer.parseInt(cart.get(i));
        
        for(int j=0;j<quantity;j++){
            
            String product_id=DBConnect.getFirstProductId(code);
            DBConnect.insertIntoOrderList(product_id, session.getAttribute("user_id").toString(), dateNow, new_address);
        
            DBConnect.updateProductQty(code, "1");
            String price_buy=DBConnect.getprice_buy(product_id);
            String price_sell=DBConnect.getprice_sell(product_id);
            System.out.print("price_buy"+price_buy);
            System.out.print("price_sell"+price_sell);
            DBConnect.create_transaction(product_id, price_buy, price_sell, dateNow);
            
            String transactionid=DBConnect.gettransactionId();
            DBConnect.create_account_balance(transactionid);
            
        }
        
        
    }
    
    
%>
<div class="span7"><h3>Dear customer, we have received your order.You will get these within 3 days. If you want to know or suggest something please <a href="contact_us.jsp">contanct us</a>.</h3>
</div>

</div>
<%@ include file="main_component/footer.jsp" %>
</div>