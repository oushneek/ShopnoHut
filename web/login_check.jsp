<%-- 
    Document   : login_check
    Created on : Apr 7, 2014, 10:48:29 AM
    Author     : Tazbeea Tazakka
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="jspcode.Global"%>
<%@page import="jspcode.DBConnect"%>
<%@page import="userInfo.userInfo" %>
<%@page import="guest.guest" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            

         String[] login_data=new String[2];
         login_data[0]=request.getParameter("email");
         login_data[1]=request.getParameter("password");
         ArrayList<String> userName=userInfo.login_check(login_data);
         
         if(userInfo.login_check(login_data).size()>0){
             Global.login=true;
             if(Global.user_type_id==0){
                out.println("You have logged in successfully as customer");
                session.setAttribute("user_id", Global.user_id);
                //previousUrl=session.getAttribute("back_url").toString();
                session.setAttribute("user_name",userName.get(0));
                String redirectURL = session.getAttribute("back_url").toString();
                
                
                if(session.getAttribute("back_url").toString().equals("http://localhost:8084/Shopnohut/show_cart.jsp")){
                    response.sendRedirect("login_during_cart.jsp");
                }
                else{
                    guest.delete_guest_ID(session.getAttribute("guest_id").toString());
                    response.sendRedirect(redirectURL);
                }
             }
             
             else if(Global.user_type_id==1){
                out.println("You have logged in successfully as admin");
                session.setAttribute("user_id", Global.user_id);
                session.setAttribute("user_name",userName.get(0));
                session.setAttribute("user_type", Global.user_type_id);
                //String redirectURL = session.getAttribute("back_url").toString();
                response.sendRedirect("admin.jsp");
             }
         }
         else{
             Global.login=false;
             response.sendRedirect("user_login.jsp");
             out.println("Incorrect email or password");
         }
         %>
    </body>
</html>
