package com.handle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.modobj.User;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login.do")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String uid = request.getParameter("uid");
		String upwd = request.getParameter("upwd");
	
		if(User.check(request, uid, upwd)) {
			Cookie cookie_id = new Cookie("id",uid);
			Cookie cookie_ident = new Cookie("ident",upwd);
			cookie_id.setMaxAge(60*60*24*365);
			cookie_ident.setMaxAge(60*60*24*365);
			cookie_id.setPath("/");
			cookie_ident.setPath("/");
			response.addCookie(cookie_id);
			response.addCookie(cookie_ident);
			response.sendRedirect("index.jsp");
		}
		else
			out.write("<script type=\"text/javascript\">alert('登录失败，没有此用户或密码错误');window.history.back();</script>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}