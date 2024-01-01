/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import POJOS.User;
import java.io.IOException;
import java.io.PrintWriter;
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
public class Login extends HttpServlet {

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

        Session s = Control.NewHibernateUtil.getSessionFactory().openSession();

        try {
            String un = "";
            String pw = "";
            if (request.getParameter("email") != null && request.getParameter("password") != null) {
                if (request.getSession().getAttribute("Login") == null) {
                    un = request.getParameter("email");
                    pw = request.getParameter("password");

                    Criteria c = s.createCriteria(POJOS.User.class);
                    c.add(Restrictions.and(Restrictions.eq("email", un), Restrictions.eq("password", pw)));
                    POJOS.User login = (POJOS.User) c.uniqueResult();

                    if (login != null) {
                        if (login.getActStatus()) {
                            request.getSession().setAttribute("Login", login);
                            if (login.getUserType().getId() < 3) {
                                response.sendRedirect("Admin/index.jsp");

                            } else if (request.getSession().getAttribute("cart") != null) {

                                response.sendRedirect("AddtoBDCart2");
                            } else {
                                response.sendRedirect("index.jsp");
                            }

                        } else {
                            response.sendRedirect("login.jsp?err=Sorry, Account has been deactivated");
                        }
                    } else {
                        response.sendRedirect("login.jsp?err=Sorry, login details invalid");
                    }
                } else {
                    response.sendRedirect("index.jsp");
                }

            } else {
                response.sendRedirect("login.jsp");
            }

        } catch (Exception e) {

        } finally {
            s.close();
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
