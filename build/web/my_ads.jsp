<%-- 
    Document   : index
    Created on : Mar 21, 2016, 9:51:12 AM
    Author     : User
--%>

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

    User user = null;
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
        <script src="plugin/jquery-2.1.4.min.js"type="text/javascript"></script> <!-- but with the right path! -->
        <link type="text/css" rel="stylesheet" href="bootstrap/bootstrap.css" />
        <script type="text/javascript" src="bootstrap/bootstrap.min.js"></script>
        <script type="text/javascript" src="plugin/jquery-ui/jquery-ui.js"></script>
        <script src="plugin/slider/jquery-2.1.4.min.js" type="text/javascript"></script>

        <script src="Js/responsiveslides.min.js" type="text/javascript"></script>


    </head>
    <style>
        .glyphicon {  margin-bottom: 10px;margin-right: 10px;}

        small {
            display: block;
            line-height: 1.428571429;
            color: #999;
        }
    </style>
    <body>
        <nav class="header">
            <%@include file="includes/menu.jsp" %>
        </nav>
        <div class="body" style="height: 1200px">

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
                <section class="left">
                    <%@include file="includes/left-panel.jsp" %>
                    
                    
                </section>
                <section class="right">
                    <div class="content">


                        <%@include file="includes/moreads.jsp" %>

                        
                        
                    </div>
                </section>

                <!-- Modal -->
                <div id="myModal" class="modal fade" role="dialog">
                    <div class="modal-dialog">
                        <form action="ChangePassword" method="POST">

                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header orange-gradient">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Modal Header</h4>
                                </div>
                                <div class="modal-body">
                                    <div >

                                        Current Password :
                                        <input type="password" class="form-control" name="pw"/>

                                        New Password :
                                        <input type="password" class="form-control" name="npw"/>


                                    </div>


                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-warning">Update</button>

                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>

        </div>


    </div>
    <div class="footer">
        <%@include file="includes/footer.jsp" %>
    </div>

    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button>




</body>
</html>
