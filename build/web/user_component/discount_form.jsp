<%-- 
    Document   : discount_form
    Created on : May 11, 2014, 11:11:09 PM
    Author     : Tazbeea Tazakka
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="getQuery.getQuery"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<form method="post" action="discount_to_DB.jsp">
    
    <%
        ArrayList <String> productList=getQuery.getAllProduct();
       // ArrayList<String> product_discount=new ArrayList<String>();
        
    %>
    
    <div class="span3">Product Name: </div><div class="span5"><select name="chooseProduct" id ="chooseProduct"><option>Select Product</option>
        <%
        //ArrayList <String> productList=getQuery.getAllProduct();
        for(int i=0;i<productList.size();i=i+1){
            
               out.println("<option value='"+productList.get(i)+"'>");
                       
                i=i+1;
                out.print(productList.get(i));
                i=i+1;
                out.print("  (Tk. "+productList.get(i)+")</option>");
                
            }
        
    %>
        </select></div></br>
        
        <div class="span3">Add discount : </div><div class="span5"><input type="text" name="discount" value="0.00" required="" /></div></br>
        <div class="span9"><input type="submit" value="Submit"/></div></br>
    
</form>
    
    