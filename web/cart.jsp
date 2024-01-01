<%-- 
    Document   : cart
    Created on : Dec 7, 2016, 8:35:09 AM
    Author     : User
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="POJOS.User"%>
<%@page import="org.hibernate.Session"%>
<%@page import="POJOS.CartItems"%>
<%@page import="POJOS.Cart"%>
<%@page import="POJOS.Advert"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%    Session s = Control.NewHibernateUtil.getSessionFactory().openSession();

    POJOS.User user = null;
    if (request.getSession().getAttribute("Login") != null) {
        user = (User) request.getSession().getAttribute("Login");
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SELitLANKA</title>
        <link rel="stylesheet" href="style.css" type="text/css"/>
        <link rel="stylesheet" href="css/post-style.css" type="text/css"/>
        <link type="text/css" rel="stylesheet" href="bootstrap/bootstrap.css" />
        <script type="text/javascript" src="bootstrap/bootstrap.min.js"></script>
        <script src="js/jquery-2.1.4.min.js"type="text/javascript"></script>

        <script>
            function confirmDelete() {
                var result = confirm("Are you sure you want to delete?");
                if (result) {
                    return true;
                }
                return false;
            }
        </script>

    </head>
    <body>
        <nav class="header">
            <%@include file="includes/menu.jsp" %>
        </nav>
        <div class="body" style="height: 1200px">
            <%                if (request.getParameter("key") == null) {
            %>

            <%}%>
            <section class="middle">

            </section>
            <div class="center" style="height: 1000px">
                <header class="section-header rounded-edges orange-gradient">
                    <div class="col col1">
                        Catagories
                    </div>
                    <div class="col col2">
                        <span class="glyphicon glyphicon-shopping-cart"></span> Your Shopping Cart
                    </div>
                    <div class="col-right">
                        <a class="btn btn-medium btn-danger" href="ad_description.jsp">Post your Ad</a>
                    </div>
                </header>

                <section class="left">
                    <%@include file="includes/left-panel.jsp" %>
                </section>
                <section class="right">
                    <div class="container-fluid">


                        <%  double tot = 0;
                            if (request.getSession().getAttribute("Login") == null) {
                                ArrayList<Model.Advert> cart = null;
                                if (request.getSession().getAttribute("cart") != null) {
                                    cart = (ArrayList) request.getSession().getAttribute("cart");
                                
                                if (cart.size() > 0) {
                        %>

                        <!--                        <div class="panel-title">
                                                    In your Cart
                                                </div>-->

                        <table class="table table-responsive table-hover table-hover">
                            <tr>
                                <th>Image</th><th>Title</th><th>Price</th><th>Remove</th>
                            </tr>
                            <%
                                for (Model.Advert ad : cart) {

                                    String path = "";

                                    path = ad.getImage();
                                    double subtot = ad.getAdType().getPrice();
                                    tot = tot + subtot;
                            %>
                            <tr>
                                <td><img style="width: 100px; height: 100px" src="images/<%=path%>"></td>
                                <td><%=ad.getTitle()%></td>

                                <td><%="LKR "+subtot%></td>
                                <td>
                                    <form action="RemoveFromCart" method="POST">
                                        <input hidden name="id" value="<%=cart.indexOf(ad)%>">
                                        <button onclick="return confirm('Are you sure you want to delete this item?')" class="btn btn-sm btn-danger" type="submit"><span class="glyphicon glyphicon-remove"></span></button>
                                    </form>
                                </td>
                            </tr>

                            <%}%>
                            <tr>
                                <td >Total</td></td><td><td><%="LKR "+tot%></td><td></td>
                            </tr>
                        </table>
                            <form action="proceed_to_checkout" method="POST">
                                <input hidden="" name="tot" value="<%="LKR "+tot%>"/>
                                <button class="btn btn-success"  type="submit">Checkout</button>
                                
                            </form>

                        <%} else {%>

                        <div class="post">
                            <div>No Items in Your Cart Yet!</div>
                        </div>

                        <%

                            }}
                        } else {
                            Criteria ch = s.createCriteria(Advert.class);
                            ch.add(Restrictions.eq("user", user));
                            ch.add(Restrictions.eq("paid", false));
                            List<Advert> cil = ch.list();
                            if (cil.size() > 0) {

                        %>
                        <table class="table table-responsive table-striped table-hover">
                            <tr>
                                <th>Image</th><th>Title</th><th>Price</th><th>Remove</th>
                            </tr>

                            <%      
                                for (Advert ci : cil) {
                                    String path = ci.getImage();
                                    double subtot = ci.getAdType().getPrice();
                                    tot = tot + subtot;

                            %>


                            <tr>
                                <td><img style="width: 100px; height: 100px" src="images/<%=path%>"></td>
                                <td><%=ci.getTitle()%></td>
                                
                                <td><%="LKR "+subtot%></td>
                                <td>
                                    <form action="RemoveFromDbCart" method="POST">
                                        <input hidden name="id" value="<%=ci.getId()%>">
                                        <button class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this item?')" type="submit"><span class="glyphicon glyphicon-remove"></span></button>
                                    </form>
                                </td>
                            </tr>
                            <%}%>
                            <tr>
                                <td  >Total</td><td></td><td><%="LKR "+tot%></td><td></td>
                            </tr>
                        </table>

                            <form action="proceed_to_checkout" method="POST">
                                <input hidden="" name="tot" value="<%="LKR "+tot%>"/>
                                <button class="btn btn-success"  type="submit">Checkout</button>
                                
                            </form>
                        <%}else {
                        %>

                        <div class="post">
                            <div>No Items in Your Cart Yet!</div>
                        </div>


                        <%}
                            }
                        s.close();
                        %>

                    </div>
                </section>
            </div>


        </div>
        <div class="footer">
            <%@include file="includes/footer.jsp" %>
        </div>
    </body>
</html>
