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

                <div class="container" style="margin-top: 10px">
                    <div class="row">
                        <div class="col-xs-12 col-sm-6 col-md-6">
                            <div class="well well-sm">
                                <div class="row">
                                    <div class="col-sm-6 col-md-4">
                                        <img src="img/Profile_avatar_placeholder_large.png" alt="" class="img-rounded img-responsive" />
                                    </div>
                                    <div class="col-sm-6 col-md-8">
                                        <h4>
                                            <%=user.getUserName()%></h4>
                                        <p>
                                            <i class="glyphicon glyphicon-envelope"></i><%=user.getEmail()%>
                                            <br />

                                            <i class="glyphicon glyphicon-gift"></i><%=user.getTel()%></p>
                                        <!-- Split button -->
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-primary">
                                                More</button>
                                            <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                                                <span class="caret"></span><span class="sr-only">More</span>
                                            </button>
                                            <ul class="dropdown-menu" role="menu">
                                                <li><a href="invoices.jsp">Invoices</a></li>
                                                <li><a onclick="$('#myModal').modal('show')">Change Password</a></li>
                                                <li><a onclick="$('#myModal2').modal('show')">Change Contact</a></li>
                                            </ul>
                                        </div>
                                        <div onclick="location.href = 'my_ads.jsp?uid=<%=user.getId()%>'" class="btn btn-primary">
                                            My Ads
                                        </div>
<div class="text-danger" style="float: bottom; width: 400px">
                        <%
                        if(request.getParameter("msg")!=null){
                            out.write(request.getParameter("msg"));
                        }
                        s.close();
                        %>
                    </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Modal -->
                <div id="myModal" class="modal fade" role="dialog">
                    <div class="modal-dialog" style="margin-top: 100px">
                        <form action="ChangePassword" method="POST">

                            <!-- Modal content-->
                            <div class="modal-content" >
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

                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-warning">Update</button>

                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </form>
                    </div>

                </div>


                
                
                
                
                
                <!-- Modal -->
                <div id="myModal2" class="modal fade" role="dialog">
                    <div class="modal-dialog" style="margin-top: 100px">


                        <!-- Modal content-->
                        <div class="modal-content">
                            <form action="UpdateContact2" method="POST">
                                <div class="modal-header orange-gradient">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Change Contact</h4>
                                </div>
                                <div class="modal-body">
                                    <div >
                                        Contact :
                                        <input type="tel" class="form-control" value="<%=user.getTel()%>" name="con"/>


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


    </div>
    <div class="footer">
        <%@include file="includes/footer.jsp" %>

    </div>

<!--    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button>-->




</body>
</html>
