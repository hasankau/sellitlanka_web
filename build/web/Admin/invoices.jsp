<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
                        </li><li >
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
                                Invoices
                            </h1>
                            <ol class="breadcrumb " style="background: #ccffcc">
                                <li>
                                    <i class="fa fa-dashboard"></i>  <a href="index.jsp">Admin</a>
                                </li>
                                <li class="active">
                                    <i class="fa fa-file"></i> Invoices
                                </li>
                                <div class="form-group" style="width: 600px">
                                    <form method="POST">
                                        <div class="input-group input-group-sm" >
                                            <input name="sear" type="search" class="form-control input-sm" placeholder="Search by email"/>
                                            <div class="input-group-addon btn btn-info ">
                                                <button type="submit" class="btn btn-info input-group-btn">Search</button>
                                            </div>
                                        </div>
                                    </form>

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

                                <%
                                    if (request.getParameter("from") != null && !request.getParameter("from").trim().isEmpty() && request.getParameter("to") != null && !request.getParameter("to").trim().isEmpty()) {
                                        String from = request.getParameter("from");
                                        String to = request.getParameter("to");
                                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                        out.write("From : "+from+" To : "+to);
                                    }

                                %>
                        </div>
                        </ol>
                        <table class="table table-responsive table-striped">
                            <tr>
                                <th>User Name</th><th>Email</th><th>Invoice</th><th>Date</th><th>Total</th>
                            </tr>
                            <%                                double tot = 0.0;
                                Criteria c = s.createCriteria(POJOS.Invoice.class);
                                if (request.getParameter("sear") != null) {
                                    String em = request.getParameter("sear");
                                    User ut = null;
                                    List<User> li = s.createCriteria(POJOS.User.class).add(Restrictions.like("email", "%" + em + "%")).list();
                                    
                                    if(li.size()>0){
                                    ut = (User) li.toArray()[0];
                                    }
                                                                        c.add(Restrictions.like("user", ut));

                                }

                                if (request.getParameter("from") != null && !request.getParameter("from").trim().isEmpty() && request.getParameter("to") != null && !request.getParameter("to").trim().isEmpty()) {
                                    String from = request.getParameter("from");
                                    String to = request.getParameter("to");
                                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                    c.add(Restrictions.between("dateTime", sdf.parse(from), sdf.parse(to)));
                                }

                                List<Invoice> li = c.list();
                                if(c.list().size()>1){
                                for (Invoice in : li) {
                                    tot += in.getTotal();
                                    User ut = in.getUser();
                            %>

                            <tr>
                                <td><%=ut.getUserName()%></td>
                                <td><%=ut.getEmail()%></td>
                                <td><%=in.getId()%></td>
                                <td><%=in.getDateTime()%></td>
                                <td><%=in.getTotal()%></td>
                                <td>
                                    <form action="view_invoice.jsp" method="POST">
                                        <input hidden="" name="id" value="<%=in.getId()%>"/>
                                        <button class="btn btn-info" type="submit" type="button">View</button>
                                    </form>
                                </td>
                            </tr>

                            <%}}%>
                        </table>
                        <h3>Total : <%=tot%></h3>
                        <button onclick="print()" >Print</button>
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
