<%@page import="POJOS.SubCatagory"%>
<%@page import="POJOS.MainCatagory"%>
<%@page import="POJOS.Advert"%>
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
                        <li >
                            <a href="index.jsp"><i class="fa fa-fw fa-users"></i> Users</a>
                        </li >
                        <li >
                            <a href="ads.jsp"><i class="fa fa-fw fa-unlink"></i> Ads</a>
                        </li>
                        <li>
                            <a href="invoices.jsp"><i class="fa fa-fw fa-table"></i> Invoices</a>
                        </li>
                        <li class="active">
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
                                Main Categories
                            </h1>
                            <ol class="breadcrumb">
                                <li>
                                    <i class="fa fa-dashboard"></i>  <a href="index.jsp">Admin</a>
                                </li>
                                <li class="active">
                                    <i class="fa fa-file"></i> Users
                                </li>
                                <div class="form-group" style="width: 600px">
                                    <form method="POST" action="../AddCategory">
                                        <div class="input-group input-group-sm" >
                                            <input name="cat" type="text" class="form-control input-sm" placeholder="New Sub Category"/>
                                            <div class="input-group-addon btn btn-info ">
                                                <button type="submit" class="btn btn-success input-group-btn">Save</button>
                                           
                                            </div>
                                    
                                </div>
                                        </form>
                        </div>
                        </ol>
                        <table class="table table-responsive table-striped">
                            <tr>
                                <th>Id</th><th>User</th>
                            </tr>
                            <%
                                Criteria c = s.createCriteria(POJOS.MainCatagory.class);
                                
                                List<MainCatagory> li = c.list();
                                for (MainCatagory us : li) {

                            %>

                            <tr>
                                
                                <td><%=us.getId() %></td>
                                <td><%=us.getCatagory() %></td>
                                <td>
                                    <%
                                    if(us.getStatus()){
                                    %>
                                    <form action="../CatStatus" method="POST">
                                        <input hidden="" name="id" value="<%=us.getId() %>"/>
                                        <button type="submit" class="btn btn-info btn-sm">Showing</button>
                                    </form>
                                        <%}else{%>
                                        <form action="../CatStatus" method="POST">
                                        <input hidden="" name="id" value="<%=us.getId() %>"/>
                                        <button type="submit" class="btn btn-danger btn-sm">Hidden</button>
                                    </form>
                                        <%}%>
                                </td>
                                <td>
                                    <form action="SaveSubCategory.jsp" method="POST">
                                        <input hidden="" name="id" value="<%=us.getId() %>"/>
                                        <input hidden="" name="cat" value="<%=us.getCatagory() %>"/>
                                        <button type="submit" class="btn btn-info btn-sm">Add Sub Category</button>
                                    </form>
                                </td>
                                
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
