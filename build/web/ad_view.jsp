<%-- 
    Document   : index
    Created on : Mar 21, 2016, 9:51:12 AM
    Author     : User
--%>

<%@page import="POJOS.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="java.util.List"%>
<%@page import="POJOS.Advert"%>
<!DOCTYPE html>
<%    Session s = Control.NewHibernateUtil.getSessionFactory().openSession();

    POJOS.User user = null;
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




    </head>
    <body>
        <nav class="header">
            <%@include file="includes/menu.jsp" %>
        </nav>
        <div class="body" style="height: 1000px">

            <section class="middle">

            </section>
            <div class="center" style="height: 1000px">
                <header class="section-header rounded-edges orange-gradient">
                    <div class="col col1">
                        Catagories
                    </div>
                    <div class="col col2">
                        Post
                    </div>
                    <div class="col-right">
                        <a class="btn btn-medium btn-danger" href="ad_description.jsp">Post your Ad</a>
                    </div>
                </header>

                <section class="left">
                    <%@include file="includes/left-panel.jsp" %>
                </section>
                <section class="right">
                    <div class="content">


                        <div class="container-fluid" style="padding: 10px">

                            <%                                User u = null;
                                if (request.getParameter("id") != null) {
                                    Advert a = (Advert) s.load(Advert.class, Integer.parseInt(request.getParameter("id")));
                                    u = a.getUser();

                                    
                                        if (request.getSession().getAttribute("viewed") != a.getId()) {
                                            a.setViews(a.getViews() + 1);
                                            s.update(a);
                                            s.beginTransaction().commit();

                                        } else {
                                            request.getSession().setAttribute("viewed", a.getId());
                                        }

                                    String path = a.getImage();


                            %>

                            <script>
                                function showEmail() {
                                    $.ajax({
                                        data: "id=<%=a.getId()%>",
                                        method: 'POST',
                                        url: "getEmail",
                                        beforeSend: function (xhr) {
                                            $('#em').html("<img src='img/ani.gif' />");
                                        },
                                        success: function (data) {
                                            $('#em').html(data);
                                            $('#bt1').css({"display": "none"});
                                        }
                                    });
                                }

                                function showContact() {
                                    $.ajax({
                                        data: "id=<%=a.getId()%>",
                                        method: 'POST',
                                        url: "getContact",
                                        beforeSend: function (xhr) {
                                            $('#con').html("<img src='img/ani.gif' />");
                                        },
                                        success: function (data) {
                                            $('#con').html(data);
                                            $('#bt2').css({"display": "none"});
                                        }
                                    });
                                }
                            </script>

                            <div class="col-sm-7 col-lg-7 col-md-7" >
                                <div class="thumbnail" >
                                    <img  src="images/<%=path%>" alt=""/>
                                    <div class="caption">
                                        <h4 class="pull-right">Rs.<%=a.getPrice()%></h4>
                                        <h4><%=a.getTitle()%></a>
                                        </h4>
                                        <p style="line-break: auto; width: 340px; "><%=a.getContent()%></p>
                                    </div>
                                    <div class="ratings">
                                        <p class="pull-right"><%=a.getViews()%> views</p>
                                        <p class="color-gradient">
                                        <h4>Call : <%=a.getPhone()%></h4>
                                        <%

                                            if (user != null && user.getId() == a.getUser().getId()) {%>
                                        <div class='btn btn-sm btn-warning' onclick="location.href = 'edit_ad.jsp?id=<%=a.getId()%>'" >Edit</div>
                                        <form action="HideAd" method="POST">
                                            <input hidden="" name="id" value="<%=a.getId()%>"/>
                                            <button onclick="return confirm('Are you sure you want to remove this ad?')" class="btn btn-sm btn-danger" type="submit">Delete Ad</button>
                                        </form>
                                        <%}

                                        %>

                                        </p>
                                    </div>
                                </div>
                            </div>


                            <%}%>


                            <div class="row">
                                <div class="col-xs-8 col-sm-5 col-md-5">
                                    <div class="well well-sm">
                                        <div class="row">
                                            <div class="col-sm-4 col-md-3">
                                                <img src="img/Profile_avatar_placeholder_large.png" alt="" class="img-rounded img-responsive" />
                                            </div>

                                            <div class="col-sm-6 col-md-6">
                                                <%
                                                    if (request.getSession().getAttribute("Login") != null) {
                                                %>
                                                <h4>
                                                    <%=u.getUserName()%></h4>
                                                <p id="em" style="font-size: 12px; line-break: loose;">
                                                    <i class="glyphicon glyphicon-envelope"></i>Email : XXXXXXXX</p><button type="button" id="bt1" class="btn btn-sm btn-success" onclick="showEmail()">Show Email</button>
                                                <br>
                                                <p id="con">
                                                    <i class="glyphicon glyphicon-envelope"></i>Phone : XXXXXXXX</p><button type="button" id="bt2" class="btn btn-sm btn-success" onclick="showContact()">Show Contact</button>

                                                <%} else {%>
                                                <h4>Please login to view user details</h4>
                                                <%}%>
                                                <!-- Split button -->

                                                <div onclick="location.href = 'my_ads.jsp?uid=<%=u.getId()%>'" class="btn btn-primary">
                                                    More Ads
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div></div>

                        </div>
                    </div>
                </section>

            </div>


        </div>
        <div class="footer">
            <%@include file="includes/footer.jsp" %>
        </div>
    </body>
</html>
