/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package servelet;

import java.io.File;  
 import java.io.IOException;  
 import java.io.PrintWriter;  
 import java.util.Iterator;  
 import java.util.List;  
 import javax.servlet.ServletException;  
 import javax.servlet.http.HttpServlet;  
 import javax.servlet.http.HttpServletRequest;  
 import javax.servlet.http.HttpServletResponse;  
import jspcode.Global;
 import org.apache.commons.fileupload.FileItem;  
 import org.apache.commons.fileupload.FileItemFactory;  
import static org.apache.commons.fileupload.FileUploadBase.CONTENT_TYPE;
 import org.apache.commons.fileupload.FileUploadException;  
 import org.apache.commons.fileupload.disk.DiskFileItemFactory;  
 import org.apache.commons.fileupload.servlet.ServletFileUpload;  
 public class FileUploadExample extends HttpServlet {  
      @Override  
     protected void doPost(HttpServletRequest request, HttpServletResponse response)  
             
          throws ServletException, IOException {  
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);  
         response.setContentType("text/html"); 
          PrintWriter out = response.getWriter();  
          //String sample = request.getParameter("product_name");
        if (isMultipart) {  
           // Create a factory for disk-based file items  
           FileItemFactory factory = new DiskFileItemFactory();  
           // Create a new file upload handler  
           ServletFileUpload upload = new ServletFileUpload(factory);  
          try {  
             // Parse the request  
             List /* FileItem */ items = upload.parseRequest(request);  
            Iterator iterator = items.iterator();  
            while (iterator.hasNext()) {  
              FileItem item = (FileItem) iterator.next();  
              if (!item.isFormField())  
               {  
                   //item.setFieldName("icchamoto");
                   String fileName = item.getName(); 
                
               // String root = getServletContext().getRealPath("/");  
                String root="F:/CSE-300/Final Project/Shopnohut/web";
               // out.print(root);
               // out.println("The sample value is " + sample);

                File path = new File(root+"/images");  
                if (!path.exists())  
                 {  
                  boolean status = path.mkdirs();  
                }  
                File uploadedFile = new File(path + "/" + fileName);  
                out.println(uploadedFile.getAbsolutePath());  
                 if(fileName!="")  
                item.write(uploadedFile);  
                 else  
                   out.println("file not found");  
                 out.println("<h1>File Uploaded Successfully....:-)</h1>"); 
                 //request.setAttribute("image_name",fileName );
                   Global.image=fileName;
                 response.sendRedirect("add_image_url_to_DB.jsp");
              }  
               else  
               {  
                 String abc = item.getString();  
 //        out.println("<br><br><h1>"+abc+"</h1><br><br>");  
               }  
            }  
          } catch (FileUploadException e) {  
                out.println(e);  
          } catch (Exception e) {  
                out.println(e);  
          }  
        }  
         else  
         {  
           out.println("Not Multipart");  
         }  
      }  
 }  