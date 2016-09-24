/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package specialProduct;
import java.sql.*;
import java.util.ArrayList;
/**
 *
 * @author Tazbeea Tazakka
 */
public class specialProduct {
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
    static final String DB_URL = "jdbc:mysql://localhost/shopnohut";
    
    static final String USER = "root";
    static final String PASS = "1234";
    
        static ArrayList<String> featured=new ArrayList<String>();
        static ArrayList<String> popular=new ArrayList<String>();

    
     public static void add_special_product(String special,String type){
     Connection conn = null;
                  Statement stmt = null;
             
                  
                  try{
                       Class.forName("com.mysql.jdbc.Driver");
                       conn = DriverManager.getConnection(DB_URL, USER, PASS);
                       stmt = conn.createStatement();
                       String sql="insert into special_product values ('"+special+"','"+type+"')";
                       stmt.executeUpdate(sql);
                       //return "Done";
                  }
                  catch (SQLException ex) {
                      // Logger.getLogger(EntryForm.class.getName()).log(Level.SEVERE, null, ex);
                     // return "Failed";
                  } 
                  catch (ClassNotFoundException ex) {
                     //  Logger.getLogger(EntryForm.class.getName()).log(Level.SEVERE, null, ex);
                      //return "Failed";
                  }

}
    
    public static void delete_special_product(){
     Connection conn = null;
                  Statement stmt = null;
             
                  
                  try{
                       Class.forName("com.mysql.jdbc.Driver");
                       conn = DriverManager.getConnection(DB_URL, USER, PASS);
                       stmt = conn.createStatement();
                       String sql="delete from special_product";
                       stmt.executeUpdate(sql);
                       //return "Done";
                  }
                  catch (SQLException ex) {
                      // Logger.getLogger(EntryForm.class.getName()).log(Level.SEVERE, null, ex);
                     // return "Failed";
                  } 
                  catch (ClassNotFoundException ex) {
                     //  Logger.getLogger(EntryForm.class.getName()).log(Level.SEVERE, null, ex);
                      //return "Failed";
                  }

}
    
    public static ArrayList<String> getFeaturedProduct() {
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

            String sql = "SELECT * FROM special_product natural join product_info where type='featured'";
            ResultSet rs = stmt.executeQuery(sql);
            //STEP 5: Extract data from result set
            featured.clear();
            while(rs.next()){
               //Retrieve by column name
               
               featured.add(Integer.toString(rs.getInt("code")));
               featured.add(rs.getString("image_url"));
               featured.add(rs.getString("name"));
               featured.add(rs.getString("description"));
               


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
             return featured;
      }//end main
    
    public static ArrayList<String> getPopularProduct() {
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

            String sql = "SELECT * FROM special_product natural join product_info where type='popular'";
            ResultSet rs = stmt.executeQuery(sql);
            //STEP 5: Extract data from result set
            popular.clear();
            while(rs.next()){
               //Retrieve by column name
               
               popular.add(Integer.toString(rs.getInt("code")));
               popular.add(rs.getString("image_url"));
               popular.add(rs.getString("product_info.name"));
               popular.add(Double.toString(rs.getDouble("product_info.price_sell")));


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
             return popular;
      }//end main
    
}