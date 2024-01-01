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
<%    POJOS.User user = null;

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


        <script >
            function numsOnly(num) {
                var a = document.getElementById(num).value;
                if ((event.charCode >= 48 && event.charCode <= 57) & parseInt(a) > 0 & a != '-' & a != 'e') {
                    if (isNaN(parseInt(a))) {
                        return true;
                    }
                } else {
                    return false;
                }
            }
            function contact(num) {
                var a = document.getElementById(num).value;
                if (event.charCode >= 48 && event.charCode <= 57) {
                    if (isNaN(parseInt(a))) {
                        return true;
                    }
                } else {
                    return false;
                }
            }

            function loadSubcategoy() {
                
                var a = $("#mc option:selected").val();
                
                $.ajax({
                    data: "id=" + a,
                    method: 'POST',
                    url: "SearchSubcategory",
                    beforeSend: function (xhr) {
                    },
                    success: function (data) {
                        $('#sc').html(data);
                    }
                });
            }

        </script>

    </head>
    <body>
        <nav class="header">
            <%@include file="includes/menu.jsp" %>
        </nav>
        <div class="body" style="height: 1200px; margin-top: 50px">

            <section class="middle">

            </section>
            <div class="center" style="height: 1000px">
                <header class="section-header rounded-edges orange-gradient">
                    <div class="col col1">

                    </div>

                    <div class="col-right">
                    </div>
                </header>


                <div class="content">


                    <form class="form-horizontal" id="data" method="POST" action="SaveAd" enctype="multipart/form-data">
                        <fieldset>

                            <!-- Form Name -->
                            <center>
                                <h2>Post Ad</h2>
                            </center>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="fn">Image</label>  
                                <div class="col-md-4">
                                    <input id="im" name="im" accept="image/*" type="file" placeholder="Title" class="form-control input-md" required="">

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

                                    <select id="sc" class="form-control" name="sc">

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
                                    <input id="price" name="price" onkeypress="return numonly(this.id)" min="0" max="10000000" type="number" placeholder="Price" class="form-control input-md" required="">

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
                                <label class="col-md-4 control-label" for="phone">Email</label>  
                                <div class="col-md-4">
                                    <input id="phone" name="email" type="email" placeholder="Email" class="form-control input-md" required="">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="phone">Telephone</label>  
                                <div class="col-md-4">
                                    <input id="phone" name="phone" onkeypress="return contact(this.id)" maxlength="10" max="2000000000" onkeypress="return validatePhone(this.value)" type="number" placeholder="Phone" class="form-control input-md" required="">

                                </div>
                            </div>

                            <input hidden="" value="1" name="ad" />

                            <!-- Button -->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="submit"></label>
                                <div class="col-md-4">
                                    <button id="submit" type="submit" name="submit" class="btn btn-primary">POST AD</button>
                                </div>

                            </div>



                        </fieldset>
                    </form>

                    <!-- Button -->





                </div>


            </div>


        </div>
        <div class="footer">
            <%@include file="includes/footer.jsp" %>
        </div>
    </body>
</html>
