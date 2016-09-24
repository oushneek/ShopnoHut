/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package userInfo;

import java.sql.*;
import java.util.ArrayList;
import jspcode.Global;

/**
 *
 * @author Tazbeea Tazakka
 */
public class userInfo {
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
   static final String DB_URL = "jdbc:mysql://localhost/shopnohut";
   static ArrayList<String> userDetails=new ArrayList<String>();
   static ArrayList<String> login_after_reg=new ArrayList<String>();
   static ArrayList<String> userInfo=new ArrayList<String>();
   static ArrayList<String> showuserInfo=new ArrayList<String>();
   //  Database credentials
   static final String USER = "root";
   static final String PASS = "1234";
   
   public static String registration(String[] user_data,String date){
     Connection conn = null;
                  Statement stmt = null;
                  String[] user = new String[2];
                  user[0]=user_data[1];
                  user[1]=user_data[4];
                  
                  
                  try{
                       Class.forName("com.mysql.jdbc.Driver");
                       conn = DriverManager.getConnection(DB_URL, USER, PASS);
                       stmt = conn.createStatement();
//                     String sql="INSERT INTO (c_name,c_email,c_mobile,c_address,c_pass) customer VALUES ('"+user_data[0]+"','"+user_data[1]+"','1','"+user_data[3]+"','"+user_data[4]+"')";
                       String sql="insert into user (name,email,password,mobile,address,id_user_type,create_date,update_date) values ('"+user_data[0]+"','"+user_data[1]+"','"+user_data[4]+"','"+user_data[2]+"','"+user_data[3]+"',0,'"+date+"','"+date+"')";
                       stmt.executeUpdate(sql);
                       login_after_reg=login_check(user);
                       Global.user_name=login_after_reg.get(0);
                       
                       return "Done";
                  }
                  catch (SQLException ex) {
                      // Logger.getLogger(EntryForm.class.getName()).log(Level.SEVERE, null, ex);
                      return "Failed";
                  } 
                  catch (ClassNotFoundException ex) {
                     //  Logger.getLogger(EntryForm.class.getName()).log(Level.SEVERE, null, ex);
                      return "Failed";
                  }

}

   public static ArrayList<String> login_check(String[] login_data){
    
   Connection conn = null;
   Statement stmt = null;
   try{
      //STEP 2: Register JDBC driver
      Class.forName("com.mysql.jdbc.Driver");

      //STEP 3: Open a connection
      System.out.println("Connecting to a selected database...");
      conn = DriverManager.getConnection(DB_URL, USER, PASS);
      System.out.println("Connected database successfully...");
      
      //STEP 4: Execute a query
      System.out.println("Creating statement...");
      stmt = conn.createStatement();

      //String sql = "SELECT * FROM customer where c_email="+login_data[0]+" and c_pass="+login_data[1];
      //ResultSet rs = stmt.executeQuery(sql);
        String sql = "SELECT * FROM user WHERE email=? AND password=?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, login_data[0]); // parameters start from 1, not 0. also we're assuming the parameter type is String;
        pstmt.setString(2, login_data[1]); // assume indexTerm can be 100 and is an integer
        ResultSet rs = pstmt.executeQuery();

//STEP 5: Extract data from result set
      String name="";
      int user_type=0;
      int user_id=0;
      userDetails.clear();
      while(rs.next()){
         //Retrieve by column name
         name  =rs.getString("name");
        if(name!=null)
             userDetails.add(name);
        user_type=rs.getInt("id_user_type");
        user_id=rs.getInt("user_id");
      }
      rs.close();
//      if(name.equals(""))
//          return false;
      if(!name.equals("") && user_type==0){
         Global.user_type_id=0;
         Global.user_id=user_id;
          //return true;
      }
      else if(!name.equals("") && user_type==1) {
          Global.user_type_id=1;
          Global.user_id=user_id;
         // return true;
      }
      
   }catch(SQLException se){
      //Handle errors for JDBC
      se.printStackTrace();
      //return false;
   }catch(Exception e){
      //Handle errors for Class.forName
      e.printStackTrace();
    // return false;
   }finally{
      //finally block used to close resources
      try{
         if(stmt!=null)
            conn.close();
      }catch(SQLException se){
      }// do nothing
      try{
         if(conn!=null)
            conn.close();
      }catch(SQLException se){
         se.printStackTrace();
      }//end finally try
   }//end try
   
   return userDetails;
   
}
    
