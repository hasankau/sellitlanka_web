
<%@page import="POJOS.User"%>
<div class="header-wrapper">
    <span class="logo-wrapper">
        <a href="index.jsp" class="logo">SELLitLANKA</a>
    </span>

    <%
        if (request.getSession().getAttribute("Login") != null) {
            User u = (User) request.getSession().getAttribute("Login");

            if (u.getUserType().getId() < 3) {
    %>
>
            <a style="height: 30px; bottom: 10px; " href="Admin/index.jsp"><span style="color: #fff">Admin</span></a>
        
            <a style="height: 30px; bottom: 10px; " href="profile.jsp"><span style="color: #fff"><%=u.getUserName()%></span></a>
        
    <%} else {%>
    <a style="height: 30px; bottom: 10px" href="profile.jsp"><span style="color: #fff"><%=u.getUserName()%></span></a>
        <%}
            }%>

    <a style=" height: 30px; width: 110px" href="AdvancedSearch.jsp" ><span class="glyphicon glyphicon-search" >Search</span></a>
    <menu>
        <div id="searchback">
            <div class="wrapper">
                <form name="searchform" action="index.jsp" method="GET" id="searform">
                    <input type="search" name="key" style="" id="search" autosave="some_unique_values" results="5" placeholder="search workosell..." onFocus="clearSearch()" onblur="searchDefault()" tabindex="1"/>
                    <input type="submit" value="" id="searchbt"/>
                </form>
            </div>

        </div>
        <ul class="menu-bar">
            <%            if (request.getSession().getAttribute("Login") != null) {
            %>
            <li><a href="Logout" class="menu-item"><span class="glyphicon glyphicon-log-out"></span></a></li>
                    <%}%>

            <li><a href="index.jsp" class="menu-item"><img alt="Home" src="img/home.png"/></a></li>
            <li><a href="cart.jsp" class="menu-item"><img alt="Profile" src="img/carticow.png"/></a></li>
            <ul>




            </ul>
    </menu>
</div>
