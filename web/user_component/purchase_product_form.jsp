<%-- 
    Document   : purchase_product_form
    Created on : May 11, 2014, 10:51:43 AM
    Author     : Tazbeea Tazakka
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="getQuery.getQuery"%>

<form method="post" action ="purchase_product_to_DB.jsp">
    <div class="span3">Product Name: </div><div class="span5"><select name="chooseProduct"><option>Select Product</option>
        <%
        ArrayList <String> productList=getQuery.getAllProduct();
        for(int i=0;i<productList.size();i=i+2){
           
                out.println("<option value='"+productList.get(i)+"'>");
                        
                i=i+1;
                out.println(productList.get(i)+" </option>");
           
        }
    %>
        </select></div></br>
        <div class="span3">Unit Cost : </div><div class="span5"><input type="text" name="unit_cost" value="0.00" required="" /></div></br>
        <div class="span3">Quantity : </div><div class="span5"><input type="text" name="quantity"  required="" /></div></br>
        <div class="span3">Selling Price : </div><div class="span5"><input type="text" name="selling_price" value="0.00" required="" /></div></br>
    <%
        Calendar currentdate=Calendar.getInstance();
        SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd");
        String dateNow=formatter.format(currentdate.getTime());
    %>
        <div class="span3">Entry Date :</div><div class="span5"><input type="text" name="entry_date" value="<%out.print(dateNow);%>" required="" disabled /> </div></br>
    
        <div class="span9"><input type="submit" value="Submit"/></div></br>
    
</form>
    
    