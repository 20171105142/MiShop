package cn.edu.imnu.mishop.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;

import cn.edu.imnu.mishop.dao.UsersDAO;


/**
 * Servlet implementation class LoginServlet
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

		UsersDAO dao = new UsersDAO();
		int UserID = dao.login(phone,password);
//		HttpSession session = request.getSession();
		object1.put("type", "login");
		if(UserID!=0) {
//			Applicant applicant = new Applicant(applicantID,email,password);
//			session.setAttribute("SESSION_APPLICANT", applicant);
//			response.sendRedirect("index.jsp");
			object1.put("status", "1");
			
		} else {
//			out.print("<script type='text/javascript'>");
//			out.print("alert('用户名或密码错误');");
//			out.print("window.location='login.jsp';");
//			out.print("</script>");
			object1.put("status", "0");
		}
		out.write(object1.toJSONString());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
