<%-- 
    Document   : index
    Created on : Mar 21, 2016, 9:51:12 AM
    Author     : User
--%>

<%@page import="POJOS.UserType"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%    Session s = Control.NewHibernateUtil.getSessionFactory().openSession();
    POJOS.User user = null;
    if (request.getSession().getAttribute("Login") != null) {
        user = (POJOS.User) request.getSession().getAttribute("Login");
    }
    if (user != null) {
        response.sendRedirect("index.jsp");
    }
//    String searchterm = "";
//    if (request.getParameter("search") != null) {
//        searchterm = request.getParameter("search");
//    }

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SELitLANKA</title>
        <link rel="stylesheet" href="style.css" type="text/css"/>
        <link rel="stylesheet" href="css/post-style.css" type="text/css"/>
        <link rel="stylesheet" href="plugin/slider/css/unslider.css" type="text/css"/>
        <link rel="stylesheet" href="bootstrap/bootstrap.css" type="text/css"/>
        <script src="bootstrap/bootstrap.min.js" type="text/javascript"/>
        <script src="plugin/slider/jquery-2.1.4.min.js" type="text/javascript"></script>
        <script src="plugin/jquery-2.1.4.min.js"type="text/javascript"></script> <!-- but with the right path! -->
        <script src="Js/banner.js" type="text/javascript"></script>

    </head>
    <style>

    </style>
    <body>
        <nav class="header">
            <%@include file="includes/menu.jsp" %>
        </nav>
        <div class="body" >

            <section class=" clear-top">

            </section>
            <div class="center" style="height: 475px">
                <header class="section-header rounded-edges orange-gradient">
                    <div class="col col1">
                        Signup
                    </div>


                </header>

                <section class="content container-fluid">

                    <div id='container'>
                        <div class='signup'>
                            <form action="SignUp" name="form2" method="POST">
                                <input type='text' name="uname" placeholder='User Name:'  />
                                <input type='text' name="email" placeholder='Email:'  />
                                <input type='password' id="password" name="password" placeholder='Password:'  />
                                <input type='password' id="confirm" onkeyup="paswordMatch()" name="confrim" placeholder='Re Enter Password:'  />
                                <a href="login.jsp">Already have an account?. Login here</a>

                                <input type='submit' onclick="checkAll()" value="SIGNUP" class="btn btn-lg orange bt" placeholder='SUBMIT' />
                            </form>
                        </div>
                        <div class='whysign'>
                            <h1>Create Account For Free</h1>
                            <p>Do you have something to sell?
                                Post your ad FOR FREE. Creating an account is free!</p>
                            <p id="errmsg" class="text-danger"></p>


                        </div>
                    </div>



                </section>


                <div style="width:400px ">
                    <%
                        if (request.getParameter("err") != null) {
                            out.write(request.getParameter("err"));
                        }
                    %>
                </div>
            </div>




        </div>
        <div>

        </div>
        <div class="footer">
            <%@include file="includes/footer.jsp" %>
        </div>
    </body>
</html>
