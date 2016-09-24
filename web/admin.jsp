<%-- 
    Document   : index
    Created on : Nov 8, 2013, 2:53:58 PM
    Author     : Tazbeea Tazakka
--%>
<%
    if(session.getAttribute("user_type") == null)
    {

        response.sendRedirect("user_login.jsp");
    }
    else {
        if(!(session.getAttribute("user_type").toString().equals("1"))){
           response.sendRedirect("user_login.jsp");

        }
    }
%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="jspcode.*" %>



 <!-- Include the Header -->               
 <%@ include file="main_component/admin_header.jsp" %>

<!-- Include the Menu -->
<%@ include file="main_component/admin_menu.jsp" %>
                    
 <!-- Include the Sidebar -->               
 <%@ include file="main_component/admin_sidebar.jsp" %>
                    
 <div class="span9">
     <ul class="breadcrumb"><h4>Administration</h4></ul>	
    
     <h4 class="span9" style="margin-bottom: 20px"><u>Customer Service :</u></h4><br>
     
     <p class="span5" style="font-size: 15px"><a href="confirm_pending_order.jsp?page=1">Confirm Pending Orders</a></p>
     <p class="span5" style="font-size: 15px "><a href="message.jsp?page=1">Customer Messages</a></p>
    
     <h4 class="span9" style="margin-top: 20px;margin-bottom: 20px"><u>Add New Types :</u></h4><br>
     
     <p class="span5" style="font-size: 15px"><a href="new_category.jsp">Add New Category</a></p>
     <p class="span5" style="font-size: 15px "><a href="new_sub_category.jsp">Add New Subcategory</a></p>
     <p class="span5" style="font-size: 15px"><a href="new_product.jsp">Add New Product</a></p>

     <h4 class="span9" style="margin-top: 20px;margin-bottom: 20px"><u>Purchase :</u></h4><br>
     
     <p class="span5" style="font-size: 15px"><a href="purchase_product.jsp">Purchase Product</a></p>
     
     <h4 class="span9" style="margin-top: 20px;margin-bottom: 20px"><u>Special Offers :</u></h4><br>
     
     <p class="span5" style="font-size: 15px "><a href="discount.jsp">Give Discount</a></p>
     <p class="span5" style="font-size: 15px"><a href="add_special_product.jsp">Add Special Products on First Page</a></p>

    <h4 class="span9" style="margin-top: 20px;margin-bottom: 20px"><u>Others :</u></h4><br>

    <p class="span5" style="font-size: 15px"><a href="previous_order.jsp?page=1">Previous sent Orders</a></p>
    <p class="span5" style="font-size: 15px "><a href="profit.jsp?page=1">Profit Accounts</a></p>
    <p class="span5" style="font-size: 15px"><a href="user_accounts.jsp?page=1">User Accounts</a></p>

   <!-- <ol>
        <li><a href="previous_order.jsp">Previous sent Orders</a></li>
        <li><a href="profit.jsp"><u>Profit Accounts</u></a></li>
        <li><a href="user_accounts.jsp">User Accounts</a></li>

    </ol>-->
 </div>
	  
      </div>
 <!-- Include the Footer -->               
 <%@ include file="main_component/footer.jsp" %>

</div> <!-- /container -->


