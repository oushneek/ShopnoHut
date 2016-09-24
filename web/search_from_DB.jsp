<%-- 
    Document   : index
    Created on : Nov 8, 2013, 2:53:58 PM
    Author     : Tazbeea Tazakka
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="jspcode.*" %>
<%@page import= "getQuery.getQuery" %>
<%@page import= "search.search" %>

<%Global.a=50; %>

 <!-- Include the Header -->               
 <%@ include file="main_component/header.jsp" %>
		
<!-- Include the Menu -->
<%@ include file="main_component/menu.jsp" %>
                    
 <!-- Include the Sidebar -->               
 <%@ include file="main_component/sidebar.jsp" %>
 
 
 <!-- Category Choice Reveive -->
 <%
    String search_for=request.getParameter("search");
    ArrayList<String> search_result_product=search.search(search_for);
 
 %>
                 
        <div class="span9">
		     <ul class="breadcrumb">
    <h4> Search Results</h4>            
                         


    </ul>
<%
          String product_code="" ;
          String product_name="" ;
         if(search_result_product.size()==0)
             out.print("<h3>No search result found</h3>");
         else{
            for(int i=0;i<search_result_product.size();i=i+3)
            {
                out.print("<div class='row'>");
                product_code=search_result_product.get(i);
                out.print("<div class='span6'><a href='product_details.jsp?product_code="+search_result_product.get(i));
                i=i+1;
                out.print("&categoryid="+search_result_product.get(i)+"'>");
                i=i+1;
                product_name=search_result_product.get(i);
                out.print("<h3>"+search_result_product.get(i) +"</h3></a>");//name
                
                i=i+4;
                    //description
                out.print("<p>"+search_result_product.get(i)+"</p></div>");//description
                i=i-2;
                    //price
                String unit_price=search_result_product.get(i);
                out.print("<div class='span1'><p>Tk "+search_result_product.get(i) +"</p></div>");
                i=i+1;
                    //qantity
                int quantity=Integer.parseInt(search_result_product.get(i));
                if(quantity>0){
                    out.print("<h4>Available</h4></a>");
                }
                else
                    out.print("<h4>OUT OF STOCK</h4></a>");
                if(session.getAttribute("user_name")!=null)
                    out.print("<div class='span2'><p><a class='btn btn-primary' href='add_to_cart.jsp?product_code="+product_code+"&product_name="+product_name+"&unit_price="+unit_price+"'>Add to cart</a></p>"); 
                else
                    out.print("<div class='span2'><p><a class='btn btn-primary' href='user_login.jsp'>Add to cart</a></p>");
                
                if(session.getAttribute("user_name")!=null){
                    out.print("<p><a class='' href='wishlist.jsp?product_code="+product_code+"&product_name="+product_name+"&unit_price="+unit_price+"&quantity="+quantity+"'>Add to Wish List</a></p></div></div><hr />");
                }
                else
                    out.print("<p><a class='' href='user_login.jsp'>Add to Wish List</a></p></div></div><hr />");

            }  
         }
         
%>	
	
	  	 
	  
	  
	      
		  
		  
		  
		
        
        </div>
      </div>
 <!-- Include the Footer -->               
 <%@ include file="main_component/footer.jsp" %>

</div> <!-- /container -->


