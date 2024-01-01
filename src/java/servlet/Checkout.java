/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import POJOS.Advert;
import POJOS.Invoice;
import POJOS.InvoiceHasAdvert;
import POJOS.InvoiceHasAdvert;
import POJOS.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author User
 */
public class Checkout extends HttpServlet {

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

            if (request.getSession().getAttribute("Login") != null) {
                Session s = Control.NewHibernateUtil.getSessionFactory().openSession();

                User user = (User) request.getSession().getAttribute("Login");
                List<Advert> li = s.createCriteria(POJOS.Advert.class)
                        .add(Restrictions.eq("user", user))
                        .add(Restrictions.eq("paid", false)).list();
                if (!li.isEmpty()) {
                    double tot = 0.0;
                    Invoice im = new Invoice();
                    im.setUser(user);
                    im.setDateTime(new Date());
                    s.save(im);

                    for (Advert advert : li) {
                        InvoiceHasAdvert ind = new InvoiceHasAdvert();
                        ind.setInvoice(im);
                        tot += advert.getAdType().getPrice();
                        ind.setPrice(advert.getAdType().getPrice());
                        ind.setAdtype(advert.getAdType().getType());
                        ind.setAdvert(advert);
                        advert.setPaid(Boolean.TRUE);
                        s.update(advert);
                        s.save(ind);
                    }
                    im.setTotal(tot);

                    s.update(im);
                    Transaction tr = s.beginTransaction();
                tr.commit();
                tr=null;
                    
                    request.getSession().setAttribute("inv", im.getId());
                    response.sendRedirect("invoice.jsp");
                }else{
                response.sendRedirect("checkout_backup");
                }

            }else{
                response.sendRedirect("login.jsp");
            }
            
        } catch (Exception e) {

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
