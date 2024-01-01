<%-- 
    Document   : index
    Created on : Mar 21, 2016, 9:51:12 AM
    Author     : User
--%>

<%@page import="POJOS.SubCatagory"%>
<%@page import="POJOS.MainCatagory"%>
<%@page import="POJOS.District"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="java.util.List"%>
<%@page import="POJOS.Advert"%>
<!DOCTYPE html>
<%    
    POJOS.User user = null;

    Session s = Control.NewHibernateUtil.getSessionFactory().openSession();
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
        <link type="text/css" rel="stylesheet" href="plugin/jquery-ui/jquery-ui.css" />
        <link type="text/css" rel="stylesheet" href="bootstrap/bootstrap.css" />
        <script type="text/javascript" src="bootstrap/bootstrap.min.js"></script>
        <script type="text/javascript" src="plugin/jquery-ui/jquery-ui.js"></script>
        <script src="plugin/slider/jquery-2.1.4.min.js" type="text/javascript"></script>
        <script src="plugin/jquery-2.1.4.min.js"type="text/javascript"></script> <!-- but with the right path! -->

        <script src="Js/responsiveslides.min.js" type="text/javascript"></script>


        <script>
            function loadSubcategoy() {

                    var a = $("#mc option:selected").val();
                    $.ajax({
                        data: "id=" + a,
                        method: 'POST',
                        url: "SearchSubcategory",
                        beforeSend: function (xhr) {
                        },
                        success: function (data) {
                            $('#sc').html("<option value='0'>-Select-</option>"+data);
                        }
                    });
                }

        </script>

    </head>
    <body>
        <nav class="header">
            <%@include file="includes/menu.jsp" %>
        </nav>
        <div class="body" style="min-height: 1800px; margin-top: 50px">


            <div class="center" style="min-height: 1700px;">
                <header class="section-header rounded-edges orange-gradient">
                    <div class="col col1" >
                        Search Ads
                    </div>

                    <div class="col-right">
                    </div>
                </header>
                <section class="left">
                    <%@include file="includes/left-panel.jsp" %>


                </section>
                    <section class="right">
                <div class="content">
                    <form class="form-horizontal" id="data" method="GET">
                        <fieldset>

                            <!-- Form Name -->
                            <center>
                                <h2>What are you looking for?</h2>
                            </center>
                            <center>
                                <h3>Search by...</h3>
                            </center>
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="ctry">Category</label>  
                                <div class="col-md-4">

                                    <select id="mc" onchange="loadSubcategoy()" class="form-control" name="mc">
                                        <option value="0">-Select-</option>
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
                                        <option value="0">-Select-</option>
                                        <%

                                            List<SubCatagory> li4 = s.createCriteria(SubCatagory.class).list();
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
                                    <input id="fn" name="key" type="text" placeholder="Title" class="form-control input-md" >

                                </div>
                            </div>


                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="cmpny">Price From</label>  
                                <div class="col-md-4">
                                    <input id="city" name="price1" type="number" placeholder="Price" class="form-control input-md" >

                                </div>
                            </div>
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="cmpny">Price To</label>  
                                <div class="col-md-4">
                                    <input id="city" name="price2" type="number" placeholder="Price" class="form-control input-md" >

                                </div>
                            </div>


                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="ctry">District</label>  
                                <div class="col-md-4">
                                    <select class="form-control" name="dis">
                                        <option value="0">-Select-</option>
                                        <%

                                            List<District> li2 = s.createCriteria(District.class).list();
                                            for (District d : li2) {

                                        %>

                                        <option value="<%=d.getId()%>"><%=d.getDistrict()%></option>

                                        <%}%>

                                    </select>

                                </div>
                            </div>


                            <!-- Button -->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="submit"></label>
                                <div class="col-md-4">
                                    <button id="submit" type="submit" name="submit" class="btn btn-primary">SEARCH</button>
                                </div>

                            </div>



                        </fieldset>
                    </form>

                    <!-- Button -->

                    <%@include file="includes/advancedSearch.jsp" %>          

                </div>
                    </section>

            </div>


        </div>
        <div class="footer">
            <%@include file="includes/footer.jsp" %>
        </div>
    </body>
</html>
