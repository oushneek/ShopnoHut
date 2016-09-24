<%-- 
    Document   : login_during_cart
    Created on : May 14, 2014, 11:11:27 PM
    Author     : Tazbeea Tazakka
--%>

<%@page import="jspcode.Global"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jspcode.DBConnect" %>
<%@page import="guest.guest" %>


<%
    ArrayList<String> get_cart=DBConnect.getCartHistory(null, Integer.toString(Global.guest_id));
    
    Calendar currentdate=Calendar.getInstance();
    SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd");
    String dateNow=formatter.format(currentdate.getTime());
    
    for(int i=0;i<get_cart.size();i++){
        String code=get_cart.get(i);i++;
        String name=get_cart.get(i);i++;
        String price=get_cart.get(i);i++;
        String discount=get_cart.get(i);i++;
        String quantity=get_cart.get(i);
        out.print(code+" "+name+" "+quantity+" "+price);
        
        DBConnect.insertIntoCart(code, price,quantity, dateNow, session.getAttribute("user_id").toString(), null);
        
    }
    DBConnect.delete_guest_cart(session.getAttribute("guest_id").toString());
    guest.delete_guest_ID(session.getAttribute("guest_id").toString());
        response.sendRedirect("show_cart.jsp");

%>
