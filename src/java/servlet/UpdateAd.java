/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import Model.Sess;
import POJOS.AdType;
import POJOS.Advert;
import POJOS.District;
import POJOS.MainCatagory;
import POJOS.SubCatagory;
import POJOS.User;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.hibernate.Session;
import org.hibernate.Transaction;
import static servlet.SaveAd.isNumeric;

/**
 *
 * @author User
 */
public class UpdateAd extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            
            Session s = Control.NewHibernateUtil.getSessionFactory().openSession();

            User user = null;
            String title = "";
            String cont = "";
            String dis = "";
            String mc = "";
            String sc = "";
            String phone = "";
            String email = "";
            String price = "";


            FileItemFactory fileitemfac = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(fileitemfac);


            List itList = upload.parseRequest(request);
            for (Object object : itList) {
                FileItem fileItem = (FileItem) object;
                if (fileItem.isFormField()) {
                    if (fileItem.getFieldName().equals("title")) {
                        title = fileItem.getString();
                    }
                    if (fileItem.getFieldName().equals("des")) {
                        cont = fileItem.getString();
                    }
                    if (fileItem.getFieldName().equals("mc")) {
                        mc = fileItem.getString();
                    }
                    if (fileItem.getFieldName().equals("sc")) {
                        sc = fileItem.getString();
                    }
                    if (fileItem.getFieldName().equals("phone")) {
                        phone = fileItem.getString();
                        
                    }
                    if (fileItem.getFieldName().equals("email")) {
                        email = fileItem.getString();

                    }
                    if (fileItem.getFieldName().equals("price")) {
                        price = fileItem.getString();
                        

                    }
                    if (fileItem.getFieldName().equals("dis")) {
                        dis = fileItem.getString();
                    }
                    

                } 
            }

            if (request.getSession().getAttribute("Login") != null) {
                if (request.getSession().getAttribute("aid")!=null) {
                  
                user = (User) request.getSession().getAttribute("Login");

                Transaction tr = s.beginTransaction();

                Advert ad = (Advert) s.load(POJOS.Advert.class, Integer.parseInt(request.getSession().getAttribute("aid").toString()));

                ad.setUser(user);
                ad.setStatus(false);
                ad.setSubCatagory((SubCatagory) s.load(POJOS.SubCatagory.class, Integer.parseInt(sc)));
                ad.setTitle(title);
                ad.setViews(0);
                ad.setPhone(Integer.parseInt(phone));
                ad.setPrice(Double.parseDouble(price));
                ad.setContent(cont);
                ad.setEmail(email);
                ad.setDate(new Date());
                ad.setDistrict((District) s.load(POJOS.District.class, Integer.parseInt(dis)));
                ad.setMainCatagory((MainCatagory) s.load(POJOS.MainCatagory.class, Integer.parseInt(mc)));

                s.update(ad);
                tr.commit();

                tr = null;
                response.sendRedirect("edit_ad.jsp?id="+request.getSession().getAttribute("aid").toString());

            } else{
                    System.out.println("lllllllllllllll");
                }
            }else{
                response.sendRedirect("login.jsp");
            }
    
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
