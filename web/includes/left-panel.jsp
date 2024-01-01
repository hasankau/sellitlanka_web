<%-- 
    Document   : left-panel
    Created on : Mar 27, 2016, 9:20:35 PM
    Author     : User
--%>

<%@page import="java.util.Set"%>
<%@page import="POJOS.SubCatagory"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.criterion.Order"%>
<%@page import="org.hibernate.Session"%>
<%@page import="java.util.List"%>
<%@page import="POJOS.MainCatagory"%>
<%@page import="org.hibernate.Criteria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="left-wrapper" style="padding: 2px">
    <section class="col1" style=" overflow: hidden">
        <ul >
            <%

                Session ses = Control.NewHibernateUtil.getSessionFactory().openSession();
                Criteria c = ses.createCriteria(POJOS.MainCatagory.class).add(Restrictions.eq("status", true));

                %>

                <li><a href='index.jsp'>All Categories</a></li>



            <%

                if (request.getParameter("cat") != null && request.getParameter("cat")!="" && !request.getParameter("cat").trim().isEmpty()) {

                    MainCatagory mc = (MainCatagory) s.load(POJOS.MainCatagory.class, Integer.parseInt(request.getParameter("cat")));
                        out.write("<ul><li class='sel'><a href='index.jsp?cat=" + mc.getId() + "'><strong>" + mc.getCatagory() + "</strong></a></li></ul>");
                        Set<POJOS.SubCatagory> li = mc.getSubCatagories();
                        for (POJOS.SubCatagory sc : li) {
                                if(sc.getStatus()){
                                    
                                out.write("<li><a style='color: #66cc00; padding-left: 10px' href='index.jsp?scat=" + sc.getId() + "'>" + sc.getCatagory() + "</a></li>");
                            
                                }
                        }
                    
                       

                    } else {
                    
                    
                    
                     c.addOrder(Order.asc("catagory"));
                        List<POJOS.MainCatagory> li = c.list();

                        for (POJOS.MainCatagory mc : li) {
                            out.write("<li><a href='index.jsp?cat=" + mc.getId() + "'>" + mc.getCatagory() + "</a></li>");
                            
                        }
                    
                    
                    
                    }
                %>
        </ul>



    </section>

</div>
