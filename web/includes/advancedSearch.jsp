



<%@page import="POJOS.District"%>
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

    if (request.getParameter("key") != null && request.getParameter("key") != "" && !request.getParameter("key").trim().isEmpty()) {
        String key = request.getParameter("key");
        ca1.add(Restrictions.or(Restrictions.like("title", "%" + key + "%"), Restrictions.like("content", "%" + key + "%")));
    } else {
        if (request.getParameter("mc") != null && !request.getParameter("mc").trim().isEmpty() && Integer.parseInt(request.getParameter("mc")) != 0) {
            String cat = request.getParameter("mc");
            MainCatagory mc = (MainCatagory) s.load(MainCatagory.class, Integer.parseInt(cat));
            ca1.add(Restrictions.or(Restrictions.eq("mainCatagory", mc)));
            
        } else if (request.getParameter("sc") != null && !request.getParameter("sc").trim().isEmpty() && Integer.parseInt(request.getParameter("sc")) != 0) {
            String cat = request.getParameter("sc");
            SubCatagory mc = (SubCatagory) s.load(SubCatagory.class, Integer.parseInt(cat));
            ca1.add(Restrictions.or(Restrictions.eq("subCatagory", mc)));
            
        } else if (request.getParameter("dis") != null && !request.getParameter("dis").trim().isEmpty() && Integer.parseInt(request.getParameter("dis")) != 0) {
            String cat = request.getParameter("dis");
            District mc = (District) s.load(District.class, Integer.parseInt(cat));
            ca1.add(Restrictions.or(Restrictions.eq("district", mc)));
            
        } else if (request.getParameter("price1") != null && request.getParameter("price1") != "" && request.getParameter("price1").trim().isEmpty() && request.getParameter("price2") != null && request.getParameter("price2") != "" && request.getParameter("price2").trim().isEmpty()) {
            String p1 = request.getParameter("price1");
            String p2 = request.getParameter("price2");
            ca1.add(Restrictions.ge("price", Double.parseDouble(p1)));
            ca1.add(Restrictions.le("price", Double.parseDouble(p2)));
            
        } else {
            
        }
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

        AdType ad2 = (AdType) s.load(POJOS.AdType.class, 1);
        Criteria ca = s.createCriteria(Advert.class).add(Restrictions.eq("adType", ad2));

        ca.add(Restrictions.eq("status", true));
        if (request.getParameter("key") != null && request.getParameter("key") != "" && !request.getParameter("key").trim().isEmpty()) {
            String key = request.getParameter("key");
            ca.add(Restrictions.or(Restrictions.like("title", "%" + key + "%"), Restrictions.like("content", "%" + key + "%")));
        } else if (request.getParameter("mc") != null && !request.getParameter("mc").trim().isEmpty() && Integer.parseInt(request.getParameter("mc")) != 0) {
            String cat = request.getParameter("mc");
            MainCatagory mc = (MainCatagory) s.load(MainCatagory.class, Integer.parseInt(cat));
            ca.add(Restrictions.or(Restrictions.eq("mainCatagory", mc)));
        } else if (request.getParameter("sc") != null && !request.getParameter("sc").trim().isEmpty() && Integer.parseInt(request.getParameter("sc")) != 0) {
            String cat = request.getParameter("sc");
            SubCatagory mc = (SubCatagory) s.load(SubCatagory.class, Integer.parseInt(cat));
            ca.add(Restrictions.or(Restrictions.eq("subCatagory", mc)));
        } else if (request.getParameter("dis") != null && !request.getParameter("dis").trim().isEmpty() && Integer.parseInt(request.getParameter("dis")) != 0) {
            String cat = request.getParameter("dis");
            District mc = (District) s.load(District.class, Integer.parseInt(cat));
            ca.add(Restrictions.or(Restrictions.eq("district", mc)));
        } else if (request.getParameter("price1") != null && request.getParameter("price1") != "" && request.getParameter("price1").trim().isEmpty() && request.getParameter("price2") != null && request.getParameter("price2") != "" && request.getParameter("price2").trim().isEmpty()) {
            String p1 = request.getParameter("price1");
            String p2 = request.getParameter("price2");
            ca1.add(Restrictions.ge("price", Double.parseDouble(p1)));
            ca1.add(Restrictions.le("price", Double.parseDouble(p2)));
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
                    out.write("<a style='width: 80px; display: inline-block' href='AdvancedSearch.jsp?id=" + i + "'>Page " + i + "</a> ");
                }
            }
        %>
    </section>
    <%} else {
    %>

    <div class="post">
        <center><div>No Results found</div></center>
    </div>
</div>

<%}%>

