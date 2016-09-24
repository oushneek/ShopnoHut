/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package discount;

import java.sql.*;
import java.util.ArrayList;
/**
 *
 * @author Tazbeea Tazakka
 */
public class discount {
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
    static final String DB_URL = "jdbc:mysql://localhost/shopnohut";
    
    static final String USER = "root";
    static final String PASS = "1234";
    
    public static String add_discount_to_product(String code, String discount){
    Connection conn = null;
                  Statement stmt = null;
                 // ArrayList<String> previous_details=getQuery.getQuery.getProductDetails(code);
                  
                  try{
                       Class.forName("com.mysql.jdbc.Driver");
                       conn = DriverManager.getConnection(DB_URL, USER, PASS);
                       stmt = conn.createStatement();
                       //String sql="";
//                       if(Double.parseDouble(discount)>0.00){
//                           sql="update product_info set price_sell=price_sell-"+discount+",discount="+discount;
//                       }
//                       else 
                           String sql=sql="update product_info set discount="+discount+"where code="+code;
                       //String sql="update product_info";
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
}
