/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.69
 * Generated at: 2023-02-07 05:50:48 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.join;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class join_005fmain_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/WEB-INF/views/join/../includes/footer.jsp", Long.valueOf(1675659477205L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("<style>\r\n");
      out.write("	.join_main{\r\n");
      out.write("		font-family: NanumSquareNeo;\r\n");
      out.write("	}\r\n");
      out.write("	\r\n");
      out.write("	\r\n");
      out.write("	.join_main input{\r\n");
      out.write("		border-radius:20px;\r\n");
      out.write("		color:white;\r\n");
      out.write("		padding: 18px;\r\n");
      out.write("		margin-bottom:30px;\r\n");
      out.write("	    cursor: pointer;\r\n");
      out.write("	    border-radius: 4px;\r\n");
      out.write("	    -webkit-box-shadow: none !important;\r\n");
      out.write("	    box-shadow: none !important;\r\n");
      out.write("	    font-size: 15px;\r\n");
      out.write("	    text-transform: uppercase;\r\n");
      out.write("	    letter-spacing: 2px;\r\n");
      out.write("	    font-weight: 700;\r\n");
      out.write("	}\r\n");
      out.write("	\r\n");
      out.write("	.join_main #kbtn{\r\n");
      out.write("		background-color:#FFCD12;\r\n");
      out.write("		border-color:#FFCD12;\" \r\n");
      out.write("	}\r\n");
      out.write("	\r\n");
      out.write("	.join_main #ebtn{\r\n");
      out.write("		background-color:#CDBBA7;\r\n");
      out.write("		border-color:#CDBBA73;\r\n");
      out.write("	}\r\n");
      out.write("	\r\n");
      out.write("	.join_main .mb-4{\r\n");
      out.write("		text-align:center;\r\n");
      out.write("	}\r\n");
      out.write("	\r\n");
      out.write("	.join_main #already{\r\n");
      out.write("		text-align:center;\r\n");
      out.write("		margin-top:30px;\r\n");
      out.write("		font-weight: 700;\r\n");
      out.write("	}\r\n");
      out.write("	\r\n");
      out.write("	\r\n");
      out.write("\r\n");
      out.write("</style>    \r\n");
      out.write("    \r\n");
      out.write("    \r\n");
      out.write("    \r\n");
      out.write("<head>\r\n");
      out.write("    <title>애니모어 유기동물 보호센터</title>\r\n");
      out.write("    <meta charset=\"utf-8\">\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\r\n");
      out.write("    \r\n");
      out.write("    <link href=\"https://fonts.googleapis.com/css?family=Montserrat:200,300,400,500,600,700,800&display=swap\" rel=\"stylesheet\">\r\n");
      out.write("\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css\">\r\n");
      out.write(" \r\n");
      out.write("    <link rel=\"stylesheet\" href=\"../css/animate.css\">\r\n");
      out.write("    \r\n");
      out.write("    <link rel=\"stylesheet\" href=\"../css/owl.carousel.min.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"../css/owl.theme.default.min.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"../css/magnific-popup.css\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"../css/bootstrap-datepicker.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"../css/jquery.timepicker.css\">\r\n");
      out.write("\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"../css/flaticon.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"../css/style.css\">\r\n");
      out.write("    <link href=\"https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css\" rel=\"stylesheet\">\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<section class=\"ftco-section bg-light\">\r\n");
      out.write("	<div class=\"container\">\r\n");
      out.write("		<div class=\"join_main\">\r\n");
      out.write("			<div class=\"row\">\r\n");
      out.write("				<div class=\"col-md-12\">\r\n");
      out.write("					<div class=\"contact-wrap\" style=\"margin:0 auto; padding: 50px 200px; width:1000px\">\r\n");
      out.write("						<h3 class=\"mb-4\">회원 가입</h3>\r\n");
      out.write("						<p id=\"select\" style=\"text-align:center\">회원 가입 방식을 선택해주세요.</p>\r\n");
      out.write("						<div class=\"col-md-12\">\r\n");
      out.write("					        <a href=\"/join/join_terms\">\r\n");
      out.write("					        	<input type=\"button\" id=\"ebtn\" class=\"btn btn-default btn-block\" name=\"name\" value=\"이메일로 회원가입하기\" />\r\n");
      out.write("					        </a>\r\n");
      out.write("				        </div>\r\n");
      out.write("						<div class=\"col-md-12\">\r\n");
      out.write("				        	<input type=\"button\" id=\"kbtn\" class=\"btn btn-default btn-block\" name=\"name\" value=\"카카오 계정으로 회원가입하기\" />\r\n");
      out.write("				        </div>\r\n");
      out.write("				        <hr style=\"margin-bottom:20px;\">\r\n");
      out.write("				        <div class=\"col-md-12\">\r\n");
      out.write("							<div class=\"join_login\">\r\n");
      out.write("								<p id=\"already\">\r\n");
      out.write("									이미 계정이 있으신가요?<br/> \r\n");
      out.write("									<a href=\"/member/login\">로그인</a>\r\n");
      out.write("								</p>\r\n");
      out.write("							</div>\r\n");
      out.write("						</div>	\r\n");
      out.write("			    	</div>\r\n");
      out.write("				</div>\r\n");
      out.write("				\r\n");
      out.write("			</div>\r\n");
      out.write("		</div>\r\n");
      out.write("	</div>\r\n");
      out.write("</section>\r\n");
      out.write("\r\n");
      out.write("    \r\n");
      out.write("    \r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\"> \r\n");
      out.write("<body>\r\n");
      out.write("<footer class=\"footer\" style=\"font-family: 'NanumSquareNeo';\">\r\n");
      out.write("			<div class=\"container\">\r\n");
      out.write("				<div class=\"row\">\r\n");
      out.write("					<div class=\"col-md-6 col-lg-4 mb-6 mb-md-0\">\r\n");
      out.write("						<h2 class=\"footer-heading\">Anymore</h2>\r\n");
      out.write("						<p>우리 미래 세대에게 진정한 가치 사회를 이어주고 동물들이 웃을 수 있는 사회가 되기 위해 애니모어가 최선의 노력을 하겠습니다. 애니모어에 지속적인 관심과 격려로 함께 해주세요.</p>\r\n");
      out.write("						<br/>\r\n");
      out.write("			<ul class=\"ftco-footer-social p-0\">\r\n");
      out.write("              <li class=\"ftco-animate\"><a href=\"https://www.facebook.com/\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"Facebook\"><span class=\"fa fa-facebook\"></span></a></li>\r\n");
      out.write("              <li class=\"ftco-animate\"><a href=\"https://twitter.com/?lang=ko\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"Twitter\"><span class=\"fa fa-twitter\"></span></a></li>\r\n");
      out.write("              <li class=\"ftco-animate\"><a href=\"https://www.instagram.com/\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"Instagram\"><span class=\"fa fa-instagram\"></span></a></li>\r\n");
      out.write("            </ul>\r\n");
      out.write("					</div>\r\n");
      out.write("					<div class=\"col-md-6 col-lg-4 mb-6 mb-md-0\">\r\n");
      out.write("						<h2 class=\"footer-heading\">Have a Questions?</h2>\r\n");
      out.write("						<div class=\"block-23 mb-3\">\r\n");
      out.write("              <ul>\r\n");
      out.write("                <li><span class=\"icon fa fa-map\"></span><span class=\"text\">서울특별시 성동구 행당로 17길 1-77</span></li>\r\n");
      out.write("                <li><span class=\"icon fa fa-phone\"></span><span class=\"text\">02-2292-6337<br>(평일 09:00~12:00, 13:00~18:00)</span></li>\r\n");
      out.write("                <li><span class=\"icon fa fa-paper-plane\"></span><span class=\"text\">info@anymore.or.kr</span></li>\r\n");
      out.write("              </ul>\r\n");
      out.write("            </div>\r\n");
      out.write("					</div>\r\n");
      out.write("          <div class=\"col-md-6 col-lg-4 mb-6 mb-md-0\">\r\n");
      out.write("						<h2 class=\"footer-heading\">후원문의</h2>\r\n");
      out.write("						<p>후원금은 사지 않고 입양하는 문화를 만들어 가기 위한 활동에 사용됩니다.</p>\r\n");
      out.write("            <a href=\"/about/support\">바로가기</a>\r\n");
      out.write("					</div>\r\n");
      out.write("				</div>\r\n");
      out.write("				<div class=\"row mt-5\">\r\n");
      out.write("          <div class=\"col-md-12 text-center\">\r\n");
      out.write("\r\n");
      out.write("            <p class=\"copyright\"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->\r\n");
      out.write("  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class=\"fa fa-heart\" aria-hidden=\"true\"></i> by <a href=\"https://colorlib.com\" target=\"_blank\">Colorlib.com</a>\r\n");
      out.write("  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>\r\n");
      out.write("          </div>\r\n");
      out.write("        </div>\r\n");
      out.write("			</div>\r\n");
      out.write("		</footer>\r\n");
      out.write("	\r\n");
      out.write("	<script src=\"../js/jquery.min.js\"></script>\r\n");
      out.write("  <script src=\"../js/jquery-migrate-3.0.1.min.js\"></script>\r\n");
      out.write("  <script src=\"../js/popper.min.js\"></script>\r\n");
      out.write("  <script src=\"../js/bootstrap.min.js\"></script>\r\n");
      out.write("  <script src=\"../js/jquery.easing.1.3.js\"></script>\r\n");
      out.write("  <script src=\"../js/jquery.waypoints.min.js\"></script>\r\n");
      out.write("  <script src=\"../js/jquery.stellar.min.js\"></script>\r\n");
      out.write("  <script src=\"../js/jquery.animateNumber.min.js\"></script>\r\n");
      out.write("  <script src=\"../js/bootstrap-datepicker.js\"></script>\r\n");
      out.write("  <script src=\"../js/jquery.timepicker.min.js\"></script>\r\n");
      out.write("  <script src=\"../js/owl.carousel.min.js\"></script>\r\n");
      out.write("  <script src=\"../js/jquery.magnific-popup.min.js\"></script>\r\n");
      out.write("  <script src=\"../js/scrollax.min.js\"></script>\r\n");
      out.write("  <script src=\"../js/main.js\"></script>\r\n");
      out.write("    \r\n");
      out.write(" \r\n");
      out.write("  </body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
