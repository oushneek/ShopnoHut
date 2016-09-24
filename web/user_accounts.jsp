<%-- 
    Document   : user_accounts
    Created on : May 30, 2014, 10:33:59 AM
    Author     : Tazbeea Tazakka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="userInfo.userInfo" %>
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


<%
    ArrayList<String> user_info=userInfo.showUserInfo();
 %>

<!-- Include the Header -->                   
 <%@ include file="main_component/admin_header.jsp" %>
<!-- Include the Menu -->
<%@ include file="main_component/admin_menu.jsp" %>
<!-- Include the sidebar -->
<%@ include file="main_component/admin_sidebar.jsp" %>



<div class="span9">
    <ul class="breadcrumb">USER ACCOUNTS  </ul>

    
    <div class="span9">
	<form action="search_user_from_DB.jsp">
            <div class="span2">SEARCH USER : </div><div class="span3"><input type="text" name="search_user" class="search-query " placeholder="Search USER"></div>
            <div class="span1"><button class="btn btn-primary btn-small search_btn" type="submit">Go</button></div>
	</form>
        
    </div><hr>					
        
   
    
    <form> 
    
        
     <%
    
        out.print("<br>");
        for(int i=0;i<user_info.size();i++){
            out.print("<hr>");
            out.print("<div class='row'>");
            out.print("<div class='span4'>User ID : <b>"+user_info.get(i) +"</b></div>");
            i=i+1;
            out.print("<div class='span4'>Name : <b>"+user_info.get(i) +"</b></div>");
            i=i+1;
            out.print("<div class='span4'>First Name : <b>"+user_info.get(i) +"</b></div>");
            i=i+1;
            out.print("<div class='span4'>Last Name : <b>"+user_info.get(i) +"</b></div>");
            i=i+1;
            out.print("<div class='span4'>Company : <b>"+user_info.get(i) +"</b></div>");
            i=i+1;
            out.print("<div class='span4'>Company Service : <b>"+user_info.get(i) +"</b></div>");
            i=i+1;
            out.print("<div class='span4'>COmpany Web : <b>"+user_info.get(i) +"</b></div>");
            i=i+1;
            out.print("<div class='span4'>Designation : <b>"+user_info.get(i) +"</b></div>");
            i=i+1;
            out.print("<div class='span4'>Email : <b>"+user_info.get(i) +"</b></div>");
            i=i+1;
            out.print("<div class='span4'>Alternate Email : <b>"+user_info.get(i) +"</b></div>");
            i=i+1;
            out.print("<div class='span4'>Mobile : <b>"+user_info.get(i) +"</b></div>");
            i=i+1;
            out.print("<div class='span4'>Office Phone : <b>"+user_info.get(i) +"</b></div>");
            i=i+1;
            out.print("<div class='span4'>Address : <b>"+user_info.get(i) +"</b></div>");
            i=i+1;
            out.print("<div class='span4'>Country Code : <b>"+user_info.get(i) +"</b></div>");
            i=i+1;
            out.print("<div class='span9'>Password : <b>"+user_info.get(i) +"</b></div>");
            i=i+1;
            out.print("<div class='span4'>Create : <b>"+user_info.get(i) +"</b></div>");
            i=i+1;
            out.print("<div class='span4'>Update : <b>"+user_info.get(i) +"</b></div></div><hr>");
            
        }
     
     %>
    
        </form>
</div>
    
