<%-- 
    Document   : add_product_form
    Created on : Apr 22, 2014, 10:36:29 AM
    Author     : Tazbeea Tazakka
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>

<%@page import="java.util.ArrayList"%>
<%@page import="jspcode.*"%>
<%@page import="getQuery.getQuery"%>
<%@page import="servelet.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--<form method="post" action="new_product_to_DB.jsp" >-->
<form method="get" action="new_product_to_DB.jsp" >    

    <div class="span3">Product Name : </div><div class="span5"><input type="text" name="product_name" required="" /></div></br>
    <div class="span3">Category Name : </div><div class="span5"><select name="catChoose" id="catChoose"><option>select category</option>
    <%
        
        ArrayList <String> cat_list=getQuery.getCategory();
        for(int i=0;i<cat_list.size();i++){
            if(i%2==0){
                out.println("<option value='"+cat_list.get(i)+"'>");  
                i=i+1;
                out.println(cat_list.get(i)+" </option>");
                
            }
        }
    %>
        </select></div></br>
    <div id="subcategory"></div></br>
    <!subcategory>
    
   <!-- Discount : <input type="text" name="discount" required=""/></br>
    Selling Price : <input type="text" name="price_sell" required="" /></br>-->
   <div class="span3">Description : </div><div class="span5"><textarea name="description" required=""></textarea></div></br>
 
    <%
        Calendar currentdate=Calendar.getInstance();
        SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd");
        String dateNow=formatter.format(currentdate.getTime());
    %>
    <div class="span3">Entry Date :</div><div class="span5"><input type="text" name="entry_date" value="<%out.print(dateNow);%>" required="" disabled /> </div></br>
    <div class="span9"><input type="submit" value="Submit"/></div></br>
</form>
    <script>
        $("#catChoose").change(function(event){
           $("#catChoose option:selected").each(function(){
               //alert($(this).val());
               $("#subcategory").load("user_component/add_product_subcat.jsp?category_id="+$(this).val());
               
           }) ;
        });
        
    </script>