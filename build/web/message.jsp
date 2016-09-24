<%-- 
    Document   : message
    Created on : May 22, 2014, 10:35:28 AM
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
<%@page import="getQuery.getQuery" %>



 <!-- Include the Header -->               
 <%@ include file="main_component/admin_header.jsp" %>

<!-- Include the Menu -->
<%@ include file="main_component/admin_menu.jsp" %>
                    
 <!-- Include the Sidebar -->               
 <%@ include file="main_component/admin_sidebar.jsp" %>
                    
 <%
    
    int pageid=Integer.parseInt(request.getParameter("page"));
 
 int pageprev=pageid-1;
 int pagenext=pageid+1;
 int num_of_message=getQuery.countmessage();
    
    
 ArrayList<String> message=getQuery.getMessage(pageid);
 
 %>
 <div class="span9">
    <ul class="breadcrumb">Message</ul>
    <%
        for(int i=0;i<message.size();i++){
        
            out.print("<div class='row'>");
            out.print("<div class='span6'><b>Name : </b>"+message.get(i) +"</div>");
            i=i+1;
            out.print("<div class='span3'><b>Date : </b>"+message.get(i) +"</div>");
            i=i+1;
            out.print("<div class='span9'><b>Email : </b>"+message.get(i) +"</div>");
            i=i+1;
            out.print("<div class='span9'><b>Message : </b>"+message.get(i) +"<hr></div></br>");
            out.print("</div>");

        }
    
        %>
        
        
        
        <div class="pagination">
    <ul>
        <%if(pageid>1){%>
    <li><a href=<% out.print("'message.jsp?page="+pageprev+"'>Prev");%></a></li>
    <%}%>
    
     <%if(num_of_message>(pageid*10))
            {
     %>
    <li class="active"><a href=<%  out.print("'message.jsp?page="+pageid+"'>"+pageid);%></a></li>
    
   
    <li><a href=<%  out.print("'message.jsp?page="+pagenext+"'> Next");%></a></li>
    
    <%}%>
    </ul>
    </div>
        
 </div>