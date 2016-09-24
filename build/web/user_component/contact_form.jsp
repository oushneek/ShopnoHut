<%-- 
    Document   : contact_form
    Created on : Apr 8, 2014, 10:54:15 PM
    Author     : Tazbeea Tazakka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<form method="post" action="contact_us_confirmation.jsp">
    <div class="span3">Name: </div><div class="span5"><input type="text" name="name" required="" /></div><br/>
    <div class="span3">Email: </div><div class="span5"><input type="email" name="email" required="" /></div><br/>
    <div class="span3">Message: </div><div class="span5"><textarea name="message" required="" ></textarea></div><br/>
        <div class="span9"><input type="submit" value="Send Message" /></div><br/>
    
    
</form>