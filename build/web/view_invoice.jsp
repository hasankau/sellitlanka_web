<%-- 
    Document   : index
    Created on : Mar 21, 2016, 9:51:12 AM
    Author     : User
--%>

<%@page import="POJOS.InvoiceHasAdvert"%>
<%@page import="java.util.Set"%>
<%@page import="POJOS.Invoice"%>
<%@page import="POJOS.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="java.util.List"%>
<%@page import="POJOS.Advert"%>
<!DOCTYPE html>
<%
    Session s = Control.NewHibernateUtil.getSessionFactory().openSession();

    POJOS.User user = null;
    if (request.getSession().getAttribute("Login") != null) {
        user = (POJOS.User) request.getSession().getAttribute("Login");
    }
    
    

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SELitLANKA</title>
        <link rel="stylesheet" href="style.css" type="text/css"/>
        <link rel="stylesheet" href="css/post-style.css" type="text/css"/>
        <link type="text/css" rel="stylesheet" href="plugin/jquery-ui/jquery-ui.css" />
        <link type="text/css" rel="stylesheet" href="bootstrap/bootstrap.css" />
        <script type="text/javascript" src="bootstrap/bootstrap.min.js"></script>
        <script type="text/javascript" src="plugin/jquery-ui/jquery-ui.js"></script>
        <script src="plugin/slider/jquery-2.1.4.min.js" type="text/javascript"></script>
        <script src="plugin/jquery-2.1.4.min.js"type="text/javascript"></script> <!-- but with the right path! -->
        
        <script src="Js/responsiveslides.min.js" type="text/javascript"></script>
        

    </head>
    <body>
        <nav class="header">
            <%@include file="includes/menu.jsp" %>
        </nav>
        <div class="body" style="height: 1000px">
            
            <section class="middle">

            </section>
            <div class="center" style="height: 1000px">
                <header class="section-header rounded-edges orange-gradient">
                    <div class="col col1">
                        Catagories
                    </div>
                    <div class="col col2">
                        Posts
                    </div>
                    <div class="col-right">
                        <a class="btn btn-medium btn-danger" href="ad_description.jsp">Post your Ad</a>
                    </div>
                </header>

                <%

                            Invoice in = (Invoice)s.load(POJOS.Invoice.class, Integer.parseInt(request.getParameter("id")));
                                User ut = in.getUser();
                                

                            %>
                            
                            <h2><%=ut.getEmail()+", "+ut.getUserName() %></h2>
                        <table class="table table-responsive table-striped">
                            <tr>
                                <th>Id</th><th>Title</th><th>Price</th>
                            </tr>
                            <%
                                
                                Set<InvoiceHasAdvert> li = in.getInvoiceHasAdverts();

                                for (InvoiceHasAdvert inv : li) {

                            %>

                            <tr>
                                <td><%=inv.getId() %></td>
                                <td><%=inv.getAdvert().getTitle()+" ("+inv.getAdtype()+")" %></td>
                                <td><%=inv.getPrice()%></td>
                                
                            </tr>

                            <%}%>
                        </table>
                
            </div>


        </div>
        <div class="footer">
            <%@include file="includes/footer.jsp" %>
        </div>
    </body>
</html>
