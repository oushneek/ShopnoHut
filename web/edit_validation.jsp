<%-- 
    Document   : edit_validation
    Created on : May 15, 2014, 4:36:43 AM
    Author     : Tazbeea Tazakka
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="jspcode.Global"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="jspcode.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="userInfo.userInfo" %>
<!DOCTYPE html>


        <% 
            
            
            ArrayList<String> user_info=userInfo.getUserInfo(session.getAttribute("user_id").toString());
            String[] user_info_edit=new String[15];

            String address,password,confirm_password;
             
            
            password=request.getParameter("user_password");
            confirm_password=request.getParameter("confirm_password");
            
            // password validation            
                
            
            if(password.equals(confirm_password)){
                System.out.println("Password matched");
               
                Calendar currentdate=Calendar.getInstance();
                SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd");
                String dateNow=formatter.format(currentdate.getTime());
            
                if(request.getParameter("user_name")=="")
                    user_info_edit[0]=user_info.get(0);
                else
                    user_info_edit[0]=request.getParameter("user_name");
                
                if(request.getParameter("first_name")=="")
                    user_info_edit[1]=user_info.get(1);
                else
                    user_info_edit[1]=request.getParameter("first_name");
                
                if(request.getParameter("last_name")=="")
                    user_info_edit[2]=user_info.get(2);
                else
                    user_info_edit[2]=request.getParameter("last_name");
                
                if(request.getParameter("company_name")=="")
                    user_info_edit[3]=user_info.get(3);
                else
                    user_info_edit[3]=request.getParameter("company_name");
                
                if(request.getParameter("service_name")=="")
                    user_info_edit[4]=user_info.get(4);
                else
                    user_info_edit[4]=request.getParameter("service_name");
                
                if(request.getParameter("web_name")=="")
                    user_info_edit[5]=user_info.get(5);
                else
                    user_info_edit[5]=request.getParameter("web_name");
                
                if(request.getParameter("designation")=="")
                    user_info_edit[6]=user_info.get(6);
                else
                    user_info_edit[6]=request.getParameter("designation");
                
                if(request.getParameter("user_email")=="")
                    user_info_edit[7]=user_info.get(7);
                else
                    user_info_edit[7]=request.getParameter("user_email");
                
                if(request.getParameter("alternate_email")=="")
                    user_info_edit[8]=user_info.get(8);
                else
                    user_info_edit[8]=request.getParameter("alternate_email");
                
                if(request.getParameter("user_mobile")=="")
                    user_info_edit[9]=user_info.get(9);
                else
                    user_info_edit[9]=request.getParameter("user_mobile");
                
                if(request.getParameter("office_phone")=="")
                    user_info_edit[10]=user_info.get(10);
                else
                    user_info_edit[10]=request.getParameter("office_phone");
                
                 if(request.getParameter("address")=="")
                    user_info_edit[11]=user_info.get(11);
                else
                    user_info_edit[11]=request.getParameter("address");
                
                  if(request.getParameter("country_code")=="")
                    user_info_edit[12]=user_info.get(12);
                  else
                    user_info_edit[12]=request.getParameter("country_code");
                
                
                  user_info_edit[13]=password;
                  user_info_edit[14]=dateNow;
                  
                  for(int i=0;i<15;i++)
                      System.out.println("info got "+user_info_edit[i]);
                  userInfo.edit(user_info_edit, session.getAttribute("user_id").toString());
                  response.sendRedirect(session.getAttribute("back_url").toString());

            }
            else
                out.println("Password must be matched with confirm password");
                
            
            %>
            