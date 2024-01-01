<%@page import="POJOS.District"%>
<%@page import="POJOS.SubCatagory"%>
<%@page import="POJOS.MainCatagory"%>
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
                        <li >
                            <a href="index.jsp"><i class="fa fa-fw fa-users"></i> Users</a>
                        </li>
                        <li class="active">
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
                                    <i class="fa fa-file"></i> Ads
                                </li>

                        </div>
                        </ol>

                            <div class="col-lg-12">
                                <form class="form-horizontal" id="data" method="POST" action="../AdminAd" enctype="multipart/form-data">
                            <fieldset>

                                <!-- Form Name -->
                                <center>
                                    <h2>Post Ad</h2>
                                </center>

                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="fn">Image</label>  
                                    <div class="col-md-4">
                                        <input id="im" name="im" type="file" placeholder="Title" class="form-control input-md" required="">

                                    </div>
                                </div>

                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="ctry">Category</label>  
                                    <div class="col-md-4">

                                    <select id="mc" onchange="loadSubcategoy()" class="form-control" name="mc">

                                            <%
                                                List<MainCatagory> li = s.createCriteria(MainCatagory.class).add(Restrictions.eq("status", true)).list();
                                                for (MainCatagory d : li) {

                                            %>

                                            <option value="<%=d.getId()%>"><%=d.getCatagory()%></option>

                                            <%}%>

                                        </select>

                                    </div>
                                </div>

                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="ctry">Sub Category</label>  
                                    <div class="col-md-4">

                                        <select class="form-control" id="sc" name="sc">

                                            <%

                                                List<SubCatagory> li4 = s.createCriteria(SubCatagory.class).add(Restrictions.eq("status", true)).list();
                                                for (SubCatagory d : li4) {

                                            %>

                                            <option value="<%=d.getId()%>"><%=d.getCatagory()%></option>

                                            <%}%>

                                        </select>

                                    </div>
                                </div>

                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="fn">Title</label>  
                                    <div class="col-md-4">
                                        <input id="fn" name="title" type="text" placeholder="Title" class="form-control input-md" required="">

                                    </div>
                                </div>



                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="cmpny">Description</label>  
                                    <div class="col-md-4">
                                        <textarea id="cmpny" name="des" type="text" placeholder="Description" class="form-control input-md" required=""></textarea>

                                    </div>
                                </div>


                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="cmpny">Price</label>  
                                    <div class="col-md-4">
                                        <input id="city" name="price" type="number" placeholder="Price" class="form-control input-md" required="">

                                    </div>
                                </div>


                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="ctry">District</label>  
                                    <div class="col-md-4">

                                        <select class="form-control" name="dis">

                                            <%

                                                List<District> li2 = s.createCriteria(District.class).list();
                                                for (District d : li2) {

                                            %>

                                            <option value="<%=d.getId()%>"><%=d.getDistrict()%></option>

                                            <%}%>

                                        </select>

                                    </div>
                                </div>

                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="phone">Telephone</label>  
                                    <div class="col-md-4">
                                        <input id="phone" name="phone" type="tel" placeholder="Phone" class="form-control input-md" required="">

                                    </div>
                                </div>

                                <!-- Button -->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="submit"></label>
                                    <div class="col-md-4">
                                        Top Up : <input type="radio" name="ad" value="2"/>
                                    </div>

                                </div>

                                <!-- Button -->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="submit"></label>
                                    <div class="col-md-4">
                                        <button id="submit" type="submit" name="submit" class="btn btn-primary">POST AD</button>
                                    </div>

                                </div>



                            </fieldset>
                        </form>
                            </div>


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

    <script>
            function loadSubcategoy() {

                    var a = $("#mc option:selected").val();
                    $.ajax({
                        data: "id=" + a,
                        method: 'POST',
                        url: "../SearchSubcategory",
                        beforeSend: function (xhr) {
                        },
                        success: function (data) {
                            $('#sc').html(data);
                        }
                    });
                }
        </script>
    
</body>

</html>
