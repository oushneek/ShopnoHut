<%-- 
    Document   : admin_sidebar
    Created on : Jun 4, 2014, 3:08:46 PM
    Author     : Tazbeea Tazakka
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<div class="span3">
			<!-- start sidebar -->
<ul class="breadcrumb">
    <li>Pages</span></li>
</ul>
<div class="span3 product_list">
	<ul class="nav">
            
            <%/*
            for (int i=0;i<cat.size();i++){
                if(i>0 && cat.get(i).equals(check))
                    break;
                else
                {
                    if (i%2 != 0)    
                    {
                    out.print("<li ><a class='active' href='category.jsp?categoryid="+cat.get(i-1)+"&page=1' >"+cat.get(i)+"</a></li>");
                    }
                }
            }*/
            %>
            
            <li><a href="#">Customer Service</a></li>
            <li><a href="#">Add new types</a></li>
            <li><a href="#">Purchase</a></li>
            <li><a href="#">Special Offers</a></li>
            <li><a href="#">Add Special Product</a></li>
            <li><a href="#">Others</a></li>
            
            
	</ul>
</div><!-- end sidebar -->
</div>