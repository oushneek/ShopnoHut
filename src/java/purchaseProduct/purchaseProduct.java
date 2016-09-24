/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package purchaseProduct;

import java.sql.*;
import jspcode.*;

/**
 *
 * @author Tazbeea Tazakka
 */
public class purchaseProduct {
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
    static final String DB_URL = "jdbc:mysql://localhost/shopnohut";
    
    static final String USER = "root";
    static final String PASS = "1234";
    
    static String lastPurchaseId=new String();

        
     public static void update_purchase_history(String unit_cost,String quantity,String date){
     Connection conn = null;
                  Statement stmt = null;
             
                  
                  try{
                       Class.forName("com.mysql.jdbc.Driver");
                       conn = DriverManager.getConnection(DB_URL, USER, PASS);
                       stmt = conn.createStatement();
                       //String sql="insert into category(category_name) values ('"+name+"')";
                       double unitCost=Double.parseDouble(unit_cost);
                       double Qty=Double.parseDouble(quantity);
                       double total_cost=unitCost*Qty;
                       String cost= String.valueOf(total_cost);
                       
                       String sql="insert into purchase_history(unit_cost,quantity,total_cost,create_date) values('"+unit_cost+"','"+quantity+"','"+cost+"','"+date+"')";
                       stmt.executeUpdate(sql);
                       //return "Done";
                  }
                  catch (SQLException ex) {
                      // Logger.getLogger(EntryForm.class.getName()).log(Level.SEVERE, null, ex);
                      //return "Failed";
                  } 
                  catch (ClassNotFoundException ex) {
                     //  Logger.getLogger(EntryForm.class.getName()).log(Level.SEVERE, null, ex);
                      //return "Failed";
                  }

}

     public static void update_product_info(String product_code,String quantity,String selling_price){
     Connection conn = null;
                  Statement stmt = null;
             
                  
                  try{
                       Class.forName("com.mysql.jdbc.Driver");
                       conn = DriverManager.getConnection(DB_URL, USER, PASS);
                       stmt = conn.createStatement();
                       
                       String sql="update product_info set price_sell="+selling_price+",total_quantity=total_quantity+"+quantity+" where code="+product_code ;

                       stmt.executeUpdate(sql);
                       //return "Done";
                  }
                  catch (SQLException ex) {
                      // Logger.getLogger(EntryForm.class.getName()).log(Level.SEVERE, null, ex);
                      //return "Failed";
                  } 
                  catch (ClassNotFoundException ex) {
                     //  Logger.getLogger(EntryForm.class.getName()).log(Level.SEVERE, null, ex);
                      //return "Failed";
                  }

}
     
     public static void insert_into_relational_table(String purchase_id,String product_code){
            Connection conn = null;
            Statement stmt = null;
             
                  
                try{
                       Class.forName("com.mysql.jdbc.Driver");
                       conn = DriverManager.getConnection(DB_URL, USER, PASS);
                       stmt = conn.createStatement();
                       
                       String sql="insert into relational_table(purchase_id,code) values('"+purchase_id+"','"+product_code+"')";
                       stmt.executeUpdate(sql);
                       //return "Done";
                  }
                  catch (SQLException ex) {
                      // Logger.getLogger(EntryForm.class.getName()).log(Level.SEVERE, null, ex);
                      //return "Failed";
                  } 
                  catch (ClassNotFoundException ex) {
                     //  Logger.getLogger(EntryForm.class.getName()).log(Level.SEVERE, null, ex);
                      //return "Failed";
                  }

    }

     public static void create_product_id(String purchase_id,String product_code){
            Connection conn = null;
            Statement stmt = null;
             
                  
                try{
                       Class.forName("com.mysql.jdbc.Driver");
                       conn = DriverManager.getConnection(DB_URL, USER, PASS);
                       stmt = conn.createStatement();
                       
                       String sql="insert into product(code,purchase_id) values('"+product_code+"','"+purchase_id+"')";
                       stmt.executeUpdate(sql);
                       //return "Done";
                  }
                  catch (SQLException ex) {
                      // Logger.getLogger(EntryForm.class.getName()).log(Level.SEVERE, null, ex);
                      //return "Failed";
                  } 
                  catch (ClassNotFoundException ex) {
                     //  Logger.getLogger(EntryForm.class.getName()).log(Level.SEVERE, null, ex);
                      //return "Failed";
                  }

    }
     
     public  static String getLastPurchaseId() {
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

      String sql = "select max(purchase_id) as purchase_id_high from purchase_history";
      ResultSet rs = stmt.executeQuery(sql);
      //STEP 5: Extract data from result set
      
      while(rs.next()){
          lastPurchaseId=Integer.toString(rs.getInt("purchase_id_high"));
      }
      System.out.println("lastpurchaseid="+lastPurchaseId);
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
       return lastPurchaseId;
}//end
    
}
