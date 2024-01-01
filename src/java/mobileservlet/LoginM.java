/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mobileservlet;

import java.io.IOException;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author User
 */
public class LoginM extends HttpServlet {

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
        try  {
            
            String un = "";
            String pw = "";
            
            OutputStream out = new ObjectOutputStream(response.getOutputStream());
                    HashMap hm = new HashMap();
            
            if (request.getParameter("email") != null && request.getParameter("password") != null) {
                if (request.getSession().getAttribute("Login") == null) {
                    un = request.getParameter("email");
                    pw = request.getParameter("password");

                    Session s = Control.NewHibernateUtil.getSessionFactory().openSession();
                    Criteria c = s.createCriteria(POJOS.User.class);
                    c.add(Restrictions.and(Restrictions.eq("email", un), Restrictions.eq("password", pw)));
                    POJOS.User login = (POJOS.User) c.uniqueResult();
                    
                    

                    if (login != null) {
                        if (login.getActStatus()) {
                            request.getSession().setAttribute("Login", login);
                            
                            hm.put("msg", "ok");
                            
                        } else {
                            hm.put("msg", "Sorry, Account has been deactivated");
                        }
                    } else {
                        hm.put("msg", "Sorry, login details invalid");
                    }
                } else {
                hm.put("msg","You need to logout first");
            }

            } else {
                hm.put("msg","Please fill in the fields");
            }

            
        }catch(Exception e){
            
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
