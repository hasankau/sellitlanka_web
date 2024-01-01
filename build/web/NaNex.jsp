<%-- 
    Document   : index
    Created on : Mar 21, 2016, 9:51:12 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="java.util.List"%>
<%@page import="POJOS.Advert"%>
<!DOCTYPE html>

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
            
            <center>
                <div style="margin: auto; margin-top: 200px" class="col-lg-5">
                    <h1><sup>Number Format</sup>/ERROR</h1>
                    <h4>There was a number format exception!</h4>
                    <button type="button" class="btn btn-sm btn-warning" onclick="window.history.back()">Back</button>
                </div>
                </center>
        </div>
        <div class="footer">
            <%@include file="includes/footer.jsp" %>
        </div>
    </body>
</html>
