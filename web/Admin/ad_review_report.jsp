<%@page import="POJOS.AdReview"%>
<%@page import="java.text.SimpleDateFormat"%>
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
                            <ol class="breadcrumb">
                                <li>
                                    <i class="fa fa-dashboard"></i>  <a href="index.html">Admin</a>
                                </li>
                                <li class="active">
                                    <i class="fa fa-file"></i> Ads
                                </li>
                               
                                </div>
                        </div>
                                
                                <form method="POST" method="POST">
                                        <div class="input-group input-group-sm" >
                                            From:
                                            <input name="from" value="" type="date" class="form-control input-sm" placeholder=""/>
                                            To:
                                            <input name="to" value="" type="date" class="form-control input-sm" placeholder=""/>
                                            <div class="input-group-addon btn btn-info ">
                                                <button type="submit" class="btn btn-info input-group-btn">Search</button>
                                            </div>
                                        </div>
                                    </form>
                                
                                
                                </div>

                                
                                
                        </ol>
                            <%
                                    if (request.getParameter("from") != null && !request.getParameter("from").trim().isEmpty() && request.getParameter("to") != null && !request.getParameter("to").trim().isEmpty()) {
                                        String from = request.getParameter("from");
                                        String to = request.getParameter("to");
                                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                        out.write("From : "+from+" To : "+to);
                                    }

                                %>
                        <table class="table table-responsive table-striped">
                            <tr>
                                <th>Date</th><th>Responsible User</th><th>Email</th>
                                <th>User Type</th>
                                <th>Ad Title</th>
                                <th>Action</th><th>Paid</th>
                                <th>Main Category</th>
                            </tr>
                            <%
                                Criteria c = s.createCriteria(POJOS.AdReview.class).addOrder(Order.desc("date"));
                                
                                
                                
                                if (request.getParameter("from") != null && !request.getParameter("from").trim().isEmpty() && request.getParameter("to") != null && !request.getParameter("to").trim().isEmpty()) {
                                    String from = request.getParameter("from");
                                    String to = request.getParameter("to");
                                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                    c.add(Restrictions.between("date", sdf.parse(from), sdf.parse(to)));
                                }
                                
                                List<AdReview> li = c.list();

                                for (AdReview us : li) {

                            %>

                            <tr>
                                <td><%=us.getDate()%></td>
                                <td><%=us.getUser().getUserName() %></td>
                                <td><%=us.getUser().getEmail() %></td>
                                <td><%=us.getUser().getUserType().getType() %></td>
                                <td><%=us.getAdvert().getTitle() %></td>
                                <td>
                                    <%
                                    if(us.getStatus()){
                                        
                                        %>
                                        
                                        Approved
                                        
                                    <%}else{
                                    %>
                                    Disapproved
                                    <%}%>
                                </td>
                                <td><%=us.getAdvert().getPaid() %></td>
                                <td><%=us.getAdvert().getMainCatagory().getCatagory() %></td>
                                <td>
                                    <form action="ad_view.jsp" method="POST">
                                        <button class="btn btn-success" name="id" value="<%=us.getId()%>" type="submit">View</button>
                                    </form>
                                </td>
                            </tr>

                            <%}%>
                        </table>
                        <button onclick="print()">Print</button>
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
