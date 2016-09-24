/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package wishlist;

import java.sql.*;
import jspcode.Global;

/**
 *
 * @author Tazbeea Tazakka
 */
public class delete {
    
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
    static final String DB_URL = "jdbc:mysql://localhost/shopnohut";
    
    static final String USER = "root";
    static final String PASS = "1234";
    
    public static String delete_from_wishlist(String code,String user_id){
     Connection conn = null;
                  Statement stmt = null;
             
                  
                  try{
                       Class.forName("com.mysql.jdbc.Driver");
                       conn = DriverManager.getConnection(DB_URL, USER, PASS);
                       stmt = conn.createStatement();
                       String sql="";
                        
                       sql="delete from wishlist where user_id="+user_id+" and code="+code;
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
