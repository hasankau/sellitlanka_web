
<%@page import="POJOS.SubCatagory"%>
<%@page import="POJOS.AdType"%>
<%@page import="POJOS.MainCatagory"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="java.util.List"%>
<%@page import="POJOS.Advert"%>
<%@page import="org.hibernate.Criteria"%>
<%!
    int perpage = 6;
    int pageid = 0;
    int startat = 0;
%>



<%

    AdType ad = (AdType) s.load(POJOS.AdType.class, 2);
    Criteria ca1 = s.createCriteria(Advert.class).add(Restrictions.eq("adType", ad));

    ca1.add(Restrictions.eq("status", true));
    
    if (request.getParameter("key") != null) {
            String key = request.getParameter("key");
            ca1.add(Restrictions.or(Restrictions.like("title", "%" + key + "%"), Restrictions.like("content", "%" + key + "%")));
        }
    
    if (request.getParameter("cat") != null) {
        String cat = request.getParameter("cat");
        MainCatagory mc = (MainCatagory) s.load(MainCatagory.class, Integer.parseInt(cat));
        ca1.add(Restrictions.or(Restrictions.like("mainCatagory", mc)));
        
    } else if (request.getParameter("scat") != null && !request.getParameter("scat").trim().isEmpty()) {
        String cat = request.getParameter("scat");
        SubCatagory mc = (SubCatagory) s.load(SubCatagory.class, Integer.parseInt(cat));
        ca1.add(Restrictions.eq("subCatagory", mc));
        
    }else{
        ca1.add(Restrictions.sqlRestriction("1=1 order by rand()"));
    }

    ca1.setMaxResults(3);

    if (ca1.list().size() > 0) {
%>


<div class="container-fluid" style="padding: 2px;">





    <%
        List<Advert> l2 = ca1.list();
        for (Advert a : l2) {
            String path = a.getImage();

    %>
    <div class="col-sm-4 col-lg-4 col-md-4 " style="height: 375px">
        <div class="thumbnail" style="background: #ffffcc;">
            <a href="ad_view.jsp?id=<%=a.getId()%>">
                <div style="background-image: url('images/<%=path%>'); height: 150px; width: 208px; background-size: cover; background-position: center; background-repeat: no-repeat;"></div>
            </a>
            <div class="caption">
                <h4 style="color: #ff6633" class="pull-right">Rs.<%=a.getPrice()%></h4>
                <br>
                <h5><a href="ad_view.jsp?id=<%=a.getId()%>"><%=a.getTitle()%></a></h5>
                <p style="height: 54px; font-size: 14px; overflow: hidden"><%=a.getContent()%></p>
            </div>
            <div class="ratings" style="font-size: 12px;">
                <p class="pull-right"><%=a.getViews()%> views</p>
                <p>
                    <span class="text-success"><%=a.getDistrict().getDistrict()%></span>
                </p>
                <p>
                    <span class="text-muted">Top</span>
                </p>

            </div>
        </div>
    </div>

    <%}
        }%>


        
        
        
        
        
        
        
        
        
        

    <%

        Criteria ca = s.createCriteria(Advert.class);

        ca.add(Restrictions.eq("status", true));
        if (request.getParameter("key") != null) {
            String key = request.getParameter("key");
            ca.add(Restrictions.or(Restrictions.like("title", "%" + key + "%"), Restrictions.like("content", "%" + key + "%")));
        }
        
        if (request.getParameter("cat") != null) {
            String cat = request.getParameter("cat");
            MainCatagory mc = (MainCatagory) s.load(MainCatagory.class, Integer.parseInt(cat));
            ca.add(Restrictions.or(Restrictions.like("mainCatagory", mc)));
            
        } else if (request.getParameter("scat") != null && !request.getParameter("scat").trim().isEmpty()) {
            String cat = request.getParameter("scat");
            SubCatagory mc = (SubCatagory) s.load(SubCatagory.class, Integer.parseInt(cat));
            ca.add(Restrictions.eq("subCatagory", mc));
        }
        Integer results = ca.list().size();

        int pages = (results.intValue() / perpage + 1);

        if (results % perpage > 0 && pageid < pages) {
            pageid += 1;
        }

        if (request.getParameter("id") != null) {
            startat = (Integer.parseInt(request.getParameter("id")) - 1) * perpage;
        }
        ca.setFirstResult(startat);
        ca.setMaxResults(perpage);
        
        
        if (ca.list().size() > 0) {
    %>


    <div class="container-fluid" style="padding: 2px;">





        <%
            List<Advert> l = ca.list();
            for (Advert a : l) {
                String path = a.getImage();

        %>
        
        
        
        
        <div class="col-sm-4 col-lg-4 col-md-4" style="height: 375px">
            <div class="thumbnail" >
                <a href="ad_view.jsp?id=<%=a.getId()%>">
                    <div style="background-image: url('images/<%=path%>'); height: 150px; width: 207px; background-size: cover; background-position: center; background-repeat: no-repeat;"></div>
                </a>
                <div class="caption">
                    <h4 style="color: #ff6633" class="pull-right">Rs.<%=a.getPrice()%></h4>
                    <br>
                    <h5><a  href="ad_view.jsp?id=<%=a.getId()%>"><%=a.getTitle()%></a></h5>
                    <p style="height: 54px; font-size: 14px; overflow: hidden"><%=a.getContent()%></p>
                </div>
                <div class="ratings" style="font-size: 12px">
                    <p class="pull-right"><%=a.getViews()%> views</p>

                    <p>
                        <span class="text-success"><%=a.getDistrict().getDistrict()%></span>
                    </p>
                    <p>
                        <span class="text-muted">Classified</span>
                    </p>

                </div>
            </div>
        </div>

        <%}%>

    </div>

    <section class="content-footer">
        <%for (int i = 1; i < pages; i++) {

                if (i == startat) {
                    out.write("<a style='width: 80px; display: inline-block'><strong>Page " + i + "</strong></a> ");
                } else {
                    out.write("<a style='width: 80px; display: inline-block' href='index.jsp?id=" + i + "'>Page " + i + "</a> ");
                }
            }
        %>
    </section>
    <%} else {
    %>

    <div class="post">
        <div>No Results found</div>
    </div>


    <%}%>

