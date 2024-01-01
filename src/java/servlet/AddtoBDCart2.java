/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import Model.Sess;
import POJOS.Advert;
import POJOS.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author User
 */
public class AddtoBDCart2 extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        try {
            if (request.getSession().getAttribute("Login") != null) {

                User user = (User) request.getSession().getAttribute("Login");

                if (request.getSession().getAttribute("cart") != null) {
                    ArrayList<Model.Advert> cart = (ArrayList<Model.Advert>) request.getSession().getAttribute("cart");
                    Session s = Sess.getIntance();
                    if (cart.size() > 0) {

                        for (Model.Advert ad : cart) {
                            Transaction tr = s.beginTransaction();
                            Advert a = new Advert();
                            a.setUser(user);
                            a.setStatus(false);
                            a.setSubCatagory(ad.getSubCatagory());
                            a.setTitle(ad.getTitle());
                            a.setViews(0);
                            a.setPhone(ad.getPhone());
                            a.setPrice(ad.getPrice());
                            a.setAdType(ad.getAdType());
                            a.setEmail(ad.getEmail());
                            a.setContent(ad.getContent());
                            a.setPaid(Boolean.FALSE);
                            a.setDate(ad.getDate());
                            a.setDistrict(ad.getDistrict());
                            a.setMainCatagory(ad.getMainCatagory());
                            a.setImage(ad.getImage());
                            s.save(a);
                            tr.commit();
                            tr = null;
                        }
                        s.flush();

                        request.getSession().removeAttribute("cart");
                        response.sendRedirect("cart.jsp");
                    }
                }
            } else {
                response.sendRedirect("login.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {

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
