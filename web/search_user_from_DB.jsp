<%-- 
    Document   : search_user_from_DB
    Created on : May 30, 2014, 11:22:50 AM
    Author     : Tazbeea Tazakka
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="search.search" %>



 <!-- Include the Header -->               
 <%@ include file="main_component/admin_header.jsp" %>
		
<!-- Include the Menu -->
<%@ include file="main_component/admin_menu.jsp" %>
                    
 <!-- Include the Sidebar -->               
 <%@ include file="main_component/admin_sidebar.jsp" %>
 
 
 <!-- Category Choice Reveive -->
 <%
    String search_for=request.getParameter("search_user");
    System.out.println("search for = "+search_for);
    ArrayList<String> search_result_user=search.searchUser(search_for);
 
 %>
                 
        <div class="span9">
		     <ul class="breadcrumb">
    <h4> User Info</h4>    </ul>   
    <div class="span9">
          <form action="search_user_from_DB.jsp">
            <div class="span2">SEARCH USER : </div><div class="span3"><input type="text" name="search_user" class="search-query " placeholder="Search USER"></div>
            <div class="span1"><button class="btn btn-primary btn-small search_btn" type="submit">Go</button></div>
	</form>
    </div><hr>

    <div class="span9">    
        
        <h4>Showing results for search "<%out.print(search_for);%>"</h4>
<form> 
    
        
     <%
    
    if(search_result_user.size()==0)
        out.print("<h3>No Search Result Found</h3>");
    else{
        for(int i=0;i<search_result_user.size();i++){
            out.print("<hr>");
            out.print("<div class='row'>");
            out.print("<div class='span4'>User ID : <b>"+search_result_user.get(i) +"</b></div>");
            i=i+1;
            out.print("<div class='span4'>Name : <b>"+search_result_user.get(i) +"</b></div>");
            i=i+1;
            out.print("<div class='span4'>First Name : <b>"+search_result_user.get(i) +"</b></div>");
            i=i+1;
            out.print("<div class='span4'>Last Name : <b>"+search_result_user.get(i) +"</b></div>");
            i=i+1;
            out.print("<div class='span4'>Company : <b>"+search_result_user.get(i) +"</b></div>");
            i=i+1;
            out.print("<div class='span4'>Company Service : <b>"+search_result_user.get(i) +"</b></div>");
            i=i+1;
            out.print("<div class='span4'>COmpany Web : <b>"+search_result_user.get(i) +"</b></div>");
            i=i+1;
            out.print("<div class='span4'>Designation : <b>"+search_result_user.get(i) +"</b></div>");
            i=i+1;
            out.print("<div class='span4'>Email : <b>"+search_result_user.get(i) +"</b></div>");
            i=i+1;
            out.print("<div class='span4'>Alternate Email : <b>"+search_result_user.get(i) +"</b></div>");
            i=i+1;
            out.print("<div class='span4'>Mobile : <b>"+search_result_user.get(i) +"</b></div>");
            i=i+1;
            out.print("<div class='span4'>Office Phone : <b>"+search_result_user.get(i) +"</b></div>");
            i=i+1;
            out.print("<div class='span4'>Address : <b>"+search_result_user.get(i) +"</b></div>");
            i=i+1;
            out.print("<div class='span4'>Country Code : <b>"+search_result_user.get(i) +"</b></div>");
            i=i+1;
            out.print("<div class='span9'>Password : <b>"+search_result_user.get(i) +"</b></div>");
            i=i+1;
            out.print("<div class='span4'>Create : <b>"+search_result_user.get(i) +"</b></div>");
            i=i+1;
            out.print("<div class='span4'>Update : <b>"+search_result_user.get(i) +"</b></div></div><hr>");
            
        }
    }
     %>
    
        </form>
	  	 
	  
	  
    </div>
	  
		</div>
		  
		  
		  
		
        
	  
      </div>
 <!-- Include the Footer -->               
 <%@ include file="main_component/footer.jsp" %>

</div> <!-- /container -->


