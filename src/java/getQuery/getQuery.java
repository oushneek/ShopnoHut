/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package getQuery;

import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author Tazbeea Tazakka
 */
public class getQuery {
    
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
    static final String DB_URL = "jdbc:mysql://localhost/shopnohut";
    
    static final String USER = "root";
    static final String PASS = "1234";
    
    static ArrayList<String> categoryDetails = new ArrayList<String>();
    static ArrayList<String> subcategoryDetails = new ArrayList<String>();
    static ArrayList<String> productDetailsCategory = new ArrayList<String>();
    static ArrayList<String> productDetailsSubcategory = new ArrayList<String>();
    static ArrayList<String> productDetails = new ArrayList<String>();
    static ArrayList<String> subcatOFProduct = new ArrayList<String>();
    static ArrayList<String> catOFProduct=new ArrayList<String>();
    static ArrayList<String> allProduct=new ArrayList<String>();
    static ArrayList<String> message=new ArrayList<String>();
    
   static int total;
   static int countmsg;

    public static ArrayList<String> getCategory() {
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

            String sql = "SELECT * FROM category";
            ResultSet rs = stmt.executeQuery(sql);
            //STEP 5: Extract data from result set
            categoryDetails.clear();
            while(rs.next()){
               //Retrieve by column name
               String cat_id  =Integer.toString(rs.getInt("category_id"));
               String cat_name = rs.getString("category_name");
               categoryDetails.add(cat_id);
               categoryDetails.add(cat_name);


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
             return categoryDetails;
      }//end main
  
    public static ArrayList<String> getSubCategory(String categoryid) {
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

      String sql = "SELECT * FROM subcategory where category_id="+categoryid;
      //System.out.print(sql);
      ResultSet rs = stmt.executeQuery(sql);
      //STEP 5: Extract data from result set
      subcategoryDetails.clear();
      while(rs.next()){
         //Retrieve by column name
         String sc_id  =Integer.toString(rs.getInt("subcategory_id"));
         String sc_name = rs.getString("subcategory_name");
         subcategoryDetails.add(sc_id);
         subcategoryDetails.add(sc_name);
         

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
        categoryid="";
        //System.out.println(subcategoryDetails.size());
       for(int i=0;i<subcategoryDetails.size();i++)
           System.out.print(subcategoryDetails.get(i));
       return subcategoryDetails;
}//end main

    public static ArrayList<String> getSubCategoryOFProduct(String categoryid,String product_code) {
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

      String sql = "SELECT * FROM subcategory natural join product_info where category_id="+categoryid+" and code="+product_code;
      //System.out.print(sql);
      ResultSet rs = stmt.executeQuery(sql);
      //STEP 5: Extract data from result set
      subcatOFProduct.clear();
      while(rs.next()){
         //Retrieve by column name
         String sc_id  =Integer.toString(rs.getInt("subcategory_id"));
         String sc_name = rs.getString("subcategory_name");
         subcatOFProduct.add(sc_id);
         subcatOFProduct.add(sc_name);
         

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
        categoryid="";
        product_code="";
        //System.out.println(subcategoryDetails.size());
       //for(int i=0;i<subcategoryDetails.size();i++)
         //  System.out.print(subcategoryDetails.get(i));
       return subcatOFProduct;
}//end main

    public static ArrayList<String> getCategoryOFProduct(String product_code) {
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

      String sql = "SELECT * FROM subcategory natural join product_info natural join category where code="+product_code;
      //System.out.print(sql);
      ResultSet rs = stmt.executeQuery(sql);
      //STEP 5: Extract data from result set
      catOFProduct.clear();
      while(rs.next()){
         //Retrieve by column name
         String cat_id  =Integer.toString(rs.getInt("category_id"));
         String cat_name = rs.getString("category_name");
         catOFProduct.add(cat_id);
         catOFProduct.add(cat_name);
         

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
        product_code="";
        //System.out.println("size of cat"+catOFProduct.size());
       //for(int i=0;i<subcategoryDetails.size();i++)
         //  System.out.print(subcategoryDetails.get(i));
        //System.out.println("size of catarray"+catOFProduct.size());
       return catOFProduct;
}//end main

    public static ArrayList<String> getProductDetailsCategory(String categoryid,int page) {
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

      String sql = "SELECT * FROM product_info natural join subcategory where category_id="+categoryid+" limit "+page+",10";
      ResultSet rs = stmt.executeQuery(sql);
      //STEP 5: Extract data from result set
      productDetailsCategory.clear();
      while(rs.next()){
         
         productDetailsCategory.add(Integer.toString(rs.getInt("code")));
         productDetailsCategory.add(Integer.toString(rs.getInt("subcategory_id")));
         productDetailsCategory.add(rs.getString("name"));
         productDetailsCategory.add(rs.getString("image_url"));
         productDetailsCategory.add(Double.toString(rs.getDouble("price_sell")));
         productDetailsCategory.add(Integer.toString(rs.getInt("total_quantity")));
         productDetailsCategory.add(rs.getString("description"));
         productDetailsCategory.add(Double.toString(rs.getDouble("discount")));
         
         
         
         
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
        categoryid="";
        return productDetailsCategory;
}//end
   
    public static ArrayList<String> getProductDetailsSubcategory(String categoryid,String subcategoryid,int page) {
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
      
      //subcategory product call
       System.out.println("subcategory product call");
      String sql = "SELECT * FROM product_info natural join subcategory where category_id="+categoryid+" and subcategory_id="+subcategoryid+" limit "+page+",10";
      ResultSet rs = stmt.executeQuery(sql);
      //STEP 5: Extract data from result set
      productDetailsSubcategory.clear();
      while(rs.next()){
         //Retrieve by column name
         //String sc_id  =Integer.toString(rs.getInt("sc_id"));
         //String sc_name = rs.getString("sc_name");
          //System.out.println(rs.getString("photo"));
         productDetailsSubcategory.add(Integer.toString(rs.getInt("code")));
         productDetailsSubcategory.add(Integer.toString(rs.getInt("subcategory_id")));
         productDetailsSubcategory.add(rs.getString("name"));
         productDetailsSubcategory.add(rs.getString("image_url"));
         productDetailsSubcategory.add(Double.toString(rs.getDouble("price_sell")));
         productDetailsSubcategory.add(Integer.toString(rs.getInt("total_quantity")));
         productDetailsSubcategory.add(rs.getString("description"));
         productDetailsSubcategory.add(Double.toString(rs.getDouble("discount")));
         //productDetailsSubcategory.add(Integer.toString(rs.getInt("cat_id")));
         //productDetailsSubcategory.add(rs.getString("p_price_change_date"));
         //productDetailsSubcategory.add(rs.getString("p_entry_date"));
         //System.out.println(productDetailsSubcategory.size());
         
         
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
        categoryid="";
  //      System.out.println(productDetailsSubcategory.size());
       return productDetailsSubcategory;
}//end

    public  static ArrayList<String> getProductDetails(String code) {
    System.out.println("product details product code "+code);
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

      String sql = "SELECT * FROM product_info where code="+code;
      ResultSet rs = stmt.executeQuery(sql);
      //STEP 5: Extract data from result set
      productDetails.clear();
      while(rs.next()){
         //Retrieve by column name
         //String sc_id  =Integer.toString(rs.getInt("sc_id"));
         //String sc_name = rs.getString("sc_name");
         productDetails.add(Integer.toString(rs.getInt("code")));
         productDetails.add(Integer.toString(rs.getInt("subcategory_id")));
         productDetails.add(rs.getString("name"));
         productDetails.add(rs.getString("image_url"));
         productDetails.add(Double.toString(rs.getDouble("price_sell")));
         productDetails.add(Double.toString(rs.getDouble("discount")));
         productDetails.add(rs.getString("description"));
         productDetails.add(rs.getString("total_quantity"));
         
      }
      rs.close();
   }catch(SQLException se){
      //Handle errors for JDBC
//      se.printStackTrace();
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
        
        System.out.println("code="+code+"  productdetails "+productDetails.size());
        code="";
       return productDetails;
}//end

    public  static ArrayList<String> getAllProduct() {
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

      String sql = "SELECT * FROM product_info";
      ResultSet rs = stmt.executeQuery(sql);
      //STEP 5: Extract data from result set
      allProduct.clear();
      while(rs.next()){
         
         allProduct.add(Integer.toString(rs.getInt("code")));
         allProduct.add(rs.getString("name"));
         allProduct.add(Double.toString(rs.getDouble("price_sell")));
         
         
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
        
        //System.out.println("code="+code+"  productdetails "+productDetails.size());
        //code="";
       return allProduct;
}//end
   
    public static int countProductCategory(String categoryid) {
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

      String sql = "SELECT count(code) as total FROM product_info natural join subcategory where category_id="+categoryid;
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
        categoryid="";
        return total;
}//end
   
     public static int countProductSubCategory(String categoryid,String subcategoryid) {
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

      String sql = "SELECT count(code) as total FROM product_info natural join subcategory where category_id="+categoryid+" and subcategory_id="+subcategoryid;
      ResultSet rs = stmt.executeQuery(sql);
      //STEP 5: Extract data from result set
      total=0;
      while(rs.next()){
         
         total=rs.getInt(total);
         
         
         
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
        categoryid="";
        return total;
}//end
   
     public  static ArrayList<String> getMessage(int page) {
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

      String sql = "SELECT * FROM message order by message_id desc limit "+page+",10";
      ResultSet rs = stmt.executeQuery(sql);
      //STEP 5: Extract data from result set
      message.clear();
      while(rs.next()){
         //Retrieve by column name
         //String sc_id  =Integer.toString(rs.getInt("sc_id"));
         //String sc_name = rs.getString("sc_name");
         message.add(rs.getString("name"));
         message.add(rs.getString("date"));
         message.add(rs.getString("email"));
         message.add(rs.getString("message"));


      }
      rs.close();
   }catch(SQLException se){
      //Handle errors for JDBC
//      se.printStackTrace();
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
        
       return message;
}//end

    public static int countmessage() {
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

      String sql = "SELECT count(message_id) as countmessage FROM message";
      ResultSet rs = stmt.executeQuery(sql);
      //STEP 5: Extract data from result set
      countmsg=0;
      while(rs.next()){
         
         countmsg=rs.getInt("countmessage");
         
         
         
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
        return countmsg;
}//end

}
