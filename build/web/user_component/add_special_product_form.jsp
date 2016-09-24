<%-- 
    Document   : add_special_product_form
    Created on : May 14, 2014, 2:06:21 PM
    Author     : Tazbeea Tazakka
--%>

<%@page import="getQuery.getQuery"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<form method="post" action ="add_special_product_to_DB.jsp">
    <%ArrayList <String> productList=getQuery.getAllProduct();%>
    
    <div class="span9"><h3>Product images will be shown in the first page.</h3></div>
    <div class="span3">Featured product  : </div><div class="span5"><select name="featuredProduct"><option>Select Product</option>
        
        <%
        
        for(int i=0;i<productList.size();i=i+2){
           
                out.println("<option value='"+productList.get(i)+"'>");
                        
                i=i+1;
                out.println(productList.get(i)+" </option>");
           
        }
    %>
        </select></div></br>
    
        
        <div class="span8"><hr></div>
        <div class="span9"><h3>Add popular products to be shown in the first page.</h3></div>
    <div class="span3">Popular product 1 : </div><div class="span5"><select name="chooseProduct1"><option>Select Product</option>
        
        <%
        
        for(int i=0;i<productList.size();i=i+2){
           
                out.println("<option value='"+productList.get(i)+"'>");
                        
                i=i+1;
                out.println(productList.get(i)+" </option>");
           
        }
    %>
        </select></div></br>
    <div class="span3">Popular product 2 : </div><div class="span5"><select name="chooseProduct2"><option>Select Product</option>
        
        <%
        
        for(int i=0;i<productList.size();i=i+2){
           
                out.println("<option value='"+productList.get(i)+"'>");
                        
                i=i+1;
                out.println(productList.get(i)+" </option>");
           
        }
    %>
        </select></div></br>
    <div class="span3">Popular product 3 : </div><div class="span5"><select name="chooseProduct3"><option>Select Product</option>
        
        <%
        
        for(int i=0;i<productList.size();i=i+2){
           
                out.println("<option value='"+productList.get(i)+"'>");
                        
                i=i+1;
                out.println(productList.get(i)+" </option>");
           
        }
    %>
        </select></div></br>
    <div class="span3">Popular product 4 :</div><div class="span5"> <select name="chooseProduct4"><option>Select Product</option>
        
        <%
        
        for(int i=0;i<productList.size();i=i+2){
           
                out.println("<option value='"+productList.get(i)+"'>");
                        
                i=i+1;
                out.println(productList.get(i)+" </option>");
           
        }
    %>
        </select></div></br>
    <div class="span3"> Popular product 5 : </div><div class="span5"><select name="chooseProduct5"><option>Select Product</option>
        
        <%
        
        for(int i=0;i<productList.size();i=i+2){
           
                out.println("<option value='"+productList.get(i)+"'>");
                        
                i=i+1;
                out.println(productList.get(i)+" </option>");
           
        }
    %>
       </select></div></br>
    <div class="span3"> Popular product 6 : </div><div class="span5"><select name="chooseProduct6"><option>Select Product</option>
        
        <%
        
        for(int i=0;i<productList.size();i=i+2){
           
                out.println("<option value='"+productList.get(i)+"'>");
                        
                i=i+1;
                out.println(productList.get(i)+" </option>");
           
        }
    %>
       </select></div></br>
    
    <div class="span9"> <input type="submit" value="Submit"/></div></br>
    
</form>