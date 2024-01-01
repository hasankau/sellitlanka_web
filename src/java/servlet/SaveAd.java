package servlet;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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

/**
 *
 * @author User
 */
public class SaveAd extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        try {
            Session s = Sess.getIntance();

            User user = null;
            String title = "";
            String cont = "";
            String dis = "";
            String mc = "";
            String sc = "";
            String phone = "";
            String email = "";
            String price = "";
            String adtype = "";

            String path = "";

            FileItemFactory fileitemfac = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(fileitemfac);

            String thumb = "";

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
                        if (!isNumeric(phone)) {
                            response.sendRedirect("NaNex.jsp");
                        } else if (phone.length() > 10) {
                            response.sendRedirect("NaNex.jsp");
                        }
                    }
                    if (fileItem.getFieldName().equals("email")) {
                        email = fileItem.getString();

                    }
                    if (fileItem.getFieldName().equals("price")) {
                        price = fileItem.getString();
                        if (!isNumeric(price)) {
                            response.sendRedirect("NaNex.jsp");
                        } else if (Integer.parseInt(price) < 0) {
                            response.sendRedirect("NaNex.jsp");
                        } else if (Integer.parseInt(price) >= Integer.MAX_VALUE) {
                            response.sendRedirect("NaNex.jsp");
                        }

                    }
                    if (fileItem.getFieldName().equals("dis")) {
                        dis = fileItem.getString();
                    }
                    if (fileItem.getFieldName().equals("ad")) {
                        adtype = fileItem.getString();

                    }

                } else if (fileItem.getFieldName().equals("im")) {
                    if (fileItem.getName() != null) {
                        thumb = fileItem.getName();
                        File f = new File(getServletContext().getRealPath("/") + "/images/" + thumb);
                        path = f.getName();
                        fileItem.write(f);
                    }

                }
            }

            if (request.getSession().getAttribute("Login") != null) {
                user = (User) request.getSession().getAttribute("Login");

                Transaction tr = s.beginTransaction();

                Advert ad = new Advert();

                ad.setUser(user);
                ad.setStatus(false);
                ad.setSubCatagory((SubCatagory) s.load(POJOS.SubCatagory.class, Integer.parseInt(sc)));
                ad.setTitle(title);
                ad.setViews(0);
                ad.setPhone(Integer.parseInt(phone));
                ad.setPrice(Double.parseDouble(price));
                ad.setAdType((AdType) s.load(POJOS.AdType.class, 2));
                ad.setContent(cont);
                ad.setEmail(email);
                ad.setPaid(Boolean.FALSE);
                ad.setDate(new Date());
                ad.setDistrict((District) s.load(POJOS.District.class, Integer.parseInt(dis)));
                ad.setMainCatagory((MainCatagory) s.load(POJOS.MainCatagory.class, Integer.parseInt(mc)));
                ad.setImage(path);

                s.save(ad);
                tr.commit();

                tr = null;
                response.sendRedirect("ad_postedCart.jsp");

            } else {

                Model.Advert ad = new Model.Advert();

                ad.setUser(null);
                ad.setStatus(false);
                ad.setSubCatagory((SubCatagory) s.load(POJOS.SubCatagory.class, Integer.parseInt(sc)));
                ad.setTitle(title);
                ad.setViews(0);
                ad.setPhone(Integer.parseInt(phone));
                ad.setPrice(Double.parseDouble(price));
                ad.setAdType((AdType) s.load(POJOS.AdType.class, 2));
                ad.setPaid(Boolean.FALSE);
                ad.setContent(cont);
                ad.setEmail(email);
                ad.setDate(new Date());
                ad.setDistrict((District) s.load(POJOS.District.class, Integer.parseInt(dis)));
                ad.setMainCatagory((MainCatagory) s.load(POJOS.MainCatagory.class, Integer.parseInt(mc)));
                ad.setImage(path);
                ArrayList<Model.Advert> cart = null;
                if (request.getSession().getAttribute("cart") != null) {
                    cart = (ArrayList<Model.Advert>) request.getSession().getAttribute("cart");
                    cart.add(ad);
                } else {
                    cart = new ArrayList<>();
                    cart.add(ad);
                }
                request.getSession().setAttribute("cart", cart);
                response.sendRedirect("ad_postedCart.jsp");
            }
            System.out.println("vfb kiji inji");

        } catch (Exception e) {
            if (e instanceof NumberFormatException) {
                response.sendRedirect("NaNex.jsp");
            }

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

    public static boolean isNumeric(String str) {
        for (char c : str.toCharArray()) {
            if (!Character.isDigit(c)) {
                return false;
            }
        }
        return true;
    }

}
