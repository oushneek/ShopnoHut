<%-- 
    Document   : index
    Created on : Nov 8, 2013, 2:53:58 PM
    Author     : Tazbeea Tazakka
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="jspcode.*" %>
<%@page import= "getQuery.getQuery" %>


 <!-- Include the Header -->               
 <%@ include file="main_component/header.jsp" %>
		
<!-- Include the Menu -->
<%@ include file="main_component/menu.jsp" %>
                    
 <!-- Include the Sidebar -->               
 <%@ include file="main_component/sidebar.jsp" %>
 
 
 <!-- Category Choice Reveive -->
 <%
 String categoryid = new String();
 String subcategoryid = new String();
 
 
 categoryid = request.getParameter("categoryid");
 subcategoryid = request.getParameter("subcategoryid");
 int pageid=Integer.parseInt(request.getParameter("page"));
 
 int pageprev=pageid-1;
 int pagenext=pageid+1;
 
 ArrayList<String> sc_list = getQuery.getSubCategory(categoryid);
 ArrayList<String> product_list=getQuery.getProductDetailsCategory(categoryid,pageid);
 
 int num_of_product=getQuery.countProductCategory(categoryid);
 
 
 String product_code=new String();
 
 %>
                 
        <div class="span9">
		     <ul class="breadcrumb">
    <%
            if (sc_list.size()==0)
                out.print("<h4>No Subcategory added.</h4>");
            else{
                for (int i=0;i<sc_list.size();i++){
                  if (i%2 != 0)    
                    {
                       out.print("<li ><a href='subcategory.jsp?categoryid="+categoryid+"&subcategoryid="+sc_list.get(i-1)+"&page=1' >"+sc_list.get(i)+"</a><span class='divider'>/</span></li>");
                    
                    }
                }
            }
     %>                     
                         


    </ul>
<%
         if(product_list.size()==0)
             out.print("<h3>No product currently availabe</h3>");
         else{
            for(int i=0;i<product_list.size();i=i+3)
            {
                out.print("<div class='row' >");
                
                product_code=product_list.get(i);
                out.print("<div class='span6'><a href='product_details.jsp?product_code="+product_code+"&categoryid="+categoryid+"'>");
                i=i+2;
                    //name
                String product_name=product_list.get(i);
                out.print("<h3>"+product_list.get(i) +"</h3></a>");
                i=i+4;
                    //description
                out.print("<p>"+product_list.get(i)+"</p></div>");
                i=i-2;
                    //price
                String unit_price=product_list.get(i);
                Double price=Double.parseDouble(unit_price);
                Double discount=Double.parseDouble(product_list.get(i+3));
                Double selling_price=price-discount;
                
                out.print("<div class='span3'><p>Tk "+selling_price +"</p></div>");
                i=i+1;
                    //qantity
                int quantity=Integer.parseInt(product_list.get(i));
                if(quantity>0){
                    out.print("<div class='span3'><h4>Available</h4></div>");
                }
                else
                    out.print("<div class='span3'><h4>OUT OF STOCK</h4></div>");
                out.print("<div class='span3'><p><a class='btn btn-primary' href='add_to_cart.jsp?product_code="+product_code+"&product_name="+product_name+"&unit_price="+unit_price+"'>Add to cart</a></p>"); 
                
                
                if(session.getAttribute("user_name")!=null){
                    out.print("<p><a class='' href='add_to_wishlist.jsp?product_code="+product_code+"'>Add to Wish List</a></p></div></div><hr />");
                }
                else
                    out.print("<p><a class='' href='user_login.jsp'>Add to Wish List</a></p></div></div><hr />");
                
                

            }  
         }
         
%>	
	
	  	 
	      <div class="pagination">
    <ul>
        <%if(pageid>1){%>
    <li><a href=<% out.print("'category.jsp?categoryid="+categoryid+"&page="+pageprev+"'>Prev");%></a></li>
    <%}%>
    
     <%if(num_of_product>(pageid*10))
            {
     %>
    <li class="active"><a href=<%  out.print("'category.jsp?categoryid="+categoryid+"&page="+pageid+"'>"+pageid);%></a></li>
    
   
    <li><a href=<%  out.print("'category.jsp?categoryid="+categoryid+"&page="+pagenext+"'> Next");%></a></li>
    
    <%}%>
    </ul>
    </div>
		</div>
		  
		  
		  
		
        
	  
      </div>
 <!-- Include the Footer -->               
 <%@ include file="main_component/footer.jsp" %>

</div> <!-- /container -->


