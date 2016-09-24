<%-- 
    Document   : footer
    Created on : Nov 23, 2013, 12:47:16 PM
    Author     : Tazbeea Tazakka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
            <footer>
	<hr />
	<div class="row well no_margin_left">

	<div class="span4">
		<h4>Information</h4>
		<ul>
			<li><a href="about_us.jsp">About Us</a></li>
			<li><a href="#">Delivery Information</a></li>
			<li><a href="#">Privacy Policy</a></li>
			<li><a href="#">Terms &amp; Conditions</a></li>
		</ul>
	</div>
	<div class="span4">
		<h4>Customer Service</h4>
		<ul>
			<li><a href="contact_us.jsp">Contact Us</a></li>
			<li><a href="#">Returns</a></li>
			<li><a href="#">Site Map</a></li>
		</ul>
	</div>
	
	<div class="span3">
		<h4>My Account</h4>
		<ul>
			<li><a href="my_profile.jsp">My Account</a></li>
			<li><a href="my_orders.jsp">Order History</a></li>
                        <%if(session.getAttribute("user_id")!=null){%>
			<li><a href="wishlist.jsp">Wish List</a></li><%}%>
			<li><a href="show_cart.jsp">Cart</a></li>
		</ul>
	</div>

</footer>





<!-- Le javascript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="js/jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.js"></script>
<script src="js/jquery.rating.pack.js"></script>

</body>
</html>
