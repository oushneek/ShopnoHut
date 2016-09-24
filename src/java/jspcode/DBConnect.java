/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package jspcode;

import java.sql.*;
import java.util.ArrayList;

public class DBConnect {
   // JDBC driver name and database URL
   static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
   static final String DB_URL = "jdbc:mysql://localhost/shopnohut";
   static ArrayList<String> userDetails=new ArrayList<String>();
   static ArrayList<String> cart=new ArrayList<String>();
   static String firstProductId;
   static String qty;
   static String price_buy;
   static String price_sell;
   static String trasactionid;
   static String previous_balance;
   static ArrayList<String> pending_order=new ArrayList<String>();
   static ArrayList<String> profit=new ArrayList<String>();
   static ArrayList<String> my_order=new ArrayList<String>();
   static ArrayList<Double> price=new ArrayList<Double>();
   static int countorder;
   static int countprev;
   //  Database credentials
   static final String USER = "root";
   static final String PASS = "1234";
   


public static String insertIntoCart(String code,String unit_price,String quantity,String create_date,String user_id,String guest_id){
                  Connection conn = null;
                  Statement stmt = null;
                  try{
                       Class.forName("com.mysql.jdbc.Driver");
                       conn = DriverManager.getConnection(DB_URL, USER, PASS);
                       stmt = conn.createStatement();
                       
                       checkMatchInCart(code,user_id,guest_id);
                       //System.out.println("boolean "+matched);
                       String sql="";
                       if(Global.matched==false){
                           System.out.println("if condition works");
                           System.out.println("user id and guest in insertintocart()"+user_id+"and"+guest_id);
                           if(user_id==null)
                                sql="insert into cart(code,quantity,price,total_price,create_date,update_date,guest_id) values ('"+code+"','"+quantity+"','"+unit_price+"','"+unit_price+"','"+create_date+"','"+create_date+"','"+guest_id+"')";
                           else 
                                sql="insert into cart(code,quantity,price,total_price,create_date,update_date,user_id) values ('"+code+"','"+quantity+"','"+unit_price+"','"+unit_price+"','"+create_date+"','"+create_date+"','"+user_id+"')";
                           
                           stmt.executeUpdate(sql);
                           //Global.cart_id++;
                       }
                       else {
                           Global.matched=false;
                           System.out.println("else condition works");
                       }
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

public static void checkMatchInCart(String code,String user_id,String guest_id) {
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
       if(user_id!=null)
         sql="Select * from cart where user_id="+user_id;
       else
           sql="Select * from cart where guest_id="+guest_id;
                       ResultSet rs = stmt.executeQuery(sql);
                       
                       while(rs.next()){
         //Retrieve by column name
                        String code_this = Integer.toString(rs.getInt("code"));
                        if(code_this.equals(code)){
                            Global.matched=true;
                            System.out.println("same product added before");
                            System.out.println(Global.matched);
                            //return true;
                        }
                        //System.out.println("user id of rs = and code is "+code_this);
                       }
                       rs.close();
      
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

public static ArrayList<String> getCartHistory(String userid,String guestid) {
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

            String sql=null;
            if(userid==null)
            {
               sql = "SELECT * FROM cart natural join product_info where guest_id="+guestid;
            }      
            else{
                sql = "SELECT * FROM cart natural join product_info where user_id="+userid;
            }
            ResultSet rs = stmt.executeQuery(sql);
            //STEP 5: Extract data from result set
            cart.clear();
            while(rs.next()){
               //Retrieve by column name
               cart.add(Integer.toString(rs.getInt("code")));
               cart.add(rs.getString("name"));
               cart.add(Double.toString(rs.getDouble("price_sell")));
               cart.add(Double.toString(rs.getDouble("discount")));
               cart.add(Integer.toString(rs.getInt("quantity")));

               
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
        
             return cart;
      }//end main

public static void update_cart(String product_code,String quantity,String userid,String guestid){
     Connection conn = null;
                  Statement stmt = null;
             
                  
                  try{
                       Class.forName("com.mysql.jdbc.Driver");
                       conn = DriverManager.getConnection(DB_URL, USER, PASS);
                       stmt = conn.createStatement();
                       String sql="";
                       if(userid==null){
                            sql="update cart set quantity="+quantity+" where code="+product_code+" and guest_id="+guestid ;
                       }
                       else
                           sql="update cart set quantity="+quantity+" where code="+product_code+" and user_id="+userid ;

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

public static void delete_guest_cart(String guest_id) {
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
      sql="delete from cart where guest_id="+guest_id;
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

public  static String getFirstProductId(String code) {
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

      String sql = "select min(product_id) as product_id_frst from product where code="+code+" and is_sold=0";
      ResultSet rs = stmt.executeQuery(sql);
      //STEP 5: Extract data from result set
      
      while(rs.next()){
          firstProductId=Integer.toString(rs.getInt("product_id_frst"));
      }
      System.out.println("lastpurchaseid="+firstProductId);
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
       return firstProductId;
}//end
    
public static String insertIntoOrderList(String product_id,String user_id,String date,String new_address){
                  Connection conn = null;
                  Statement stmt = null;
                  try{
                       Class.forName("com.mysql.jdbc.Driver");
                       conn = DriverManager.getConnection(DB_URL, USER, PASS);
                       stmt = conn.createStatement();
                       
                       //System.out.println("boolean "+matched);
                       String sql="";
                       sql="insert into order_list(product_id,user_id,create_date,update_date,new_address) values ('"+product_id+"','"+user_id+"','"+date+"','"+date+"','"+new_address+"')";
                           
                       stmt.executeUpdate(sql);
                         
                       updateProduct(product_id);
                       
                       delete_user_cart(user_id);
                       
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

public static String updateProduct(String product_id){
                  Connection conn = null;
                  Statement stmt = null;
                  try{
                       Class.forName("com.mysql.jdbc.Driver");
                       conn = DriverManager.getConnection(DB_URL, USER, PASS);
                       stmt = conn.createStatement();
                       
                       //System.out.println("boolean "+matched);
                       String sql="";
                       sql="update product set is_sold=1 where product_id="+product_id;
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

public static void delete_user_cart(String user_id) {
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
      sql="delete from cart where user_id="+user_id;
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

public  static String getProductQty(String code) {
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

      String sql = "select total_quantity as qty from product_info where code="+code;
      ResultSet rs = stmt.executeQuery(sql);
      //STEP 5: Extract data from result set
      
      while(rs.next()){
          qty=Integer.toString(rs.getInt("qty"));
      }
      //System.out.println("lastpurchaseid="+firstProductId);
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
       return qty;
}//end

public static void updateProductQty(String code,String quantity ){
                  Connection conn = null;
                  Statement stmt = null;
                  try{
                       Class.forName("com.mysql.jdbc.Driver");
                       conn = DriverManager.getConnection(DB_URL, USER, PASS);
                       stmt = conn.createStatement();
                       
                       //System.out.println("boolean "+matched);
                       String sql="";
                       sql="update product_info set total_quantity=total_quantity-"+quantity+" where code="+code;
                       stmt.executeUpdate(sql);
                         
                      
                  }
                  catch (SQLException ex) {
                      // Logger.getLogger(EntryForm.class.getName()).log(Level.SEVERE, null, ex);
                  } 
                  catch (ClassNotFoundException ex) {
                     //  Logger.getLogger(EntryForm.class.getName()).log(Level.SEVERE, null, ex);
                  }

}

public  static String getprice_buy(String productid) {
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

      String sql = "select unit_cost as price_buy from product natural join purchase_history where product_id="+productid;
      ResultSet rs = stmt.executeQuery(sql);
      //STEP 5: Extract data from result set
      
      while(rs.next()){
          price_buy=Double.toString(rs.getDouble("price_buy"));
      }
      //System.out.println("lastpurchaseid="+firstProductId);
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
       return price_buy;
}//end

public  static String getprice_sell(String productid) {
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

      String sql = "select price_sell as price_sell,discount from product natural join product_info where product_id="+productid;
      ResultSet rs = stmt.executeQuery(sql);
      //STEP 5: Extract data from result set
      price.clear();
      while(rs.next()){
          price.add(rs.getDouble("price_sell"));
          price.add(rs.getDouble("discount"));
          
      }
      price_sell=Double.toString(price.get(0)-price.get(1));
      //System.out.println("lastpurchaseid="+firstProductId);
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
       return price_sell;
}//end

public static String create_transaction(String product_id,String price_buy,String price_sell,String date){
                  Connection conn = null;
                  Statement stmt = null;
                  try{
                       Class.forName("com.mysql.jdbc.Driver");
                       conn = DriverManager.getConnection(DB_URL, USER, PASS);
                       stmt = conn.createStatement();
                       
                       
                       //System.out.println("boolean "+matched);
                       String sql="";
                            
                       sql="insert into transaction(product_id,price_buy,price_sell,create_date,update_date) values ('"+product_id+"','"+price_buy+"','"+price_sell+"','"+date+"','"+date+"')";
                           
                       stmt.executeUpdate(sql);
                           //Global.cart_id++;
                       
                       
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

public  static String gettransactionId() {
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

      String sql = "select max(transaction_id) as transaction_id_high from transaction";
      ResultSet rs = stmt.executeQuery(sql);
      //STEP 5: Extract data from result set
      
      while(rs.next()){
          trasactionid=Integer.toString(rs.getInt("transaction_id_high"));
      }
      //System.out.println("lastpurchaseid="+firstProductId);
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
       return trasactionid;
}//end

public static String create_account_balance(String transactionid){
                  Connection conn = null;
                  Statement stmt = null;
                  try{
                       Class.forName("com.mysql.jdbc.Driver");
                       conn = DriverManager.getConnection(DB_URL, USER, PASS);
                       stmt = conn.createStatement();
                       
                       Double buy_price=Double.parseDouble(price_buy);
                       Double sell_price=Double.parseDouble(price_sell);
                       Double profit=sell_price-buy_price;
                       //System.out.println("boolean "+matched);
                       String previous_balance="";
                       if(!transactionid.equals("1")){
                           int trans_id=Integer.parseInt(transactionid)-1;
                           previous_balance=get_previous_balance(Integer.toString(trans_id));
                       }
                       else 
                           previous_balance="0.00";
                       Double old=Double.parseDouble(previous_balance);
                       Double newbalance=old+profit;
                       String new_balance=Double.toString(newbalance);
                       String sql="";
                       sql="insert into accounts(transaction_id,new_balance) values ('"+transactionid+"','"+new_balance+"')";
                       stmt.executeUpdate(sql);
                           //Global.cart_id++;
                       
                       
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

public  static String get_previous_balance(String transaction_id) {
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

      String sql = "select new_balance as previous_balance from accounts where transaction_id="+transaction_id;
      ResultSet rs = stmt.executeQuery(sql);
      //STEP 5: Extract data from result set
      
      while(rs.next()){
          previous_balance=Double.toString(rs.getDouble("previous_balance"));
      }
      //System.out.println("lastpurchaseid="+firstProductId);
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
       return previous_balance;
}//end

public static void delete_item_from_my_cart(String code,String user_id,String guest_id) {
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
      if(user_id==null)
        sql="delete from cart where guest_id="+guest_id+" and code="+code;
      else
        sql="delete from cart where user_id="+user_id+" and code="+code;
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

public static ArrayList<String> getPendingOrder(int page) {
        Connection conn = null;
        Statement stmt = null;
        if(page==1)
           page=0;
        else if(page>1)
           page=(page-1)*10;
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

            String sql=null;
            
            sql = "select order_id,product_id,product_info.name,user.user_id,user.name,email,mobile,address,new_address,order_list.create_date from (order_list join user using(user_id) ) join (product join product_info using(code)) using (product_id) where order_status=0 limit "+page+",10";
            ResultSet rs = stmt.executeQuery(sql);
            //STEP 5: Extract data from result set
            pending_order.clear();
            while(rs.next()){
               //Retrieve by column name
               pending_order.add(Integer.toString(rs.getInt("order_list.order_id")));
               pending_order.add(Integer.toString(rs.getInt("order_list.product_id")));
               pending_order.add(rs.getString("product_info.name"));
               pending_order.add(rs.getString("order_list.create_date"));
               pending_order.add(Integer.toString(rs.getInt("user.user_id")));
               pending_order.add(rs.getString("user.name"));
               pending_order.add(rs.getString("user.email"));
               pending_order.add(rs.getString("user.mobile"));
               String user_address=rs.getString("user.address");
              // System.out.println("user= "+user_address);
               String new_address= rs.getString("order_list.new_address");
               String address;
               if(new_address==null){
                   address=user_address;
                   pending_order.add(address);


               }
               else{
                   address=new_address;
                   pending_order.add(address);


               }
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
        
             return pending_order;
      }//end main

public static void confirm_order(String order_id) {
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

      String sql="";
      
      sql="update order_list set order_status=1 where order_id="+order_id;
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

public static ArrayList<String> getSentOrder(int page) {
        Connection conn = null;
        Statement stmt = null;
        if(page==1)
                        page=0;
                  else if(page>1)
                        page=(page-1)*10;
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

            String sql=null;
            
            sql = "select order_id,product_id,product_info.name,user.user_id,user.name,email,mobile,address,new_address,order_list.create_date from (order_list join user using(user_id) ) join (product join product_info using(code)) using (product_id) where order_status=1 limit "+page+",10";
            ResultSet rs = stmt.executeQuery(sql);
            //STEP 5: Extract data from result set
            pending_order.clear();
            while(rs.next()){
               //Retrieve by column name
               pending_order.add(Integer.toString(rs.getInt("order_list.order_id")));
               pending_order.add(Integer.toString(rs.getInt("order_list.product_id")));
               pending_order.add(rs.getString("product_info.name"));
               pending_order.add(rs.getString("order_list.create_date"));
               pending_order.add(Integer.toString(rs.getInt("user.user_id")));
               pending_order.add(rs.getString("user.name"));
               pending_order.add(rs.getString("user.email"));
               pending_order.add(rs.getString("user.mobile"));
               String user_address=rs.getString("user.address");
              // System.out.println("user= "+user_address);
               String new_address= rs.getString("order_list.new_address");
               String address;
               if(new_address==null){
                   address=user_address;
                   pending_order.add(address);


               }
               else{
                   address=new_address;
                   pending_order.add(address);


               }
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
        
             return pending_order;
      }//end main

public static ArrayList<String> getProfit() {
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

            String sql=null;
            
            sql="select transaction_id,product.product_id,product_info.name,transaction.price_buy,transaction.price_sell,new_balance as total_profit,transaction.create_date from accounts natural join transaction natural join product natural join product_info";
            ResultSet rs = stmt.executeQuery(sql);
            //STEP 5: Extract data from result set
            profit.clear();
            while(rs.next()){
               //Retrieve by column name
               profit.add(Integer.toString(rs.getInt("transaction_id")));
               profit.add(Integer.toString(rs.getInt("product.product_id")));
               profit.add(rs.getString("product_info.name"));
               profit.add(Double.toString(rs.getDouble("transaction.price_buy")));
               profit.add(Double.toString(rs.getDouble("transaction.price_sell")));
               profit.add(Double.toString(rs.getDouble("total_profit")));
               profit.add(rs.getString("transaction.create_date"));

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
        
             return profit;
      }//end main

public static ArrayList<String> getMyOrder(String user_id) {
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

            String sql=null;
            
            sql = "select product_info.name,user.address,order_list.new_address,order_list.create_date from (order_list join user using(user_id) ) join (product join product_info using(code)) using (product_id) where user_id="+user_id;
            ResultSet rs = stmt.executeQuery(sql);
            //STEP 5: Extract data from result set
            my_order.clear();
            while(rs.next()){
            
               my_order.add(rs.getString("product_info.name"));
               String user_address=rs.getString("user.address");
              // System.out.println("user= "+user_address);
               String new_address= rs.getString("order_list.new_address");
               String address;
               if(new_address==null){
                   address=user_address;
                   my_order.add(address);
               }
               else{
                   address=new_address;
                   my_order.add(address);


               }
               my_order.add(rs.getString("order_list.create_date"));

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
        
             return my_order;
      }//end main

public static String new_message(String name,String email,String message,String date){
                  Connection conn = null;
                  Statement stmt = null;
                  try{
                       Class.forName("com.mysql.jdbc.Driver");
                       conn = DriverManager.getConnection(DB_URL, USER, PASS);
                       stmt = conn.createStatement();
                       
                       //System.out.println("boolean "+matched);
                       String sql="";
                           sql="insert into message(name,email,message,date) values('"+name+"','"+email+"','"+message+"','"+date+"')";
                           System.out.println(sql);
                           stmt.executeUpdate(sql);
                           //Global.cart_id++;
                      
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

public static int countorder() {
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

      String sql = "SELECT count(order_id) as countorder FROM order_list where order_status=0";
      ResultSet rs = stmt.executeQuery(sql);
      //STEP 5: Extract data from result set
      countorder=0;
      while(rs.next()){
         
         countorder=rs.getInt("countorder");
         
         
         
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
        return countorder;
}//end

public static int countprevorder() {
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

      String sql = "SELECT count(order_id) as countorder FROM order_list where order_status=0";
      ResultSet rs = stmt.executeQuery(sql);
      //STEP 5: Extract data from result set
      countprev=0;
      while(rs.next()){
         
         countprev=rs.getInt("countorder");
         
         
         
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
        return countprev;
}//end

public static int countprofit() {
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

      String sql = "SELECT count(order_id) as countorder FROM order_list where order_status=0";
      ResultSet rs = stmt.executeQuery(sql);
      //STEP 5: Extract data from result set
      countorder=0;
      while(rs.next()){
         
         countorder=rs.getInt("countorder");
         
         
         
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
        return countorder;
}//end

}//end JDBCExample