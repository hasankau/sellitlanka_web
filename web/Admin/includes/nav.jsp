
<ul class="nav navbar-right top-nav">


    <li class="">
        <a href="../index.jsp">Go to site</a>
    </li>
    

    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> 
            <%
            if(request.getSession().getAttribute("Login")!=null){
                out.write(u.getUserName());
            }
            %>
           <b class="caret"></b></a>
        <ul class="dropdown-menu">
            <li>
                <a href="profile.jsp"><i class="fa fa-fw fa-user"></i> Profile</a>
            </li>
            <li>
                <a href="../Logout"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
            </li>
        </ul>
    </li>
</ul>






