<%-- 
    Document   : confirm_address
    Created on : May 13, 2014, 3:44:00 PM
    Author     : Tazbeea Tazakka
--%>


<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="jspcode.*" %>
<%@page  import= "getQuery.getQuery" %>
<%@page import="userInfo.userInfo" %>

<%
    if(session.getAttribute("user_name")==null)
        response.sendRedirect("user_login.jsp");

%>

 <%@ include file="main_component/header.jsp" %>
		
<!-- Include the Menu -->
<%@ include file="main_component/menu.jsp" %>

<%@ include file="main_component/sidebar.jsp" %>

<%
    ArrayList<String> user=userInfo.getUserInfo(session.getAttribute("user_id").toString());
    String address=user.get(11);
    
%>
<style>
    #new_address{
        display: none;
        
    }  
</style>
<script src="js/jquery.min.js" ></script>
<div class="span7 pull-right">
<form method="post" action="place_order.jsp">
    
    
    <input name="address" type="radio" class="star" value="present" required=""/>Send to Present Address: <%out.print(address);%> <br>
    <input name="address" type="radio" class="star" value="new" id='new_address_button'/>Send to Another Address: <br>
    <!-- 
    <select name='address' id='address'>
        <option value="prv">Send to previous Address</option>
        <option value="nxt">Send to another Address</option>
    </select>
    -->
    <textarea name="new_address" id='new_address' class=''></textarea> </br>
    <!--<a class='btn btn-primary' href='#' style="background: deepskyblue " type= >Proceed<br></a>-->
    <input type="submit" value="Proceed"/> </br>
</form>
</div>
    <script>
        
        $("input[name=address]:radio").click(function(){
            if($('input[type="radio"]:checked').val() === "new"){
                $("#new_address").show();
            }
       });
        
    </script>
    
    </div>
 <%@ include file="main_component/footer.jsp" %>

 </div>
                     
