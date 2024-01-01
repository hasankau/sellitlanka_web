package org.apache.jsp.includes;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import POJOS.User;

public final class menu_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

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
      response.setContentType("text/html");
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
