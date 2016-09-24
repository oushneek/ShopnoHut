<%-- 
    Document   : add_sub_category_form
    Created on : Apr 22, 2014, 9:23:14 AM
    Author     : Tazbeea Tazakka
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="jspcode.DBConnect"%>
<%@page import="getQuery.getQuery" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<form method="post" action="new_sub_cat_to_DB.jsp" >
    
    <div class="span3">Category Name : </div><div class="span5"><select name="catChoose" >
    <%
        ArrayList <String> categoryList=getQuery.getCategory();
        for(int i=0;i<categoryList.size();i++){
            if(i%2==0){
                out.println("<option value='"+categoryList.get(i)+"'>");
                i=i+1;
                out.println(categoryList.get(i)+" </option>");
            }
        }
    %>
        </select></div></br>
        <div class="span3">Subcategory Name : </div><div class="span5"><input type="text" name="subcat_name" required="" /></div></br>
        <div class="span9 " ><input type="submit" value="Submit"/></div></br>
</form>
