<%-- 
    Document   : header
    Created on : Jan 23, 2014, 11:24:02 AM
    Author     : Tazbeea Tazakka
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="jspcode.*" %>
<%@page  import="getQuery.getQuery"%>
<%@page  import="guest.guest"%>


<!DOCTYPE html>
<%
        ArrayList<String> cart=new ArrayList<String>();
        if(session.getAttribute("guest_id")==null ){
            guest.create_guest();
            int guestid=Integer.parseInt(guest.getLastGuestId());
            
            session.setAttribute("guest_id",guestid);
            Global.guest_id=guestid;
            
        }
        
        if(Global.user_id==0){
            cart=DBConnect.getCartHistory(null, session.getAttribute("guest_id").toString()); 
        }
        else{
            cart=DBConnect.getCartHistory(session.getAttribute("user_id").toString(), null);
        }
        
        Global.cart_count=(cart.size()+1)/5;
%>
<html lang="en"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <title>Shopnohut ::. Online Shopping Makes Life Easier </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Online Shopping Makes Life Easier">
    <meta name="author" content="Tazbeea Tazakka,Md. Asifuzzaman Hridoy">

    <!-- Le styles -->
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
    <link id="switch_style" href="bootstrap/css/united/bootstrap.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
    <link href="css/jquery.rating.css" rel="stylesheet">
    

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

  </head>

  <body>

    <div class="container">
		<div class="row"><!-- start header -->
			<div class="span4 logo">
			<a href="index.jsp">
                            <%
                               String head = new String();
                               siteinfo site= new siteinfo();
                               head=site.headar();
                               
                            %>
                            <h1><% out.write(head); %></h1>
                            
			</a>
                            <!--<h5>
                                Online Shopping Makes Life Easier
                            </h5>-->
                            <h4>FREE delivery on ALL orders</h4>
                            <h4><small>Customer service: +880 1678 137313</small></h4>
			</div>
			<div class="span8">
			
				<div class="row">
					<div class="span1">&nbsp;</div>
					<div class="span2">
						<h4>Currency</h4>
						<a href="#"><strong>BDT</strong></a> 
					</div>
					<div class="span2">
                                            <%if(Global.user_type_id!=1)
                                            {
                                            
                                            %>
                                            <a href="show_cart.jsp"><h4>Shopping Cart (<%out.print(Global.cart_count);%>) </h4></a>
                                            <%}
                                            else if(Global.user_type_id==1){
                                            %>
                                            <a href="admin.jsp"><h4>Admin Page</h4></a>
                                            <%}%>
						<!--<a href="cart.html">2 item(s) - $40.00</a>-->
                                                <%
                                                    if(session.getAttribute("user_name")!=null && Global.user_type_id!=1 )
                                                    {
                                                %>
                                                <a href="my_profile.jsp"><%out.print("Welcome "+session.getAttribute("user_name"));%></a>
                                                
                                                <%
                                                    }
                                                    else if(Global.user_type_id==1){
                                                    
                                                %>
                                                
                                                <a href="admin.jsp"><%out.print("Welcome "+session.getAttribute("user_name"));%></a>
                                                
                                                <%
                                                    }
                                                %>
					</div>					
					<div class="span3 customer_service">
						<!--<h4>FREE delivery on ALL orders</h4>
						<h4><small>Customer service: 0800 8475 548</small></h4>-->
                                                <%
                                                if(session.getAttribute("user_name") != null){
                                                %>
                                                <a href="user_logout.jsp">Logout</a>
                                                <% }
                                                else{ %>
                                                <a href="user_login.jsp">Log In</a> |
                                                <a href="user_registration.jsp">Register</a>
                                                <% }%>
                                                
                                                
					</div>
				</div>
				<br />
				<div class="row">
                                    <div class="pull-right">
                                        <h5>
                                            Online Shopping Makes Life Easier
                                        </h5>
                                    </div>
                                    
                                   <!-- <div class="links pull-right">
					<a href="index.html">Home</a> |
					<a href="two-column.html">About</a> |	
                                        <a href="contact_us.jsp">Contact</a>
                                    </div>-->
				
				</div>
			</div>
		</div><!-- end header -->

                <%
                //previous page detection
                String previousUrl= "";
                if(session.getAttribute("back_url") != null){
                    previousUrl=session.getAttribute("back_url").toString();
                }
                if(!request.getRequestURI().toString().equals("/Shopnohut/user_login.jsp") && !request.getRequestURI().toString().equals("/Shopnohut/login_check.jsp")  && (!request.getRequestURI().toString().equals("/Shopnohut/user_registration.jsp"))  && (!request.getRequestURI().toString().equals("/Shopnohut/add_to_wishlist.jsp")) && (!request.getRequestURI().toString().equals("/Shopnohut/update_cart.jsp")))
                {
                    if(request.getQueryString()!=null)
                        session.setAttribute("back_url", request.getRequestURL()+"?"+request.getQueryString()); 
                    else
                        session.setAttribute("back_url", request.getRequestURL());
                }
                
                %>