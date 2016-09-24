<%-- 
    Document   : menu.jsp
    Created on : Jan 23, 2014, 11:34:23 AM
    Author     : Tazbeea Tazakka
--%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="jspcode.*" %>


		<div class="row"><!-- start nav -->
			<div class="span12">
			  <div class="navbar">
					<div class="navbar-inner">
					  <div class="container" style="width: auto;">
						<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
						  <span class="icon-bar"></span>

						  <span class="icon-bar"></span>
						  <span class="icon-bar"></span>
						</a>
						<div class="nav-collapse">
						  <ul class="nav">
                                                      <li><a href="index.jsp">HOME</a></li>
                                                      
                                                      <li><a href="contact_us.jsp">CONTACT</a>
                                                      <li><a href="show_cart.jsp">SHOPPING CART</a></li>
                                                      
                                                      <li><a href="about_us.jsp">ABOUT US</a></li>
                                                      <%
                                                          if(Global.user_id!=0)
                                                              out.print("<li><a href='my_profile.jsp'>MY PROFILE</a></li>");
                                                      %>
                                                          
                                                          
                                                          
                                                          
                                                    
							  <!--<li class="dropdown">
							  <a href="category.html" class="dropdown-toggle" data-toggle="dropdown">Desktops <b class="caret"></b></a>
							  <ul class="dropdown-menu">
								<li><a href="listings.html">PC</a></li>
								<li><a href="listings.html">Mac</a></li>
								<li class="divider"></li>
								<li class="nav-header">Accessories</li>
								<li><a href="listings.html">Keyboard</a></li>
								<li><a href="listings.html">Speakers</a></li>
							  </ul>
							</li>
							<li><a href="category.html">Laptops</a></li>

							<li><a href="category.html">Components</a></li>
							<li><a href="category.html">Tablets</a></li>
							<li class="dropdown">
							  <a href="category.html" class="dropdown-toggle" data-toggle="dropdown">Software <b class="caret"></b></a>
							  <ul class="dropdown-menu">
								<li><a href="listings.html">Business & Office</a></li>
								<li><a href="listings.html">Children's Fun & Learning</a></li>
								<li><a href="listings.html"> Digital Imaging</a></li>
								<li class="divider"></li>
								<li class="nav-header">PC Games</li>
								<li><a href="listings.html">Action & Shooter</a></li>
								<li><a href="listings.html">Adventure</a></li>
								<li><a href="listings.html">Fighting</a></li>
							  </ul>
							</li>
							 <li><a href="listings.html">Phones &amp; PDAs</a></li>-->

						  </ul>

						  <ul class="nav pull-right">
						   <li class="divider-vertical"></li>
							<form class="navbar-search" action="search_from_DB.jsp">
								<input type="text" name="search" class="search-query span4" placeholder="Search">
								<button class="btn btn-primary btn-small search_btn" type="submit">Go</button>
							</form>
							
						  </ul>
						</div><!-- /.nav-collapse -->
					  </div>
					</div><!-- /navbar-inner -->
				</div><!-- /navbar -->
			</div>
		</div><!-- end nav -->	 <div class="row">
