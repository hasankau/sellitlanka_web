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
<!--                            <li >
                            <a href="EditAdtypes.jsp"><i class="fa fa-fw fa-edit"></i> Ad Prices</a>
                        </li>-->
                            


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
                            <ol class="breadcrumb" style="background: #ccffcc">
                                <li>
                                    <i class="fa fa-dashboard"></i>  <a href="index.html">Admin</a>
                                </li>
                                <li class="active">
                                    <i class="fa fa-file"></i> Users
                                </li>

                            </ol>

                            <div class='signup'>
                                <form action="../newuser" name="form2" method="POST">
                                    <input type='text' name="uname" placeholder='User Name:'  />
                                    <input type='text' name="email" placeholder='Email:'  />
                                    <input type='password' id="password" name="password" placeholder='Password:'  />
                                    <input type='password' id="confirm" name="confrim" placeholder='Re Enter Password:'  />
                                    <%
                                        Criteria c = s.createCriteria(POJOS.UserType.class);
                                    %>
                                    <select name="type">


                                        <%
                                            if (u.getUserType().getId() == 1) {

                                        %>

                                        <option value="1">Super Admin</option>
                                        <option value="2">Admin</option>
                                        <option value="3">User</option>
                                        <%} else {%>
                                        <option value="3">User</option>
                                        <%}%>
                                    </select>

                                    <input type='submit' value="Sign Up" class="btn btn-success btn-sm" placeholder='SUBMIT' />
                                </form>
                            </div>

                            <table class="table table-responsive table-striped">
                                <tr>
                                    <th>User Name</th><th>Email</th><th>User Type</th>
                                </tr>
                                <%
                                    UserType ut = (UserType) s.load(POJOS.UserType.class, 1);
                                    UserType ut2 = (UserType) s.load(POJOS.UserType.class, 2);
                                    Criteria c2 = s.createCriteria(POJOS.User.class).add(Restrictions.not(Restrictions.eq("userType", ut)));

                                    if(u.getUserType().getId()==2){
                                    c2.add(Restrictions.not(Restrictions.eq("userType", ut2)));
                                    }
                                    
                                    List<User> li2 = c2.list();

                                    for (User us : li2) {

                                %>

                                <tr>
                                    <td><%=us.getUserName()%></td>
                                    <td><%=us.getEmail()%></td>
                                    <td><%=us.getUserType().getType()%></td>


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
