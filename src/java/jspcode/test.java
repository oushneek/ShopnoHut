/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package jspcode;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import static jspcode.DBConnect.DB_URL;
import static jspcode.DBConnect.PASS;
import static jspcode.DBConnect.USER;

/**
 *
 * @author Tazbeea Tazakka
 */
public class test {
    public static void main(String[] args) {
        test t = new test();
        System.out.println(t.login_check());
    }
    public boolean login_check(){
        String[] login_data= new String[2];
    login_data[0]="a@b.com";
    login_data[1]="1";
    
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

     // String sql = "SELECT * FROM customer where c_email="+login_data[0]+" and c_pass="+login_data[1];
     // ResultSet rs = stmt.executeQuery(sql);
      String sql = "SELECT * FROM customer WHERE c_email=? AND c_pass=?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, login_data[0]); // parameters start from 1, not 0. also we're assuming the parameter type is String;
        pstmt.setString(2, login_data[1]); // assume indexTerm can be 100 and is an integer
        ResultSet rs = pstmt.executeQuery();
      //STEP 5: Extract data from result set
      String c_name="";
      while(rs.next()){
         //Retrieve by column name
         c_name  =rs.getString("c_name");
      }
      rs.close();
      if(c_name.equals(""))
          return false;
      else 
          return true;
   }catch(SQLException se){
      //Handle errors for JDBC
      se.printStackTrace();
      return false;
   }catch(Exception e){
      //Handle errors for Class.forName
      e.printStackTrace();
     return false;
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

}
}