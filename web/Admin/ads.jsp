<%@page import="POJOS.UserType"%>
<%@page import="POJOS.AdType"%>
<%@page import="org.hibernate.criterion.Order"%>
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
                        <li >
                            <a href="index.jsp"><i class="fa fa-fw fa-users"></i> Users</a>
                        </li >
                        <li class="active">
                            <a href="ads.jsp"><i class="fa fa-fw fa-unlink"></i> Ads</a>
                        </li>
                        <li>
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
                                Advertiesments
                            </h1>
                            <ol class="breadcrumb" style="background: #ccccff">
                                <li>
                                    <i class="fa fa-dashboard"></i>  <a href="index.jsp">Admin</a>
                                </li>
                                <li class="active">
                                    <i class="fa fa-file"></i> Ads
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
                                
                                <div class="form-horizontal form-group">
                                <form action="" method="POST">
                                    <input name="f1" hidden="" value="Free Ads"/>
                                    <button class="btn btn-default btn-sm" name="fil" value="1">Free Ads</button>
                                </form>
                                <form action="" method="POST">
                                    <input name="f1" hidden="" value="Top Ads"/>
                                    <button class="btn btn-default btn-sm" name="fil" value="2">Top Ads</button>
                                </form>
                                <form action="" method="POST">
                                    <input name="f1"hidden=""  value="Unpaid Top Ads"/>
                                    <button class="btn btn-default btn-sm" name="fil" value="3">Unpaid Top Ads</button>
                                </form>
                                <form action="" method="POST">
                                    <input name="f1" hidden="" value="Paid Top Ads"/>
                                    <button class="btn btn-default btn-sm" name="fil" value="4">Paid Top Ads</button>
                                </form>
                                </div>
                                
                                
                                <form action="ad_report.jsp" method="POST">
                                    <input name="f1" hidden="" value="Unpaid Top Ads"/>
                                    <button class="btn btn-primary btn-sm" name="fil" value="4">Report</button>
                                </form>
                                
                                <form action="ad_review_report.jsp" method="POST">
                                    <input name="f1" hidden="" value="Unpaid Top Ads"/>
                                    <button class="btn btn-warning btn-sm" name="fil" value="4">Ad Review Report</button>
                                </form>
                                
                                
                                
                        </ol>
                            <h2><%if(request.getParameter("f1")!=null){
                                out.write(request.getParameter("f1"));
                                        }%></h2>
                        <table class="table table-responsive table-striped">
                            <tr>
                                <th>Image</th><th>Ad Type</th><td>Date</td><th>User</th><th>Email</th>
                                <th>Contact Number</th>
                                <th>Ad Title</th><th>Showing</th><th>Paid</th>
                                <th><button onclick="location.href='savead.jsp'">Post</button></th>
                            </tr>
                            <%
                                Criteria c = s.createCriteria(POJOS.Advert.class).addOrder(Order.desc("id"));
                                
                                if(request.getParameter("fil")!=null){
                                    String fil = request.getParameter("fil");
                                    if(fil.equals("1")){
                                        AdType at = (AdType)s.load(AdType.class, 1);
                                        c.add(Restrictions.eq("adType", at));
                                    }
                                    if(fil.equals("2")){
                                        AdType at = (AdType)s.load(AdType.class, 2);
                                        c.add(Restrictions.eq("adType", at));
                                    }
                                    if(fil.equals("3")){
                                        AdType at = (AdType)s.load(AdType.class, 2);
                                        c.add(Restrictions.eq("adType", at))
                                                .add(Restrictions.eq("paid", false));
                                    }
                                    if(fil.equals("4")){
                                        AdType at = (AdType)s.load(AdType.class, 2);
                                        c.add(Restrictions.eq("adType", at))
                                                .add(Restrictions.eq("paid", true));
                                    }
                                    
                                }
                                
                                if (request.getParameter("sear") != null) {
                                    String em = request.getParameter("sear");
                                    User ut = (User)s.createCriteria(POJOS.User.class).add(Restrictions.like("email", "%"+em+"%")).list().toArray()[0];
                                    c.add(Restrictions.like("user", ut));
                                    //c.addOrder(Order.asc("id"));
                                }
                                List<Advert> li = c.list();

                                for (Advert us : li) {

                            %>

                            <tr>
                                <td><image width="100" src="../images/<%=us.getImage() %>"</td>
                                <td><%=us.getAdType().getType() %></td>
                                <td><%=us.getDate().toString() %></td>
                                <td><%=us.getUser().getUserName() %></td>
                                <td><%=us.getUser().getEmail() %></td>
                                <td><%=us.getUser().getTel() %></td>
                                <td><%=us.getTitle() %></td>
                                <td><%if (us.getStatus()) {%>
                                    <form action="../AdStatus" method="POST">
                                        <button class="btn btn-info" name="id" value="<%=us.getId()%>" type="submit">Showing</button>
                                    </form>
                                    <%} else {%>
                                    <form action="../AdStatus" method="POST">
                                        <button class="btn btn-danger " name="id" value="<%=us.getId()%>" type="submit">Hidden</button>
                                    </form>
                                    <%}

                                    %></td>
                                <td><%=us.getPaid() %></td>
                                <td>
                                    <form action="ad_view.jsp" method="POST">
                                        <button class="btn btn-success" name="id" value="<%=us.getId()%>" type="submit">View</button>
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
