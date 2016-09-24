<%-- 
    Document   : index
    Created on : Nov 8, 2013, 2:53:58 PM
    Author     : Tazbeea Tazakka
--%>


<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="jspcode.*" %>
<%@page import="specialProduct.specialProduct" %>




 <!-- Include the Header -->               
 <%@ include file="main_component/header.jsp" %>

<!-- Include the Menu -->
<%@ include file="main_component/menu.jsp" %>
                    
 <!-- Include the Sidebar -->               
 <%@ include file="main_component/sidebar.jsp" %>
 <%
    ArrayList<String> featured=specialProduct.getFeaturedProduct();
    ArrayList<String> popular=specialProduct.getPopularProduct();
    System.out.println(popular.size());
    
   // int random_product=(int) (Math.random() * 3);
 
 %>
 
                    
        <div class="span9">

            <div class="span7"><h4></br></br>Featured</h4><br /></div>
			<!--<div id="myCarousel" class="carousel slide">
            <div class="carousel-inner">-->
                        <%
                        
                       //if(random_product==1){ 
                        %>
              <div class="span3">
                  
                  <%out.print("<a href='product_details.jsp?product_code="+featured.get(0) +"'>"); %><img style="height:200px; width: 300px"   src="<%out.print("images/"+featured.get(1));%>" alt=""></a></div>
                <!--<div class="carousel-caption">-->
                <%out.print("<a href='product_details.jsp?product_code="+featured.get(0) +"'>"); %><div class="span3"><h4><%out.print(featured.get(2));%></h4></div></a>
                <div class="span3"><p><%out.print(featured.get(3));%></p></div>
               <!-- </div>-->
<%

//                       }
//                       else if(random_product==2){
%>
              <!--</div>-->
             <!-- <div class="span3">
                  <img src="<%//out.print("images/"+featured.get(4));%>" alt=""></div>
                <div class="span3"><h4><%//out.print(featured.get(5));%></h4></div>
                <div class="span3"> <p><%//out.print(featured.get(6));%></p></div>
             <%
//                       }
//                       else{
             %>

              <div class="span3">
                  <img src="<%//out.print("images/"+featured.get(7));%>" alt=""></div>
                <div class="span3"><h4><%//out.print(featured.get(8));%></h4></div>
                <div class="span3"><p><%//out.print(featured.get(9));%></p></div>

                <%//}%>-->
                <!-- </div>
            </div>-->

           <!-- <a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
            <a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>-->
		  
                
                </br></br>
          <div class="span7 popular_products">
		 <h4></br></br>Popular products</h4><br />
		<ul class="thumbnails">
       
	   <li class="span2">
          <div class="thumbnail">
              <%out.print("<a href='product_details.jsp?product_code="+popular.get(0) +"'>"); %><img alt="" style="height:150px" src="<%out.print("images/"+popular.get(1));%>" /></a>
            <div class="caption">
                <%out.print("<a href='product_details.jsp?product_code="+popular.get(0) +"'>"); %> <p style="font-size: 10px"><%out.print(popular.get(2));%></p></a>  Price: <%out.print(popular.get(3));%><br /><br />
            </div>
          </div>
        </li>
       
	   <li class="span2">
          <div class="thumbnail">
            <%out.print("<a href='product_details.jsp?product_code="+popular.get(4) +"'>"); %><img alt="" style="height:150px"  src="<%out.print("images/"+popular.get(5));%>" /></a>
            <div class="caption">
              <%out.print("<a href='product_details.jsp?product_code="+popular.get(4) +"'>"); %> <p style="font-size: 10px"><%out.print(popular.get(6));%></p></a>  Price: <%out.print(popular.get(7));%><br /><br />
            </div>
          </div>
        </li>
       
	   <li class="span2">
          <div class="thumbnail">
              <%out.print("<a href='product_details.jsp?product_code="+popular.get(8) +"'>"); %> <img style="height:150px" alt="" src="<%out.print("images/"+popular.get(9));%>" /></a>
            <div class="caption">
              <%out.print("<a href='product_details.jsp?product_code="+popular.get(8) +"'>"); %> <p style="font-size: 10px"><%out.print(popular.get(10));%></p></a>  Price: <%out.print(popular.get(11));%><br /><br />
            </div>
          </div>
        </li>
       
	   <li class="span2">
          <div class="thumbnail">
            <%out.print("<a href='product_details.jsp?product_code="+popular.get(12) +"'>"); %><img style="height:150px" alt="" src="<%out.print("images/"+popular.get(13));%>" /></a>
            <div class="caption">
              <%out.print("<a href='product_details.jsp?product_code="+popular.get(12) +"'>"); %> <p style="font-size: 10px"><%out.print(popular.get(14));%></p></a>  Price: <%out.print(popular.get(15));%><br /><br />
            </div>
          </div>
        </li>
       
	   <li class="span2">
          <div class="thumbnail">
            <%out.print("<a href='product_details.jsp?product_code="+popular.get(16) +"'>"); %><img style="height:150px" alt="" src="<%out.print("images/"+popular.get(17));%>" /></a>
            <div class="caption">
                <%out.print("<a href='product_details.jsp?product_code="+popular.get(16) +"'>"); %> <p style="font-size: 10px"><%out.print(popular.get(18));%></p></a>  Price: <%out.print(popular.get(19));%><br /><br />
            </div>
          </div>
        </li>
       
	   <li class="span2">
          <div class="thumbnail">
              <%out.print("<a href='product_details.jsp?product_code="+popular.get(20) +"'>"); %><img style="height:150px" alt="" src="<%out.print("images/"+popular.get(21));%>" /></a>
            <div class="caption">
              <%out.print("<a href='product_details.jsp?product_code="+popular.get(20) +"'>"); %> <p style="font-size: 10px"><%out.print(popular.get(22));%></p></a>  Price: <%out.print(popular.get(23));%><br /><br />
            </div>
          </div>
        </li>

      </ul>
		</div>
            
                      </div>

            
	  
      </div>
 <!-- Include the Footer -->               
 <%@ include file="main_component/footer.jsp" %>

</div> <!-- /container -->


