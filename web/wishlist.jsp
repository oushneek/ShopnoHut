<%-- 
    Document   : wishlist
    Created on : May 12, 2014, 7:49:34 AM
    Author     : Tazbeea Tazakka
--%>

<%@page import="wishlist.show_wishlist"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="getQuery.getQuery" %>
<%@page import= "wishlist.add_wishlist"%>

 <!-- Include the Header -->                   
 <%@ include file="main_component/header.jsp" %>
<!-- Include the Menu -->
<%@ include file="main_component/menu.jsp" %>
<!-- Include the sidebar -->
<%@ include file="main_component/sidebar.jsp" %>

<div class="span9">
    <ul class="breadcrumb">Wishlist</ul>
<%

int pageid=Integer.parseInt(request.getParameter("page"));
 
 int pageprev=pageid-1;
 int pagenext=pageid+1;
    String userid=session.getAttribute("user_id").toString();
    
 int num_of_product=show_wishlist.countwishlist(userid);
    ArrayList<String> wishlist= show_wishlist.wishlist(userid,pageid);
    ArrayList<String> product_details=new ArrayList();
    ArrayList<String> categoryid=new ArrayList<String>();
    
    
    for (int i=0;i<wishlist.size();i=i+1)
    {
            product_details=getQuery.getProductDetails(wishlist.get(i));
            categoryid=getQuery.getCategoryOFProduct(wishlist.get(i));
            out.print("<div class='row'>");
            
            out.print("<div class='span6'><a href='product_details.jsp?product_code="+wishlist.get(i)+"&categoryid="+categoryid.get(0) +"'>");
                    
            out.print("<h3>"+product_details.get(2) +"</h3></a>");
            out.print("<p>"+product_details.get(6)+"</p></div>");
            out.print("<div class='span1'><p>Tk "+product_details.get(4) +"</p></div>");
            int quantity=Integer.parseInt(product_details.get(7));
                if(quantity>0){
                    out.print("<h4>Available</h4></a>");
                }
                else
                    out.print("<h4>OUT OF STOCK</h4></a>");
                
            out.print("<div class='span2'><p><a class='btn btn-primary' href='add_to_cart.jsp?product_code="+wishlist.get(i) +"&product_name="+product_details.get(2)+"&unit_price="+product_details.get(4)+"'>Add to cart</a></p>"); 
            i=i+1;
            out.print("<p>Date : "+wishlist.get(i) +"</p><p><form method='post' action='remove_from_wishlist.jsp?product_code="+wishlist.get(i-1)+"' ><input type='image' style='height:12px;width:12px ' src='images/profile_photo/remove.jpg' alt='Submit Form/'></form></p></div></div><hr />");
            product_details.clear();
            categoryid.clear();
    
    }
    
%>
   
       
	  
	     
		</div>
	  
<div class="pagination">
    <ul>
        <%if(pageid>1){%>
    <li><a href=<% out.print("'wishlist.jsp?page="+pageprev+"'>Prev");%></a></li>
    <%}%>
    
     <%if(num_of_product>(pageid*10))
            {
     %>
    <li class="active"><a href=<%  out.print("'wishlist.jsp?page="+pageid+"'>"+pageid);%></a></li>
    
   
    <li><a href=<%  out.print("'wishlist.jsp?page="+pagenext+"'> Next");%></a></li>
    
    <%}%>
    </ul>
    </div>		
		  
		  
</div>  
		
        
	  
      </div>
 <!-- Include the Footer -->               
 <%@ include file="main_component/footer.jsp" %>

</div> <!-- /container -->

