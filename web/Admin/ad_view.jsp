<%@page import="POJOS.Advert"%>
<%@page import="POJOS.AdType"%>
<%@page import="POJOS.UserType"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Session"%>
<%@page import="POJOS.User"%>
<%@page import="org.hibernate.Criteria"%>
<!DOCTYPE html>
<html lang="en">
    <%
        Session s = Control.NewHibernateUtil.getSessionFactory().openSession();

        User u = new User();
        if (request.getSession().getAttribute("Login") != null) {
            u = (User) request.getSession().getAttribute("Login");
            if (u.getUserType().getId() > 2) {
                response.sendRedirect("../index.jsp");
            }
        } else {
            response.sendRedirect("../index.jsp");
        }
    %>
    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Admin Panel</title>

        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/sb-admin.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    </head>

    <body>

        <div id="wrapper">

            <!-- Navigation -->
            <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.jsp">Admin</a>
                </div>
                <!-- Top Menu Items -->
                
                
                <%@include file="includes/nav.jsp" %>
                
                
                <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
                <div class="collapse navbar-collapse navbar-ex1-collapse">
                    <ul class="nav navbar-nav side-nav">
                        <li class="active">
                            <a href="index.jsp"><i class="fa fa-fw fa-users"></i> Users</a>
                        </li>
                        <li>
                            <a href="ads.jsp"><i class="fa fa-fw fa-unlink"></i> Ads</a>
                        </li>                   <li>
                            <a href="invoices.jsp"><i class="fa fa-fw fa-table"></i> Invoices</a>
                        </li>
                        <li>
                            <a href="SaveMainCategory.jsp"><i class="fa fa-fw fa-edit"></i> Categories</a>
                        </li>
<!--                        <li >
                            <a href="EditAdtypes.jsp"><i class="fa fa-fw fa-edit"></i> Ad Prices</a>
                        </li>-->
                        
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </nav>

            <div id="page-wrapper">

                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">
                                Users
                            </h1>
                            <ol class="breadcrumb">
                                <li>
                                    <i class="fa fa-dashboard"></i>  <a href="index.jsp">Admin</a>
                                    
                                </li>
                                <li class="active">
                                    <i class="fa fa-file"></i> Users
                                </li>
                                <div class="form-group" style="width: 600px">
                                    
                                </div>
                                        <div class="form-horizontal form-group">
                                
                                    <%                                
                                        User us = null;
                                if (request.getParameter("id") != null) {
                                    Advert a = (Advert) s.load(Advert.class, Integer.parseInt(request.getParameter("id")));
                                    us = a.getUser();

                                    
                                    String path = a.getImage();


                            %>

                            <div class="col-sm-9 col-lg-9 col-md-9" >
                                <div class="thumbnail" >
                                    <img  src="../images/<%=path%>" alt=""/>
                                    <div class="caption">
                                        <h4 class="pull-right">Rs.<%=a.getPrice()%></h4>
                                        <h4><%=a.getTitle()%></a>
                                        </h4>
                                        <p style="line-break: auto; width: 340px; "><%=a.getContent()%></p>
                                    </div>
                                    <div class="ratings">
                                        <p class="pull-right"><%=a.getViews()%> views</p>
                                        <p class="color-gradient"></p>
                                        <h4>Call : <%=a.getPhone()%></h4>
                                        

                                    </div>
                                </div>
                                   <%if (a.getStatus()) {%>
                                    <form action="../AdViewActStatus" method="POST">
                                        <input hidden="" value="<%=a.getId()%>" name="id"/>
                                        <button class="btn btn-danger"  type="submit">Hide</button>
                                    </form>
                                    <%} else {%>
                                    <form action="../AdViewActStatus" method="POST">
                                        <input hidden="" value="<%=a.getId()%>" name="id"/>
                                        <button class="btn btn-info"  type="submit">Show</button>
                                    </form>
                                    <%}

                                    %>
                            </div>


                            <%}%>
                                
                                </div>
                        </div>
                        </ol>
                        
                    </div>
                </div>
                <!-- /.row -->

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>
