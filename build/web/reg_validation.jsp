<%-- 
    Document   : reg_validation
    Created on : Apr 6, 2014, 11:43:24 AM
    Author     : Tazbeea Tazakka
--%>

<%@page import="jspcode.Global"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="jspcode.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="userInfo.userInfo" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            String name,email,password,address,mobile,confirm_password;
            name=request.getParameter("user_name");
            email=request.getParameter("user_email");
            mobile=request.getParameter("user_mobile");
            address=request.getParameter("user_address");
            password=request.getParameter("user_password");
            confirm_password=request.getParameter("confirm_password");
            
            // blank submission validation            
                
            if(name.equals(""))
            {
                out.println("Name must be filled.");
            }
            if(email.equals("")){
                out.println("Email must be filled.");
            }
            if(mobile.equals("")){
                out.println("Mobile Number must be filled.");
            }
            if(address.equals("")){
                out.println("Address must be filled.");
            }
            if(password.equals("")){
                out.println("You must give a password");
            }
            if(confirm_password.equals("")){
                out.println("You must confirm your password");
            }
            if(password.equals(confirm_password)){
                out.println("Password matched");
            }
            else
                out.println("Password must be matched with confirm password");
                
            String[] user_info_reg=new String[5];
            user_info_reg[0]=name;
            user_info_reg[1]=email;
            user_info_reg[2]=mobile;
            user_info_reg[3]=address;
            user_info_reg[4]=password;
           
            Calendar currentdate=Calendar.getInstance();
            SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd");
            String dateNow=formatter.format(currentdate.getTime());
            
            userInfo.registration(user_info_reg,dateNow);
            
            session.setAttribute("user_name", Global.user_name);
            response.sendRedirect(session.getAttribute("back_url").toString());
            
         %>
    </body>
</html>
