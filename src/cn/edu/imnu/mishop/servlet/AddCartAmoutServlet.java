package cn.edu.imnu.mishop.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSONObject;

import cn.edu.imnu.mishop.bean.Users;
import cn.edu.imnu.mishop.dao.CartDAO;
import cn.edu.imnu.mishop.dao.UsersDAO;

/**
 * Servlet implementation class AddCartAmoutServlet
 */
@WebServlet("/AddCartAmoutServlet")
public class AddCartAmoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCartAmoutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		JSONObject object1 = new JSONObject();
		CartDAO cart = new CartDAO();
		UsersDAO dao = new UsersDAO();
		PrintWriter out = response.getWriter();
		
		String type = request.getParameter("goodstype");
		int users_id = Integer.parseInt(request.getParameter("userid"));
		int goods_id = Integer.parseInt(request.getParameter("goodsid"));
		String goods_color = request.getParameter("goodscolor");
		String goods_size = request.getParameter("goodssize");
		int goods_amout = Integer.parseInt(request.getParameter("goodsamout"));
		HttpSession session = request.getSession();
		Users users = (Users)session.getAttribute("SESSION_USERS");
		int status = 0;
		int newAmout = goods_amout;
		if(type.equals("add")) {
			newAmout ++;
			status = cart.changeGoodsAmout(type, users_id, goods_id, goods_color, goods_size, newAmout);
		} else if (type.equals("sub")) {
			newAmout --;
			status = cart.changeGoodsAmout(type, users_id, goods_id, goods_color, goods_size, newAmout);
		} else if (type.equals("del")) {
			status = cart.delGoods(type, users_id, goods_id, goods_color, goods_size);
			int cartAmout = dao.cartAmout(users_id);
			users.setCartAmout(cartAmout);
		}
		session.setAttribute("SESSION_USERS", users);
		object1.put("mess", "change cart amout");
		
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
