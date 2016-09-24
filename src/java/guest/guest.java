/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package guest;

import java.sql.*;

/**
 *
 * @author Tazbeea Tazakka
 */
public class guest {
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
    static final String DB_URL = "jdbc:mysql://localhost/shopnohut";
    
    static final String USER = "root";
    static final String PASS = "1234";
    
    static String lastGuestId=new String();
    
    public static String create_guest(){
    Connection conn = null;
                  Statement stmt = null;
                  
                  try{
                       Class.forName("com.mysql.jdbc.Driver");
                       conn = DriverManager.getConnection(DB_URL, USER, PASS);
                       stmt = conn.createStatement();
                       String sql="insert into guest(id_user_type) values(2)";
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

    public  static String getLastGuestId() {
    //System.out.println("product details product code "+code);
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

      String sql = "select max(guest_id) as guest_id_high from guest";
      ResultSet rs = stmt.executeQuery(sql);
      //STEP 5: Extract data from result set
      
      while(rs.next()){
          lastGuestId=Integer.toString(rs.getInt("guest_id_high"));
      }
      //System.out.println("lastpurchaseid="+lastGuestId);
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
        
        //System.out.println("code="+code+"  productdetails "+productDetails.size());
        //code="";
       return lastGuestId;
}//end
    
    public static void delete_guest_ID(String guest_id) {
   Connection conn = null;
   Statement stmt = null;
   boolean matched=false;
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
      String sql="";
      sql="delete from guest where guest_id="+guest_id;
      stmt.executeUpdate(sql);
      
   }catch(SQLException se){
      //Handle errors for JDBC
      se.printStackTrace();
      //return true;
   }catch(Exception e){
      //Handle errors for Class.forName
      e.printStackTrace();
    // return true;
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
       //return matched;
       
   
}//end main

}
