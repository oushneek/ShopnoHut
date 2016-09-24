<%-- 
    Document   : product
    Created on : Apr 23, 2014, 2:02:38 PM
    Author     : Tazbeea Tazakka
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="jspcode.*" %>
<%@page  import= "getQuery.getQuery" %>
<!DOCTYPE html>
<!-- Include the Header -->               
 <%@ include file="main_component/header.jsp" %>
		
<!-- Include the Menu -->
<%@ include file="main_component/menu.jsp" %>
                    
 <!-- Include the Sidebar -->               
 <%@ include file="main_component/sidebar.jsp" %>
 
 <%
    String product_code=new String();
    product_code=request.getParameter("product_code");
        
    ArrayList<String> product_details=new ArrayList<String>();
    ArrayList<String> subcat=new ArrayList<String>();
    ArrayList<String> category=new ArrayList<String>();
    
    product_details=getQuery.getProductDetails(product_code);
    category=getQuery.getCategoryOFProduct(product_code); 

    subcat=getQuery.getSubCategoryOFProduct(category.get(0), product_code); 
    
 %>
 
 <div class="span9">
     <ul class="breadcrumb">
         <%
         
            out.print("<li><a href='category.jsp?categoryid="+category.get(0)+"&page=1'>"+category.get(1)+"</a><span class='divider'>>></span></li>");

            out.print("<li><a href='subcategory.jsp?categoryid="+category.get(0)+"&subcategoryid="+subcat.get(0)+"&page=1'>"+subcat.get(1) +"</a><span class='divider'>>></span></li>");
         %>
         
     </ul>
    <div class="row">
		 <div class="span9">
                        <%
                            out.println("<h1>" +product_details.get(2) + "</h1>");
                        %>
		 </div>
                
    </div>
                 <hr>
                 
     <div class="row">
		 <div class="span3">
                     <img alt="" src="<%out.print("images/"+product_details.get(3));%>" />
			
			
			

		</div>	 
	  
	  <div class="span6">
	  
		<div class="span6">
			<address>
				
                                <%
                                out.print("<strong>Details :</strong><br/> <p>"+product_details.get(6)+"</p>");
                                %>
			</address>
		</div>	
				
		<div class="span6">
			<h2>
                            <%Double price=Double.parseDouble(product_details.get(4));
                              Double discount=Double.parseDouble(product_details.get(5));
                              Double selling_price=price-discount;%>
                            <strong>Price: <%out.print(selling_price); %><br />
			</h2>
                        <%
                        int quantity=Integer.parseInt(product_details.get(7));
                            if(quantity>0){
                            out.print("<h4>Available</h4></a>");
                        }
                        else
                        out.print("<h4>OUT OF STOCK</h4></a>");
                        %>
                        <br/>
		</div>	
		
		<div class="span6">
			<form class="form-inline">
				<div class="span2 no_margin_left">
                                        <%
                                            out.print("<a class='btn btn-primary' href='add_to_cart.jsp?product_code="+product_code+"&product_name="+product_details.get(2) +"&unit_price="+product_details.get(4)+"'>Add to cart</a>");
                                            
                                        %>
                                </div>	
				<div class="span1">
				- OR -
				</div>	
				<div class="span2">
					<!--<p><a href="#">Add to Wish List</a></p>-->
                                        <%
                                            if(session.getAttribute("user_name")!=null){
                                                out.print("<p><a class='' href='add_to_wishlist.jsp?product_code="+product_code+"'>Add to Wish List</a></p>");
                                            }
                                            else
                                                out.print("<p><a class='' href='user_login.jsp'>Add to Wish List</a></p>");

                                        
                                        %>
                                       
				</div>	
			</form>
		</div>	
		
		
		
		
	  </div>	

     </div>
 </div>
</div>
 <%@ include file="main_component/footer.jsp" %>

 </div>
                     
