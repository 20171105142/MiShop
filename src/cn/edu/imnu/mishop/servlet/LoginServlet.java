package cn.edu.imnu.mishop.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSONObject;

import cn.edu.imnu.mishop.bean.Users;
import cn.edu.imnu.mishop.dao.UsersDAO;


/**
 * Servlet implementation clasUsers.javas LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out = response.getWriter();
		JSONObject object1 = new JSONObject();
		
		String phone = request.getParameter("phone");
		String password = request.getParameter("password");
		String remeberMe = request.getParameter("remeberMe");
		
		UsersDAO dao = new UsersDAO();
		int UserID = dao.login(phone, password);
		
		HttpSession session = request.getSession();
		
		object1.put("type", "login");
		if(UserID!=0) {
			Users users = new Users(phone,password);
			session.setAttribute("SESSION_USERS", users);
			session.setMaxInactiveInterval(60);
			remeberMe(remeberMe, phone, password, request, response);
			object1.put("status", "1");
		} else {
			object1.put("status", "0");
		}
		out.write(object1.toJSONString());
	}
	private void remeberMe(String remeberMe, String usersname, String password, HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		if("true".equals(remeberMe)) {
			Cookie cookie = new Cookie("COKKIE_USERSPHONE",usersname);
			cookie.setPath("/");
			cookie.setMaxAge(60*60*24*30);
			response.addCookie(cookie);
			
			cookie = new Cookie("COKKIE_USERSPWD",password);
			cookie.setPath("/");
			cookie.setMaxAge(60*60*24*30);
			response.addCookie(cookie);
		} else {
			Cookie[] cookies = request.getCookies();
			if(cookies != null) {
				for(Cookie cookie:cookies) {
					if("COKKIE_USERSPHONE".equals(cookie.getName()) 
							|| "COKKIE_USERSPWD".equals(cookie.getName())) {
						cookie.setMaxAge(0);
						cookie.setPath("/");
						response.addCookie(cookie);
					}
				}
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
