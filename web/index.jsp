<%-- 
    Document   : index
    Created on : Mar 21, 2016, 9:51:12 AM
    Author     : User
--%>

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
        <div class="body" style="min-height: 1300px; margin-bottom: 20px">
            <%
                if (user == null) {
            %>
            <div class="banner-wrapper">
                <div class="banner">

                    <div class="slider" style="height: 200px; -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 2px rgba(102, 102, 102, .6);
                         box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 2px rgba(102, 102, 102, .6);">
                        <div class="callbacks_container">
                            <ul class="rslides" id="slider">
                                <li >
                                    <img height="220px" src="images/1.jpg" alt="">
                                </li>
                                <li>
                                    <img height="220px" src="images/4.jpg" alt="">   
                                </li>
                                <li>
                                    <img  height="220px" src="images/1.jpg" alt="">
                                </li>	
                            </ul>
                        </div>
                    </div>

                </div>
                <script>
                    $(function () {
                        $("#slider").responsiveSlides({
                            auto: true,
                            speed: 500,
                            namespace: "callbacks",
                            pager: true
                        });
                    });

                </script>

                <div class="details">
                    <p class="white-text">
                    <h4>Welcome To The Largest Classifieds Site On The Web</h4>
                    <span style="font-size: 16px">Sell any product or service for free</span>
                    </p>
                    <div class="input-group">
                        <div class="btn btn-d btn-invert btn-lg"onclick="location.href = 'signup.jsp'">SIGN UP</div>
                        <div class="btn btn-d btn-invert btn-lg"onclick="location.href = 'login.jsp'">LOGIN</div>
                    </div>
                </div>

            </div> 
            <%}else{%>
            <br>
            <br>
            <br>
            <%}%>
            
            <section class="middle" >
                <!--<img style="width: 100%; height: 95%" src="images/14946967718732363007.gif"/>-->
            </section>
            <div class="center" style="min-height: 1240px">
                <header class="section-header rounded-edges orange-gradient">
                    <div class="col col1">
                        Catagories
                    </div>
                    <div class="col col2">
                        Posts
                    </div>
                    
                    <div class="col-right">
                        <a class="btn btn-medium btn-danger" href="ad_description.jsp">Post your Ad
                            <span class="glyphicon glyphicon-pencil"></span></a>
                    </div>
                </header>

                <section class="left">
                    <%@include file="includes/left-panel.jsp" %>


                </section>
                <section class="right">
                    <div class="content">


                        <%@include file="includes/products.jsp" %>



                    </div>
                </section>

            </div>


        </div>
        <div class="footer">
            <%@include file="includes/footer.jsp" %>
        </div>
    </body>
</html>
