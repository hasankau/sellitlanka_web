<%-- 
    Document   : index
    Created on : Mar 21, 2016, 9:51:12 AM
    Author     : User
--%>

<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%    
Session s = Control.NewHibernateUtil.getSessionFactory().openSession();
    POJOS.User user = null;
    if (request.getSession().getAttribute("Login") != null) {
        user = (POJOS.User) request.getSession().getAttribute("Login");
    }
    if (user != null) {
        response.sendRedirect("index.jsp");
    }


%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SELitLANKA</title>
        <link rel="stylesheet" href="style.css" type="text/css"/>
        <link rel="stylesheet" href="css/post-style.css" type="text/css"/>
        <link type="text/css" rel="stylesheet" href="bootstrap/bootstrap.css"/>
        <script type="text/javascript" src="bootstrap/bootstrap.min.js"></script>
        <script type="text/javascript" src="Js/jquery-2.1.4.min.js"></script>
        <script src="plugin/jquery-2.1.4.min.js"type="text/javascript"></script> <!-- but with the right path! -->
        <script src="Js/banner.js" type="text/javascript"></script>


    </head>
    
    <style>
        
    </style>
    
    <body>
        <nav class="header">
            <%@include file="includes/menu.jsp" %>
        </nav>
        <div class="body">

            <section class="clear-top">

            </section>
            <div class="center">
                
                <header class="section-header orange-gradient rounded-edges">
                    <div class="col col1">
                        Sign In
                    </div>
                    <div class="col col2">

                    </div>
                </header>

                <div class="container-fluid" >

                <div id='container'>
  <div class='signup'>
      <form action="Login" method="POST">
         <input type='text' name="email" placeholder='Email:'  />
         <input type='password' name="password" placeholder='Password'  />
       <a href="signup.jsp">Don't have an account?. Sign up here</a>
       <input type='submit' class="btn btn-lg orange bt" value='LOGIN' />
     </form>
  </div>
  <div class='whysign'>
    <h1>Login </h1>
    <p>Do you have something to sell?
Post your ad FOR FREE. Creating an account is free!</p>
    
  </div>
                    <div style="float: bottom; width: 400px">
                        <%
                        if(request.getParameter("err")!=null){
                            out.write(request.getParameter("err"));
                        }
                        s.close();
                        %>
                    </div>
</div>
            </div>

            </div>
        </div>
        <div class="footer">
            <%@include file="includes/footer.jsp" %>
        </div>
    </body>
</html>
