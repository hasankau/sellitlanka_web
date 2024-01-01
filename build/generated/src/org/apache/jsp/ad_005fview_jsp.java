package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import POJOS.User;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.hibernate.Criteria;
import java.util.List;
import POJOS.Advert;
import POJOS.User;
import java.util.Set;
import POJOS.SubCatagory;
import org.hibernate.criterion.Restrictions;
import org.hibernate.criterion.Order;
import org.hibernate.Session;
import java.util.List;
import POJOS.MainCatagory;
import org.hibernate.Criteria;

public final class ad_005fview_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(3);
    _jspx_dependants.add("/includes/menu.jsp");
    _jspx_dependants.add("/includes/left-panel.jsp");
    _jspx_dependants.add("/includes/footer.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
    Session s = Control.NewHibernateUtil.getSessionFactory().openSession();

    POJOS.User user = null;
    if (request.getSession().getAttribute("Login") != null) {
        user = (POJOS.User) request.getSession().getAttribute("Login");
    }



      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Workosell</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"style.css\" type=\"text/css\"/>\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/post-style.css\" type=\"text/css\"/>\n");
      out.write("        <link type=\"text/css\" rel=\"stylesheet\" href=\"plugin/jquery-ui/jquery-ui.css\" />\n");
      out.write("        <link type=\"text/css\" rel=\"stylesheet\" href=\"bootstrap/bootstrap.css\" />\n");
      out.write("        <script type=\"text/javascript\" src=\"bootstrap/bootstrap.min.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"plugin/jquery-ui/jquery-ui.js\"></script>\n");
      out.write("        <script src=\"plugin/slider/jquery-2.1.4.min.js\" type=\"text/javascript\"></script>\n");
      out.write("        <script src=\"plugin/jquery-2.1.4.min.js\"type=\"text/javascript\"></script> <!-- but with the right path! -->\n");
      out.write("\n");
      out.write("        <script src=\"Js/responsiveslides.min.js\" type=\"text/javascript\"></script>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <nav class=\"header\">\n");
      out.write("            ");
      out.write("\n");
      out.write("\n");
      out.write("<div class=\"header-wrapper\">\n");
      out.write("    <span class=\"logo-wrapper\">\n");
      out.write("        <a href=\"index.jsp\" class=\"logo\">SELLitLANKA</a>\n");
      out.write("    </span>\n");
      out.write("\n");
      out.write("    ");

        if (request.getSession().getAttribute("Login") != null) {
            User u = (User) request.getSession().getAttribute("Login");

            if (u.getUserType().getId() < 3) {
    
      out.write("\n");
      out.write("    <a style=\"height: 30px; bottom: 10px\" href=\"Admin/index.jsp\"><span style=\"color: #fff\">Admin</span></a>\n");
      out.write("\n");
      out.write("    ");
} else {
      out.write("\n");
      out.write("    <a style=\"height: 30px; bottom: 10px\" href=\"profile.jsp\"><span style=\"color: #fff\">");
      out.print(u.getUserName());
      out.write("</span></a>\n");
      out.write("        ");
}}
      out.write("\n");
      out.write("\n");
      out.write("    <a style=\" height: 35px; width: 150px\" href=\"AdvancedSearch.jsp\" ><span class=\"glyphicon glyphicon-search\" >Advanced Search</span></a>\n");
      out.write("    <menu>\n");
      out.write("        <div id=\"searchback\">\n");
      out.write("            <div class=\"wrapper\">\n");
      out.write("                <form name=\"searchform\" action=\"index.jsp\" method=\"GET\" id=\"searform\">\n");
      out.write("                    <input type=\"search\" name=\"key\" style=\"\" id=\"search\" autosave=\"some_unique_values\" results=\"5\" placeholder=\"search workosell...\" onFocus=\"clearSearch()\" onblur=\"searchDefault()\" tabindex=\"1\"/>\n");
      out.write("                    <input type=\"submit\" value=\"\" id=\"searchbt\"/>\n");
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("        <ul class=\"menu-bar\">\n");
      out.write("            ");
            if (request.getSession().getAttribute("Login") != null) {
            
      out.write("\n");
      out.write("            <li><a href=\"Logout\" class=\"menu-item\"><span class=\"glyphicon glyphicon-log-out\"></span></a></li>\n");
      out.write("                    ");
}
      out.write("\n");
      out.write("\n");
      out.write("            <li><a href=\"index.jsp\" class=\"menu-item\"><img alt=\"Home\" src=\"img/home.png\"/></a></li>\n");
      out.write("            <li><a href=\"cart.jsp\" class=\"menu-item\"><img alt=\"Profile\" src=\"img/carticow.png\"/></a></li>\n");
      out.write("            <ul>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("            </ul>\n");
      out.write("    </menu>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("        </nav>\n");
      out.write("        <div class=\"body\" style=\"height: 1000px\">\n");
      out.write("\n");
      out.write("            <section class=\"middle\">\n");
      out.write("\n");
      out.write("            </section>\n");
      out.write("            <div class=\"center\" style=\"height: 1000px\">\n");
      out.write("                <header class=\"section-header rounded-edges orange-gradient\">\n");
      out.write("                    <div class=\"col col1\">\n");
      out.write("                        Catagories\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col col2\">\n");
      out.write("                        Post\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-right\">\n");
      out.write("                        <a class=\"btn btn-medium btn-danger\" href=\"ad_description.jsp\">Post your Ad</a>\n");
      out.write("                    </div>\n");
      out.write("                </header>\n");
      out.write("\n");
      out.write("                <section class=\"left\">\n");
      out.write("                    ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<div class=\"left-wrapper\" style=\"padding: 2px\">\n");
      out.write("    <section class=\"col1\" style=\" overflow: hidden\">\n");
      out.write("        <ul >\n");
      out.write("            ");


                Session ses = Control.NewHibernateUtil.getSessionFactory().openSession();
                Criteria c = ses.createCriteria(POJOS.MainCatagory.class).add(Restrictions.eq("status", true));

                
      out.write("\n");
      out.write("\n");
      out.write("                <li><a href='index.jsp'>All Categories</a></li>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("            ");


                if (request.getParameter("cat") != null && request.getParameter("cat")!="" && !request.getParameter("cat").trim().isEmpty()) {

                    MainCatagory mc = (MainCatagory) s.load(POJOS.MainCatagory.class, Integer.parseInt(request.getParameter("cat")));
                        out.write("<ul><li class='sel'><a href='index.jsp?cat=" + mc.getId() + "'><strong>" + mc.getCatagory() + "</strong></a></li></ul>");
                        Set<POJOS.SubCatagory> li = mc.getSubCatagories();
                        for (POJOS.SubCatagory sc : li) {

                                out.write("<li><a style='color: #66cc00; padding-left: 10px' href='index.jsp?scat=" + sc.getId() + "'>" + sc.getCatagory() + "</a></li>");
                            }
                    
                       

                    } else {
                    
                    
                    
                     c.addOrder(Order.asc("catagory"));
                        List<POJOS.MainCatagory> li = c.list();

                        for (POJOS.MainCatagory mc : li) {
                            out.write("<li><a href='index.jsp?cat=" + mc.getId() + "'>" + mc.getCatagory() + "</a></li>");
                            
                        }
                    
                    
                    
                    }
                
      out.write("\n");
      out.write("        </ul>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("    </section>\n");
      out.write("\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("                </section>\n");
      out.write("                <section class=\"right\">\n");
      out.write("                    <div class=\"content\">\n");
      out.write("\n");
      out.write("\n");
      out.write("                        <div class=\"container-fluid\" style=\"padding: 10px\">\n");
      out.write("\n");
      out.write("                            ");
                                User u = null;
                                if (request.getParameter("id") != null) {
                                    Advert a = (Advert) s.load(Advert.class, Integer.parseInt(request.getParameter("id")));
                                    u = a.getUser();

                                    if (request.getSession() != (HttpSession) request.getAttribute("ses")) {
                                        a.setViews(a.getViews() + 1);
                                        s.update(a);
                                        s.beginTransaction().commit();
                                        request.setAttribute("ses", request.getSession());
                                    }
                                    String path = a.getImage();


                            
      out.write("\n");
      out.write("\n");
      out.write("                            <script>\n");
      out.write("                                function showEmail() {\n");
      out.write("                                    $.ajax({\n");
      out.write("                                        data: \"id=");
      out.print(a.getId());
      out.write("\",\n");
      out.write("                                        method: 'POST',\n");
      out.write("                                        url: \"getEmail\",\n");
      out.write("                                        beforeSend: function (xhr) {\n");
      out.write("                                            $('#em').html(\"<img src='img/ani.gif' />\");\n");
      out.write("                                        },\n");
      out.write("                                        success: function (data) {\n");
      out.write("                                            $('#em').html(data);\n");
      out.write("                                            $('#bt1').css({\"display\": \"none\"});\n");
      out.write("                                        }\n");
      out.write("                                    });\n");
      out.write("                                }\n");
      out.write("\n");
      out.write("                                function showContact() {\n");
      out.write("                                    $.ajax({\n");
      out.write("                                        data: \"id=");
      out.print(a.getId());
      out.write("\",\n");
      out.write("                                        method: 'POST',\n");
      out.write("                                        url: \"getContact\",\n");
      out.write("                                        beforeSend: function (xhr) {\n");
      out.write("                                            $('#con').html(\"<img src='img/ani.gif' />\");\n");
      out.write("                                        },\n");
      out.write("                                        success: function (data) {\n");
      out.write("                                            $('#con').html(data);\n");
      out.write("                                            $('#bt2').css({\"display\": \"none\"});\n");
      out.write("                                        }\n");
      out.write("                                    });\n");
      out.write("                                }\n");
      out.write("                            </script>\n");
      out.write("                            \n");
      out.write("                            <div class=\"col-sm-7 col-lg-7 col-md-7\" >\n");
      out.write("                                <div class=\"thumbnail\" >\n");
      out.write("                                    <img  src=\"images/");
      out.print(path);
      out.write("\" alt=\"\"/>\n");
      out.write("                                    <div class=\"caption\">\n");
      out.write("                                        <h4 class=\"pull-right\">Rs.");
      out.print(a.getPrice());
      out.write("</h4>\n");
      out.write("                                        <h4>");
      out.print(a.getTitle());
      out.write("</a>\n");
      out.write("                                        </h4>\n");
      out.write("                                        <p style=\"line-break: auto; width: 340px; \">");
      out.print(a.getContent());
      out.write("</p>\n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"ratings\">\n");
      out.write("                                        <p class=\"pull-right\">");
      out.print(a.getViews());
      out.write(" views</p>\n");
      out.write("                                        <p class=\"color-gradient\">\n");
      out.write("                                        <h4>Call : ");
      out.print(a.getPhone());
      out.write("</h4>\n");
      out.write("                                        ");


                                            if (user != null && user.getId() == a.getUser().getId()) {
      out.write("\n");
      out.write("                                        <div class='btn btn-sm btn-warning' onclick=\"location.href = 'edit_ad.jsp?id=");
      out.print(a.getId());
      out.write("'\" >Edit</div>\n");
      out.write("                                        <form action=\"HideAd\" method=\"POST\">\n");
      out.write("                                            <input hidden=\"\" name=\"id\" value=\"");
      out.print(a.getId() );
      out.write("\"/>\n");
      out.write("                                            <button onclick=\"return confirm('Are you sure you want to remove this ad?')\" class=\"btn btn-sm btn-danger\" type=\"submit\">Delete Ad</button>\n");
      out.write("                                        </form>\n");
      out.write("                                        ");
}

                                        
      out.write("\n");
      out.write("\n");
      out.write("                                        </p>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("                            ");
}
      out.write("\n");
      out.write("                            \n");
      out.write("\n");
      out.write("                            <div class=\"row\">\n");
      out.write("                                <div class=\"col-xs-8 col-sm-5 col-md-5\">\n");
      out.write("                                    <div class=\"well well-sm\">\n");
      out.write("                                        <div class=\"row\">\n");
      out.write("                                            <div class=\"col-sm-4 col-md-3\">\n");
      out.write("                                                <img src=\"img/Profile_avatar_placeholder_large.png\" alt=\"\" class=\"img-rounded img-responsive\" />\n");
      out.write("                                            </div>\n");
      out.write("                                            \n");
      out.write("                                            <div class=\"col-sm-6 col-md-6\">\n");
      out.write("                                                ");

                                                    if (request.getSession().getAttribute("Login") != null) {
                                                
      out.write("\n");
      out.write("                                                <h4>\n");
      out.write("                                                    ");
      out.print(u.getUserName());
      out.write("</h4>\n");
      out.write("                                                    <p id=\"em\" style=\"font-size: 12px; line-break: loose;\">\n");
      out.write("                                                    <i class=\"glyphicon glyphicon-envelope\"></i>Email : XXXXXXXX</p><button type=\"button\" id=\"bt1\" class=\"btn btn-sm btn-success\" onclick=\"showEmail()\">Show Email</button>\n");
      out.write("                                                <br>\n");
      out.write("                                                <p id=\"con\">\n");
      out.write("                                                    <i class=\"glyphicon glyphicon-envelope\"></i>Phone : XXXXXXXX</p><button type=\"button\" id=\"bt2\" class=\"btn btn-sm btn-success\" onclick=\"showContact()\">Show Contact</button>\n");
      out.write("\n");
      out.write("                                                ");
} else {
      out.write("\n");
      out.write("                                                <h4>Please login to view user details</h4>\n");
      out.write("                                                ");
}
      out.write("\n");
      out.write("                                                <!-- Split button -->\n");
      out.write("\n");
      out.write("                                                <div onclick=\"location.href = 'my_ads.jsp?uid=");
      out.print(u.getId() );
      out.write("'\" class=\"btn btn-primary\">\n");
      out.write("                                                    More Ads\n");
      out.write("                                                </div>\n");
      out.write("\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("                            <div></div>\n");
      out.write("\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </section>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("        <div class=\"footer\">\n");
      out.write("            ");
      out.write('\n');


    


      out.write("\n");
      out.write("\n");
      out.write("<script>\n");
      out.write("    var d = Date();\n");
      out.write("    var s = d.toString().split(' ')[3];\n");
      out.write("</script>\n");
      out.write("<footer style=\"background: #666666; margin-bottom: 0px; clear: both;\">\n");
      out.write("    <div class=\"footer-wrapper\" style=\"margin-bottom: 0px;\">\n");
      out.write("        <div class=\"footer-top\" style=\"padding: 25px\">\n");
      out.write("        <table >\n");
      out.write("            <tr>\n");
      out.write("                <td><ul style=\"color:  #fff; text-decoration: none\">\n");
      out.write("                        <li><a style=\"color:  #fff;\" href=\"home.jsp\">Home</a></li>\n");
      out.write("                        <li><a style=\"color:  #fff;\"href=\"#\">About Us</a></li>\n");
      out.write("                        <li><a style=\"color:  #fff;\"href=\"#\">About Me</a></li>\n");
      out.write("                        <li><a style=\"color:  #fff;\"href=\"stock_photo.jsp\">Stock</a></li>\n");
      out.write("                        <li><a style=\"color:  #fff;\"href=\"cart.jsp\">Cart</a></li>\n");
      out.write("                    </ul>\n");
      out.write("                </td>\n");
      out.write("                <td><ul>\n");
      out.write("                        <li><a style=\"color:  #fff;\"href=\"signup.jsp\">Sign Up With Us</a></li>\n");
      out.write("                        <li><a style=\"color:  #fff;\"href=\"#\">Subscribe For News</a></li>\n");
      out.write("                        <li><a style=\"color:  #fff;\"href=\"#\">Email Us</a></li>\n");
      out.write("                        <li><a style=\"color:  #fff;\"href=\"#\">RSS</a></li>\n");
      out.write("                        <!--li><a href=\"phpFiles/logout.php\">Logout[]</a></li-->\n");
      out.write("                    </ul>\n");
      out.write("                </td>\n");
      out.write("                <td><ul>\n");
      out.write("                        <li><a style=\"color:  #fff;\"href=\"http://facebook.com/antrosoft\">Facebook</a></li>\n");
      out.write("                        <li><a style=\"color:  #fff;\"href=\"#\">Twitter</a></li>\n");
      out.write("                        <li><a style=\"color:  #fff;\"href=\"#\">Google Plus</a></li>\n");
      out.write("                        <li><a style=\"color:  #fff;\"href=\"#\">LinkedIn</a></li>\n");
      out.write("                        <li><a style=\"color:  #fff;\"href=\"#\">Blog</a></li>\n");
      out.write("                    </ul>\n");
      out.write("                </td>\n");
      out.write("                <td><ul>\n");
      out.write("                        <li><a style=\"color:  #fff;\" href=\"http://facebook.com/antrosoft\">Settings</a></li>\n");
      out.write("                        <!--<li><a href=\"profile.jsp\">Profile</a></li>-->\n");
      out.write("                        <li><a style=\"color:  #fff;\" href=\"#\">Contact Us</a></li>\n");
      out.write("                        <li><a style=\"color:  #fff;\" href=\"#\">Terms & Conditions</a></li>\n");
      out.write("                        <li>");

      out.write("</li>\n");
      out.write("                    </ul>\n");
      out.write("                </td>\n");
      out.write("            </tr>\n");
      out.write("        </table>\n");
      out.write("\n");
      out.write("    </div>\n");
      out.write("    \n");
      out.write("    </div>\n");
      out.write("<div class=\"footer-bottom\" style=\"padding: 25px; background: #333; color: #fff; margin-bottom: 0; width: 100%\">\n");
      out.write("\n");
      out.write("\n");
      out.write("        All rights reserved by KSI <label>2016 - </label><label><script>document.write(s)</script></label>\n");
      out.write("    </div>\n");
      out.write("</footer>");
      out.write("\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
