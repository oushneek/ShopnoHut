<%-- 
    Document   : admin_header
    Created on : Jun 5, 2014, 7:25:51 AM
    Author     : Tazbeea Tazakka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="jspcode.*" %>

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
						<strong>BDT</strong>
					</div>
					<div class="span2">
                                            
                                            <a href="admin.jsp"><h4>Admin Page</h4></a>
                                          
					</div>					
					<div class="span3 customer_service">
						<!--<h4>FREE delivery on ALL orders</h4>
						<h4><small>Customer service: 0800 8475 548</small></h4>-->
                                                <a href="user_logout.jsp">Logout</a>
                                         
                                                
                                                
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
