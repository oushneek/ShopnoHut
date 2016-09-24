<%-- 
    Document   : show_cart
    Created on : May 14, 2014, 9:25:34 PM
    Author     : Tazbeea Tazakka
--%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Include the Header -->                   
 <%@ include file="main_component/header.jsp" %>
<!-- Include the Menu -->
<%@ include file="main_component/menu.jsp" %>
<!-- Include the sidebar -->
<%@ include file="main_component/sidebar.jsp" %>


<div class="span9">
    <ul class="breadcrumb">Cart</ul>
<%
    Double total_price=0.00;
    ArrayList<String> cart_list=new ArrayList<String>();
    if(Global.user_id==0){
        cart_list=DBConnect.getCartHistory(null, session.getAttribute("guest_id").toString()); 
    }
    else{
        cart_list=DBConnect.getCartHistory(session.getAttribute("user_id").toString(), null);
    }
        String continue_shopping=session.getAttribute("back_url").toString();


if(cart_list.size()==0){
    out.print("<div class='span9'> <p> No items added in the cart.</p></div>");
}
else{
    for (int i=0;i<cart_list.size();i=i+2)
        {
                String categoryid=getQuery.getCategoryOFProduct(cart_list.get(i)).get(0);
                String code=cart_list.get(i);
                out.print("<div class='row'>");

                out.print("<div class='span2'><a href='product_details.jsp?product_code="+cart_list.get(i)+"&categoryid="+categoryid +"'>");
                 i=i+1;//name       
                out.print("<p>"+cart_list.get(i) +"</p></a></div>");

                i=i+3;//quantity
                Double qty=Double.parseDouble(cart_list.get(i));
                String total=DBConnect.getProductQty(code);
                Double totalqty=Double.parseDouble(total);
                if(totalqty<qty)
                    out.print("<div class='span6' ><form method='post' action='update.jsp?product_code="+code+"'>Quantity : <input class='span1' type='text' name='quantity' value='Not Available'><input type='Submit' value='Change'></form></div>");
                else
                    out.print("<div class='span3' ><form method='post' action='update_cart.jsp?product_code="+code+"'>Quantity : <input class='span1' type='text' name='quantity' value='"+cart_list.get(i) +"'><input type='Submit' value='Change'></form></div>");
                i=i-2;//price 
                Double selling_price=Double.parseDouble(cart_list.get(i));
                i=i+1;
                Double discount=Double.parseDouble(cart_list.get(i));
                Double price=selling_price-discount;
                out.print("<div class='span2'><p>Tk "+qty*price+"</p></div>");
                out.print("<div class='span2'><form method='post' action='remove_from_cart.jsp?product_code="+code+"' ><input type='image' style='height:12px;width:12px ' src='images/profile_photo/remove.jpg' alt='Submit Form/'></form></div></div>");

                total_price=total_price+(qty*price);


                categoryid="";
                out.print("<hr>");

        }
Global.cart_count=(cart_list.size()+1)/5;
out.print("<hr>");
                out.print("<div class='span7'><p class='span3 pull-right'>Total price = Tk."+total_price+"</p></div></br>");

//    for(int i=0;i<cart.size();i++)
//        out.print(cart.get(i)+" </br>");
//    
%>
   
     
	  
		<!--<a href="<%//out.print(continue_shopping);%>"><h4>Continue shopping</h4>    </a>-->
                <%
                
                    out.print("<div class='span9'>");
                    if(session.getAttribute("user_name")==null)
                        out.print("<a class='btn btn-primary' href='user_login.jsp'>Place Order<br></a></div>");
                    else
                        out.print("<a class='btn btn-primary' href='confirm_address.jsp'>Place Order<br></a></div>");
                    
                    
}
                %>
   
       
	  
	     
	  
		
		  
		  
</div>  
		
        
	  
      </div>
 <!-- Include the Footer -->               
 <%@ include file="main_component/footer.jsp" %>

</div> <!-- /container -->

