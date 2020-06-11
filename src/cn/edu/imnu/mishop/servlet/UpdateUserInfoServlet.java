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
 * Servlet implementation class UpdateUserInfoServlet
 */
@WebServlet("/UpdateUserInfoServlet")
public class UpdateUserInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		//UpdateUserInfoServlet
		//修改用户信息
		JSONObject object1 = new JSONObject();
		UsersDAO dao = new UsersDAO();
		PrintWriter out = response.getWriter();
		
		int users_id = Integer.parseInt(request.getParameter("userid"));
		String sex = request.getParameter("sex");
		String birthday = request.getParameter("birthday");
		object1.put("type", "update user infomation");
		int status = 0;
		status = dao.UpdateUserInfo(users_id, sex, birthday);
		System.out.println(status);
		if( status != 0) {
			object1.put("status", status);
		} else {
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
