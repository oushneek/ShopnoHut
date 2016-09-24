/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package search;
import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author Tazbeea Tazakka
 */
public class search {
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
    static final String DB_URL = "jdbc:mysql://localhost/shopnohut";
    
    static final String USER = "root";
    static final String PASS = "1234";
    
    static ArrayList<String> search_result=new ArrayList<String>();
    static ArrayList<String> search_user=new ArrayList<String>();
    
    public static ArrayList<String> search(String str){
     Connection conn = null;
                  Statement stmt = null;
                  String a = null;
                  
                  try{
                       Class.forName("com.mysql.jdbc.Driver");
                       conn = DriverManager.getConnection(DB_URL, USER, PASS);
                       stmt = conn.createStatement();
                       String sql="select * from product_info natural join subcategory where name LIKE '%"+str+"%' or description like '%"+str+"%'";
                       ResultSet rs= stmt.executeQuery(sql);
                       search_result.clear();
                       while(rs.next()){
                           search_result.add(Integer.toString(rs.getInt("code")));
                           search_result.add(Integer.toString(rs.getInt("category_id")));
                            search_result.add(rs.getString("name"));
                            search_result.add(rs.getString("image_url"));
                            search_result.add(Double.toString(rs.getDouble("price_sell")));
                            search_result.add(Integer.toString(rs.getInt("total_quantity")));
                            search_result.add(rs.getString("description"));
                            search_result.add(Double.toString(rs.getDouble("discount")));
                                          }
                       rs.close();
                       return search_result;
                  }
                  catch (SQLException ex) {
                      // Logger.getLogger(EntryForm.class.getName()).log(Level.SEVERE, null, ex);
                      //return "Failed";
                  } 
                  catch (ClassNotFoundException ex) {
                     //  Logger.getLogger(EntryForm.class.getName()).log(Level.SEVERE, null, ex);
                      //return "Failed";
                  }
                  return search_result;
    }
    
    public static ArrayList<String> searchUser(String str){
     Connection conn = null;
                  Statement stmt = null;
                  String a = null;
                  
                  try{
                       Class.forName("com.mysql.jdbc.Driver");
                       conn = DriverManager.getConnection(DB_URL, USER, PASS);
                       stmt = conn.createStatement();
                       String sql="select * from user where id_user_type=0 and (name LIKE '%"+str+"%' or email like '%"+str+"%' or alternate_email like '%"+str+"%' or mobile like '%"+str+"%' or address like '%"+str+"%') ";
                       ResultSet rs= stmt.executeQuery(sql);
                       search_user.clear();
                       while(rs.next()){
                          
                            search_user.add(Integer.toString(rs.getInt("user_id")));
                            search_user.add(rs.getString("name"));
                            search_user.add(rs.getString("first_name"));
                            search_user.add(rs.getString("last_name"));
                            search_user.add(rs.getString("company_name"));
                            search_user.add(rs.getString("company_service"));
                            search_user.add(rs.getString("company_web"));
                            search_user.add(rs.getString("designation"));
                            search_user.add(rs.getString("email"));
                            search_user.add(rs.getString("alternate_email"));
                            search_user.add(rs.getString("mobile"));
                            search_user.add(rs.getString("office_phone"));
                            search_user.add(rs.getString("address"));
                            search_user.add(Integer.toString(rs.getInt("country_code")));
                            search_user.add(rs.getString("password"));
                            search_user.add(rs.getString("create_date"));
                            search_user.add(rs.getString("update_date"));

        }
                       rs.close();
                       return search_user;
                  }
                  catch (SQLException ex) {
                      // Logger.getLogger(EntryForm.class.getName()).log(Level.SEVERE, null, ex);
                      //return "Failed";
                  } 
                  catch (ClassNotFoundException ex) {
                     //  Logger.getLogger(EntryForm.class.getName()).log(Level.SEVERE, null, ex);
                      //return "Failed";
                  }
                  return search_user;
    }
    
}
