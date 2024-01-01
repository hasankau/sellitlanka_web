/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;
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
public class newuser extends HttpServlet {

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
        try  {
            if(request.getSession().getAttribute("Login")!=null){
            Session s = Control.NewHibernateUtil.getSessionFactory().openSession();
            //assign parameters
            String email = request.getParameter("email");
            String uname = request.getParameter("uname");
            String pword = request.getParameter("password");
            String pwordcon = request.getParameter("confrim");
            String type = request.getParameter("type");
            

            //check password confirmation
            if (pword == null ? pwordcon == null : pword.equals(pwordcon)) {
                Criteria c = s.createCriteria(POJOS.User.class);
                
                //check if user by email already existsyyij
                
                POJOS.User checkUser = (POJOS.User) c.add(Restrictions.eq("email", email)).uniqueResult();
                if (checkUser==null) {
                
                    //start new transaction
                    Transaction tr = s.beginTransaction();
                    
                //new user
                POJOS.User newuser = new POJOS.User();
                POJOS.UserType ut = (POJOS.UserType) s.load(POJOS.UserType.class, Integer.parseInt(type));
                String sc = Long.toHexString(Double.doubleToLongBits(Math.random())); UUID.randomUUID().toString(); 
                newuser.setSecurityCode(sc);
                newuser.setEmail(email);
                newuser.setPassword(pword);
                newuser.setUserName(uname);
                newuser.setActStatus(Boolean.TRUE);
                newuser.setUserType(ut);
                
                s.save(newuser);
                    tr.commit();
                        
                    //close trasaction and session
                    tr=null;
                    s.close();
                    
                    response.sendRedirect("Admin/new_user.jsp");
                
                }else{
                    out.write("An account with this email already exists");
                }

            }
            }else{
                response.sendRedirect("login.jsp");
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
