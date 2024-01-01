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

        <div id="wrapper" class="bg-warning">

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
                            <ol class="breadcrumb" style="background: #ccffcc">
                                <li>
                                    <i class="fa fa-dashboard"></i>  <a href="index.jsp">Admin</a>
                                    
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
                                        <div class="form-horizontal form-group">
                                
                                    <%
                                        if(request.getSession().getAttribute("Login")!=null){
                                        UserType ut = (UserType)s.load(POJOS.UserType.class, 1);
                                UserType ut1 = (UserType)s.load(POJOS.UserType.class, 2);
                                        
                                    if(u.getUserType().getId()==1){
                                    %>
                                    
                                    <form action="" method="POST">
                                    <input name="f1" hidden="" value="users"/>
                                    <button class="btn btn-default btn-sm" name="fil" value="1">Super</button>
                                    </form>
                                    <form action="" method="POST">
                                    <input name="f1" hidden="" value="users"/>
                                    <button class="btn btn-default btn-sm" name="fil" value="2">Admin</button>
                                    </form>
                                    <form action="" method="POST">
                                    <input name="f1" hidden="" value="users"/>
                                    <button class="btn btn-default btn-sm" name="fil" value="3">User</button>
                                    </form>
                                    <%}else{%>
                                    <form action="" method="POST">
                                    <input name="f1" hidden="" value="users"/>
                                    <button class="btn btn-default btn-sm" name="fil" value="3">User</button>
                                    </form>
                                <%}%>
                                
                                </div>
                        </div>
                        </ol>
                        <table class="table table-responsive table-striped">
                            <tr>
                                <th>User Name</th><th>Email</th><th>User Type</th><th>Status</th><td><button class="btn btn-info  btn-sm" onclick="location.href='new_user.jsp'">Add</button></td>
                            </tr>
                            <%
                                
                                Criteria c = s.createCriteria(POJOS.User.class);
                                
                                if(request.getParameter("fil")!=null){
                                    String fil = request.getParameter("fil");
                                    if(fil.equals("1")){
                                        UserType at = (UserType)s.load(UserType.class, 1);
                                        c.add(Restrictions.eq("userType", at));
                                    }
                                    if(fil.equals("2")){
                                        UserType at = (UserType)s.load(UserType.class, 2);
                                        c.add(Restrictions.eq("userType", at));
                                    }
                                    if(fil.equals("3")){
                                        UserType at = (UserType)s.load(UserType.class, 3);
                                        c.add(Restrictions.eq("userType", at));
                                    }
                                    
                                }
                                
                                
                                if (u.getUserType().getId()==ut1.getId()) {
                                    
                                    c.add(Restrictions.not(Restrictions.eq("userType", ut)));
                                    c.add(Restrictions.not(Restrictions.eq("userType", ut1)));
                                }
                                
                                
                                
                                if (request.getParameter("sear") != null) {
                                    String em = request.getParameter("sear");

                                    c.add(Restrictions.like("email", "%" + em + "%"));
                                }
                                List<User> li = c.list();

                                for (User us : li) {

                            %>

                            <tr>
                                <td><%=us.getUserName()%></td>
                                <td><%=us.getEmail()%></td>
                                <td><%=us.getUserType().getType()%></td>
                                <td><%if (us.getActStatus()) {%>
                                    <form action="../ActStatus" method="POST">
                                        <button class="btn btn-danger btn-sm" name="id" value="<%=us.getId()%>" type="submit">Deactivate</button>
                                    </form>
                                    <%} else {%>
                                    <form action="../ActStatus" method="POST">
                                        <button class="btn btn-info  btn-sm" name="id" value="<%=us.getId()%>" type="submit">Activate</button>
                                    </form>
                                    <%}

                                    %></td>
                                
                            </tr>

                            <%}}%>
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
