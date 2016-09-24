<%-- 
    Document   : add_product_form
    Created on : Apr 21, 2014, 9:13:47 PM
    Author     : Tazbeea Tazakka
--%>
<%@page import="jspcode.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<form method="post" action="new_cat_to_DB.jsp" >
    <div class="span3">Category Name : </div><div class="span5"><input type="text" name="cat_name" required="" /></div></br>
    <div class="span9"><input type="submit" value="Submit"/></div></br>

</form>