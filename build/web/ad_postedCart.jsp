<%-- 
    Document   : index
    Created on : Mar 21, 2016, 9:51:12 AM
    Author     : User
--%>

<%@page import="POJOS.SubCatagory"%>
<%@page import="POJOS.MainCatagory"%>
<%@page import="POJOS.District"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="java.util.List"%>
<%@page import="POJOS.Advert"%>
<!DOCTYPE html>
<%    POJOS.User user = null;

Session s = Control.NewHibernateUtil.getSessionFactory().openSession();
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
        <div class="body" style="margin-top: 50px">

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
                    </div>
                </header>


                <div class="content">

                    <div class="bg-success col-lg-12">
                        <h1 class="glyphicon glyphicon-thumbs-up"></h1>
                        <h1>Successful!</h1>
                        <h3>Your ad is added to your cart!</h3>
                        <h1><a href="cart.jsp">Checkout</a></h1>
                        <button class="btn  btn-lg btn-danger" onclick="location.href='ad_description.jsp'">Post More Ads</button>
                    </div>

                </div>


            </div>


        </div>
        <div class="footer">
            <%@include file="includes/footer.jsp" %>
        </div>
    </body>
</html>
