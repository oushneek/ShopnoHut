<%-- 
    Document   : signup_form
    Created on : Apr 6, 2014, 10:45:48 AM
    Author     : Tazbeea Tazakka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<form method="get" action="reg_validation.jsp"> 
    <div class="span3">Name: </div><div class="span5"><input type="text" name="user_name" required="" /></div> </br>
    <div class="span3">Email: </div><div class="span5"><input type="email" name="user_email" required="" /></div> </br>
    <div class="span3">Mobile: </div><div class="span5"><input type="text" name="user_mobile" value="+880" required=""/></div> </br>
    <div class="span3">Address: </div><div class="span5"><textarea name="user_address" required=""></textarea> </div></br>
    <div class="span3">Password: </div><div class="span5"><input type="password" name="user_password" required=""/></div> </br>
    <div class="span3">Confirm Password:</div><div class="span5"><input type="password" name="confirm_password" required=""/></div> </br>
    
    <div class="span9"><input type="submit" value="Submit"/></div></br>
</form>
