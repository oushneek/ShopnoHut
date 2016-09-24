<%-- 
    Document   : confirm_pending_order
    Created on : May 15, 2014, 4:13:37 AM
    Author     : Tazbeea Tazakka
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jspcode.DBConnect" %>

<!-- Include the Header -->                   
 <%@ include file="main_component/admin_header.jsp" %>
<!-- Include the Menu -->
<%@ include file="main_component/admin_menu.jsp" %>
<!-- Include the sidebar -->
<%@ include file="main_component/admin_sidebar.jsp" %>


<div class="span9">
    
    <ul class="breadcrumb">PENDING ORDER</ul>
    
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

int pageid=Integer.parseInt(request.getParameter("page"));
 
 int pageprev=pageid-1;
 int pagenext=pageid+1;
 int num_of_product=DBConnect.countorder();


    ArrayList<String> pending_order=DBConnect.getPendingOrder(pageid);
    if(pending_order.size()==0){
        out.print("No new orders Pending");
    }
    else{
    for(int i=0;i<pending_order.size();i=i+1){
        out.print("<div class='row'>");
        String order_id=pending_order.get(i);
        out.print("<div class='span2' ><p><b>ORDER NO : </b>: "+pending_order.get(i)+"</div>");
        i=i+1;
        out.print("<div class='span4'><p><b> Product</b> ID : "+pending_order.get(i)+"</p>");
        i=i+1;
        out.print("<p><b>"+pending_order.get(i)+"</b></p></div>");
        i=i+1;
        out.print("<div class='span3'><p><b> Date </b>: "+pending_order.get(i)+"</p></div></br>");
        i=i+1;
        out.print("<div class='span9'><p><b> <u>USER INFORMATION</u> : </b></p></div></br>");
        out.print("<div class='span2'><p><b>ID : </b>"+pending_order.get(i) +"</p></div>");
        i=i+1;
        out.print("<div class='span4'><p><b>Name : </b>"+pending_order.get(i) +"</p></div>");
        i=i+1;
        out.print("<div class='span3'><p><b>Email : </b>"+pending_order.get(i) +"</p></div>");
        i=i+1;
        out.print("<div class='span2'><p><b>Phone : </b>"+pending_order.get(i) +"</p></div>");
        i=i+1;
        out.print("<div class='span4'><p><b>Address: </b>"+pending_order.get(i) +"</p></div>");
        out.print("<div class='span3'><a class='btn btn-primary' href='confirm_order_sent.jsp?order_id="+order_id+"'>Order Sent<br></a></div></div><hr>");
    }
    }
    
%>

<div class="pagination">
    <ul>
        <%if(pageid>1){%>
    <li><a href=<% out.print("'confirm_pending_order.jsp?page="+pageprev+"'>Prev");%></a></li>
    <%}%>
    
     <%if(num_of_product>(pageid*10))
            {
     %>
    <li class="active"><a href=<%  out.print("'confirm_pending_order.jsp?page="+pageid+"'>"+pageid);%></a></li>
    
   
    <li><a href=<%  out.print("'confirm_pending_order.jsp?page="+pagenext+"'> Next");%></a></li>
    
    <%}%>
    </ul>
    </div>	

</div>