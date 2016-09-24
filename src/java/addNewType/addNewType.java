/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package addNewType;

import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author Tazbeea Tazakka
 */
public class addNewType {
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
    static final String DB_URL = "jdbc:mysql://localhost/shopnohut";
    
    static final String USER = "root";
    static final String PASS = "1234";
    public static int code;
    
    
    public static String add_new_cateogry(String name){
     Connection conn = null;
                  Statement stmt = null;
             
                  
                  try{
                       Class.forName("com.mysql.jdbc.Driver");
                       conn = DriverManager.getConnection(DB_URL, USER, PASS);
                       stmt = conn.createStatement();
                       String sql="insert into category(category_name) values ('"+name+"')";
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

    public static String add_new_subcateogry(String cat_id,String name){
     Connection conn = null;
                  Statement stmt = null;
                  
                  try{
                       Class.forName("com.mysql.jdbc.Driver");
                       conn = DriverManager.getConnection(DB_URL, USER, PASS);
                       stmt = conn.createStatement();
//                       String sql="INSERT INTO (c_name,c_email,c_mobile,c_address,c_pass) customer VALUES ('"+user_data[0]+"','"+user_data[1]+"','1','"+user_data[3]+"','"+user_data[4]+"')";
                       String sql="insert into subcategory(category_id,subcategory_name) values ('"+cat_id+"','"+name+"')";
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

    public static String add_new_product(String name, String cat_id,String subcat_id,String discount,String price_sell,String description,String entry_date){
    Connection conn = null;
                  Statement stmt = null;
                  
                  try{
                       Class.forName("com.mysql.jdbc.Driver");
                       conn = DriverManager.getConnection(DB_URL, USER, PASS);
                       stmt = conn.createStatement();
                       
                       String image_url=name;
                       
                       

                       String sql="insert into product_info(subcategory_id,name,price_sell,description,total_quantity,discount,image_url) values ('"+subcat_id+"','"+name+"','0.00','"+description+"','0','0.00','"+image_url+"')";
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

    public static String add_new_product_image(String image,int code){
    Connection conn = null;
                  Statement stmt = null;
                  
                  try{
                       Class.forName("com.mysql.jdbc.Driver");
                       conn = DriverManager.getConnection(DB_URL, USER, PASS);
                       stmt = conn.createStatement();
                       
                       //System.out.println("image url = "+image);
                       String sql="update product_info set image_url='"+image+"' where code="+code;
                       
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

        public static int countProduct() {
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

      String sql = "SELECT max(code) as max_code from product_info";
      ResultSet rs = stmt.executeQuery(sql);
      //STEP 5: Extract data from result set
      code=0;
      while(rs.next()){
         
         code=rs.getInt("max_code");
         
         
         
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
        return code;
}//end

}
