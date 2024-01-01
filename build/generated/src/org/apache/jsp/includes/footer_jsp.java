package org.apache.jsp.includes;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class footer_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write('\n');


    


      out.write("\n");
      out.write("\n");
      out.write("<script>\n");
      out.write("    var d = Date();\n");
      out.write("    var s = d.toString().split(' ')[3];\n");
      out.write("</script>\n");
      out.write("<footer style=\"background: #666666; margin-bottom: 0px; clear: both;\">\n");
      out.write("    <div class=\"footer-wrapper\" style=\"margin-bottom: 0px;\">\n");
      out.write("        <div class=\"footer-top\">\n");
      out.write("        <table >\n");
      out.write("            <tr>\n");
      out.write("                <td><ul style=\"color: #fff\">\n");
      out.write("                        <li><a href=\"home.jsp\">Home</a></li>\n");
      out.write("                        <li><a href=\"#\">About Us</a></li>\n");
      out.write("                        <li><a href=\"#\">About Me</a></li>\n");
      out.write("                        <li><a href=\"stock_photo.jsp\">Stock</a></li>\n");
      out.write("                        <li><a href=\"cart.jsp\">Cart</a></li>\n");
      out.write("                    </ul>\n");
      out.write("                </td>\n");
      out.write("                <td><ul>\n");
      out.write("                        <li><a href=\"signup.jsp\">Sign Up With Us</a></li>\n");
      out.write("                        <li><a href=\"#\">Subscribe For News</a></li>\n");
      out.write("                        <li><a href=\"#\">Email Us</a></li>\n");
      out.write("                        <li><a href=\"#\">RSS</a></li>\n");
      out.write("                        <!--li><a href=\"phpFiles/logout.php\">Logout[]</a></li-->\n");
      out.write("                    </ul>\n");
      out.write("                </td>\n");
      out.write("                <td><ul>\n");
      out.write("                        <li><a href=\"http://facebook.com/antrosoft\">Facebook</a></li>\n");
      out.write("                        <li><a href=\"#\">Twitter</a></li>\n");
      out.write("                        <li><a href=\"#\">Google Plus</a></li>\n");
      out.write("                        <li><a href=\"#\">LinkedIn</a></li>\n");
      out.write("                        <li><a href=\"#\">Blog</a></li>\n");
      out.write("                    </ul>\n");
      out.write("                </td>\n");
      out.write("                <td><ul>\n");
      out.write("                        <li><a href=\"http://facebook.com/antrosoft\">Settings</a></li>\n");
      out.write("                        <!--<li><a href=\"profile.jsp\">Profile</a></li>-->\n");
      out.write("                        <li><a href=\"#\">Contact Us</a></li>\n");
      out.write("                        <li><a href=\"#\">Terms & Conditions</a></li>\n");
      out.write("                        <li>");

      out.write("</li>\n");
      out.write("                    </ul>\n");
      out.write("                </td>\n");
      out.write("            </tr>\n");
      out.write("        </table>\n");
      out.write("\n");
      out.write("    </div>\n");
      out.write("    <div class=\"footer-bottom\" style=\"background: #009999; color: #fff; margin-bottom: 0; width: 100%\">\n");
      out.write("\n");
      out.write("\n");
      out.write("        All rights reserved by KSI <label>2016 - </label><label><script>document.write(s)</script></label>\n");
      out.write("    </div>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("</footer>");
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