   public static ArrayList<String> getUserInfo(String user_id) {
   Connection conn = null;
   Statement stmt = null;
   try{
      //STEP 2: Register JDBC driver
      Class.forName("com.mysql.jdbc.Driver");

      //STEP 3: Open a connection
      System.out.println("Connecting to a selected database...");
      conn = DriverManager.getConnection(DB_URL, USER, PASS);
      System.out.println("Connected database successfully...");
      
      //STEP 4: Execute a query
      System.out.println("Creating statement...");
      stmt = conn.createStatement();

      String sql = "SELECT * from user where user_id="+user_id;
      //System.out.print(sql);
      ResultSet rs = stmt.executeQuery(sql);
      //STEP 5: Extract data from result set
      userInfo.clear();
      while(rs.next()){
         //Retrieve by column name
          userInfo.add(rs.getString("name"));
          userInfo.add(rs.getString("first_name"));
          userInfo.add(rs.getString("last_name"));
          userInfo.add(rs.getString("company_name"));
          userInfo.add(rs.getString("company_service"));
          userInfo.add(rs.getString("company_web"));
          userInfo.add(rs.getString("designation"));
          userInfo.add(rs.getString("email"));
          userInfo.add(rs.getString("alternate_email"));
          userInfo.add(rs.getString("mobile"));
          userInfo.add(rs.getString("office_phone"));
          userInfo.add(rs.getString("address"));
          userInfo.add(Integer.toString(rs.getInt("country_code")));
          userInfo.add(rs.getString("password"));
          userInfo.add(rs.getString("update_date"));


      }
      rs.close();
   }catch(SQLException se){
      //Handle errors for JDBC
      se.printStackTrace();
   }catch(Exception e){
      //Handle errors for Class.forName
      e.printStackTrace();
   }finally{
      //finally block used to close resources
      try{
         if(stmt!=null)
            conn.close();
      }catch(SQLException se){
      }// do nothing
      try{
         if(conn!=null)
            conn.close();
      }catch(SQLException se){
         se.printStackTrace();
      }//end finally try
   }//end try
        user_id="";
        //System.out.println("size of cat"+catOFProduct.size());
//       for(int i=0;i<userInfo.size();i++)
//           System.out.println("uerInfo "+userInfo.get(i));
        //System.out.println("size of catarray"+catOFProduct.size());
       return userInfo;
}
   
   public static String edit(String[] user_data,String userid){
     Connection conn = null;
                  Statement stmt = null;
                  
                  try{
                       Class.forName("com.mysql.jdbc.Driver");
                       conn = DriverManager.getConnection(DB_URL, USER, PASS);
                       stmt = conn.createStatement();
                       String sql="update user set name='"+user_data[0]+"',first_name='"+user_data[1]+"',last_name='"+user_data[2]+"',company_name='"+user_data[3]+"',company_service='"+user_data[4]+"',company_web='"+user_data[5]+"',designation='"+user_data[6]+"',email='"+user_data[7]+"',alternate_email='"+user_data[8]+"',mobile='"+user_data[9]+"',office_phone='"+user_data[10]+"',address='"+user_data[11]+"',country_code='"+user_data[12]+"',password='"+user_data[13]+"',update_date='"+user_data[14]+"' where user_id="+userid;
                       stmt.executeUpdate(sql);
                       
                       return "Done";
                  }
                  catch (SQLException ex) {
                      // Logger.getLogger(EntryForm.class.getName()).log(Level.SEVERE, null, ex);
                      return "Failed";
                  } 
                  catch (ClassNotFoundException ex) {
                     //  Logger.getLogger(EntryForm.class.getName()).log(Level.SEVERE, null, ex);
                      return "Failed";
                  }

}

   public static ArrayList<String> showUserInfo() {
   Connection conn = null;
   Statement stmt = null;
   try{
      //STEP 2: Register JDBC driver
      Class.forName("com.mysql.jdbc.Driver");

      //STEP 3: Open a connection
      System.out.println("Connecting to a selected database...");
      conn = DriverManager.getConnection(DB_URL, USER, PASS);
      System.out.println("Connected database successfully...");
      
      //STEP 4: Execute a query
      System.out.println("Creating statement...");
      stmt = conn.createStatement();

      String sql = "SELECT * from user";
      //System.out.print(sql);
      ResultSet rs = stmt.executeQuery(sql);
      //STEP 5: Extract data from result set
      showuserInfo.clear();
      while(rs.next()){
         //Retrieve by column name
          showuserInfo.add(Integer.toString(rs.getInt("user_id")));
          showuserInfo.add(rs.getString("name"));
          showuserInfo.add(rs.getString("first_name"));
          showuserInfo.add(rs.getString("last_name"));
          showuserInfo.add(rs.getString("company_name"));
          showuserInfo.add(rs.getString("company_service"));
          showuserInfo.add(rs.getString("company_web"));
          showuserInfo.add(rs.getString("designation"));
          showuserInfo.add(rs.getString("email"));
          showuserInfo.add(rs.getString("alternate_email"));
          showuserInfo.add(rs.getString("mobile"));
          showuserInfo.add(rs.getString("office_phone"));
          showuserInfo.add(rs.getString("address"));
          showuserInfo.add(Integer.toString(rs.getInt("country_code")));
          showuserInfo.add(rs.getString("password"));
          showuserInfo.add(rs.getString("create_date"));
          showuserInfo.add(rs.getString("update_date"));


      }
      rs.close();
   }catch(SQLException se){
      //Handle errors for JDBC
      se.printStackTrace();
   }catch(Exception e){
      //Handle errors for Class.forName
      e.printStackTrace();
   }finally{
      //finally block used to close resources
      try{
         if(stmt!=null)
            conn.close();
      }catch(SQLException se){
      }// do nothing
      try{
         if(conn!=null)
            conn.close();
      }catch(SQLException se){
         se.printStackTrace();
      }//end finally try
   }//end try
        //System.out.println("size of cat"+catOFProduct.size());
//       for(int i=0;i<userInfo.size();i++)
//           System.out.println("uerInfo "+userInfo.get(i));
        //System.out.println("size of catarray"+catOFProduct.size());
       return showuserInfo;
}
   
   
}
