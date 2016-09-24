<%-- 
    Document   : add_product_subcat
    Created on : Apr 22, 2014, 11:55:49 AM
    Author     : Tazbeea Tazakka
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="jspcode.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String cat_id=request.getParameter("category_id");

    ArrayList<String> subcategory=getQuery.getQuery.getSubCategory(cat_id);
 %>   
 <div class="span3">Subcategory Name :</div><div class="span5"> <select name="subcatChoose" ><option>select subcategory</option>
    <%
        for(int i=0;i<subcategory.size();i++){
            if(i%2==0){
                out.println("<option value='"+subcategory.get(i)+"'>");  
                i=i+1;
                out.println(subcategory.get(i)+" </option>");
            }
        }
    %>
     </select></div></br>