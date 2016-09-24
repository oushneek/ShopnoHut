/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package wishlist;

import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author Tazbeea Tazakka
 */
public class show_wishlist {
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
    static final String DB_URL = "jdbc:mysql://localhost/shopnohut";
    
    static final String USER = "root";
    static final String PASS = "1234";
    static ArrayList<String> wishlist=new ArrayList<String>();
    static int total;
    public static ArrayList<String> wishlist(String userid,int page){
        Connection conn = null;
        Statement stmt = null;
             
                  if(page==1)
                        page=0;
                  else if(page>1)
                        page=(page-1)*10;
                               try{
                       Class.forName("com.mysql.jdbc.Driver");
                       conn = DriverManager.getConnection(DB_URL, USER, PASS);
                       stmt = conn.createStatement();
                       
                       String sql="select * from wishlist where wishlist_id="+userid+" limit "+page+",10";
                       ResultSet rs=stmt.executeQuery(sql);
                       wishlist.clear();
                       while(rs.next()){
                           wishlist.add(Integer.toString(rs.getInt("code")));
                           wishlist.add(rs.getString("create_date"));
                       }
                       userid="";
                       return wishlist;
                  }
                  catch (SQLException ex) {
                      // Logger.getLogger(EntryForm.class.getName()).log(Level.SEVERE, null, ex);
                      
                  } 
                  catch (ClassNotFoundException ex) {
                     //  Logger.getLogger(EntryForm.class.getName()).log(Level.SEVERE, null, ex);
                      
                  }

                  return wishlist;
            }


     public static int countwishlist(String user_id) {
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

      String sql = "SELECT count(code) as total FROM wishlist where user_id="+user_id;
      ResultSet rs = stmt.executeQuery(sql);
      //STEP 5: Extract data from result set
      total=0;
      while(rs.next()){
         
         total=rs.getInt("total");
         
         
         
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
        return total;
}//end
   
}
