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
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		String phone = request.getParameter("phone");
		String password = request.getParameter("password");
		
		PrintWriter out = response.getWriter();
		JSONObject object1 = new JSONObject();
		
		UsersDAO dao = new UsersDAO();
		boolean flag = dao.isExistPhone(phone);
		object1.put("type", "register");
		if (flag) {
//			out.print("<script type='text/javascript'>");
//			out.print("alert('此用户名已被注册');");
//			out.print("window.location='login.jsp?p=register';");
//			out.print("</script>");
			object1.put("status", "0");
		} else {
			dao.save(phone,password);
//			out.print("<script type='text/javascript'>");
//			out.print("alert('注册成功');");
//			out.print("window.location='login.jsp';");
//			out.print("</script>");
			object1.put("status", "1");
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
