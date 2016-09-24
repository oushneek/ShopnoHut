<%-- 
    Document   : sidebar
    Created on : Nov 23, 2013, 12:55:11 PM
    Author     : Tazbeea Tazakka
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="getQuery.getQuery" %>

<%

    ArrayList<String> cat= getQuery.getCategory();
    
%>

<!DOCTYPE html>
<div class="span3">
			<!-- start sidebar -->
<ul class="breadcrumb">
    <li>Categories</span></li>
</ul>
<div class="span3 product_list">
	<ul class="nav">
            
            <%
            String check=cat.get(0);
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
            }
            %>
            
	</ul>
</div><!-- end sidebar -->
</div>