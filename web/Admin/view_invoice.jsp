<%@page import="POJOS.InvoiceHasAdvert"%>
<%@page import="java.util.Set"%>
<%@page import="POJOS.Invoice"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Session"%>
<%@page import="POJOS.User"%>
<%@page import="org.hibernate.Criteria"%>
<!DOCTYPE html>
<html lang="en">
    <%
        Session s = Control.NewHibernateUtil.getSessionFactory().openSession();

        User u = null;
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
                        <li>
                            <a href="index.jsp"><i class="fa fa-fw fa-users"></i> Users</a>
                        </li>
                        <li>
                            <a href="ads.jsp"><i class="fa fa-fw fa-unlink"></i> Ads</a>
                        </li>
                        <li class="active">
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
                                Invoice
                            </h1>
                            <ol class="breadcrumb">
                                <li>
                                    <i class="fa fa-dashboard"></i>  <a href="index.html">Dashboard</a>
                                </li>
                                <li class="active">
                                    <i class="fa fa-file"></i> Users
                                </li>
                                <div class="form-group" style="width: 600px">
                                    <form method="POST">
                                        <div class="input-group input-group-sm" >
                                            <input name="sear" type="search" class="form-control input-sm" placeholder="Search by email"/>
                                            <div class="input-group-addon btn btn-info ">
                                                <button type="submit" class="btn btn-info input-group-btn">Search</button>
                                            </div>
                                    </form>
                                </div>
                        </div>
                        </ol>
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
