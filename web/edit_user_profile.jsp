<%-- 
    Document   : edit_user_profile
    Created on : May 14, 2014, 5:39:08 PM
    Author     : Tazbeea Tazakka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="userInfo.userInfo" %>
        

<!DOCTYPE html>
<%
    if(session.getAttribute("user_name")==null)
        response.sendRedirect("user_login.jsp");
%>
<script src="js/jquery.min.js" ></script>
 <!-- Include the Header -->               
 <%@ include file="main_component/header.jsp" %>

<!-- Include the Menu -->
<%@ include file="main_component/menu.jsp" %>
                    
 <!-- Include the Sidebar -->               
 <%@ include file="main_component/sidebar.jsp" %>
 
 <%
    ArrayList<String> user_info=userInfo.getUserInfo(session.getAttribute("user_id").toString());
 %>
 <div class="span9">
     <h4><u>Edit Profile</u></h4><br>
     <h5><u>Last Updated</u> : <%out.print(user_info.get(14));%></h5><hr>
<form method="post" action="edit_validation.jsp"> 
    <div class="span3">ID: </div><div class="span5"><input type="text" name="user_id" placeholder=<%out.print("'"+session.getAttribute("user_id") +"'");%> disabled/> </div></br>

    <div class="span3">Name: </div><div class="span5"><input type="text" name="user_name" placeholder=<%out.print("'"+user_info.get(0) +"'");%> /> </div></br>
    <div class="span3">First Name: </div><div class="span5"><input type="text" name="first_name" placeholder=<%out.print("'"+user_info.get(1) +"'");%>/> </div></br>
    <div class="span3">Last Name: </div><div class="span5"><input type="text" name="last_name" placeholder=<%out.print("'"+user_info.get(2) +"'");%> /> </div></br>
    <div class="span3">Company Name: </div><div class="span5"><input type="text" name="company_name" placeholder=<%out.print("'"+user_info.get(3) +"'");%> /> </div></br>
    <div class="span3">Company Service: </div><div class="span5"><input type="text" name="service_name" placeholder=<%out.print("'"+user_info.get(4) +"'");%> /> </div></br>
    <div class="span3">Company Web: </div><div class="span5"><input type="text" name="web_name" placeholder=<%out.print("'"+user_info.get(5) +"'");%> /> </div></br>
    <div class="span3">Designation: </div><div class="span5"><input type="text" name="designation" placeholder=<%out.print("'"+user_info.get(6) +"'");%> /> </div></br>
    <div class="span3">Email: </div><div class="span5"><input type="email" name="user_email" placeholder=<%out.print("'"+user_info.get(7) +"'");%> /></div></br>
    <div class="span3">Alternate Email: </div><div class="span5"><input type="text" name="alternate_email"  placeholder=<%out.print("'"+user_info.get(8) +"'");%>/> </div></br>
    <div class="span3">Mobile: </div><div class="span5"><input type="text" name="user_mobile" placeholder=<%out.print("'"+user_info.get(9) +"'");%> /></div> </br>
    <div class="span3">Office Phone: </div><div class="span5"><input type="text" name="office_phone" placeholder=<%out.print("'"+user_info.get(10) +"'");%> /></div> </br>
    <div class="span3">Address: </div><div class="span5"><textarea name="user_address" placeholder=<%out.print("'"+user_info.get(11) +"'");%>></textarea> </div></br>
    <div class="span3">Country Code: </div><div class="span5"><input type="text" name="country_code"  placeholder=<%out.print("'"+user_info.get(12) +"'");%>/></div> </br>
    <div class="span3">Password: </div><div class="span5"><input type="password" name="user_password" required="" /> ** </div></br>
    <div class="span3">Confirm Password: </div><div class="span5"><input type="password" name="confirm_password" required=""/> **</div> </br>
    
    <div class="span9"><input type="submit" value="Submit"/></div></br>
</form>
    
 </div>
 
 
 
 
 </div>
 <!-- Include the Footer -->               
 <%@ include file="main_component/footer.jsp" %>

</div> <!-- /container -->

