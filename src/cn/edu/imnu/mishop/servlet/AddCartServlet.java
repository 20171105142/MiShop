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
 * Servlet implementation class AddCartServlet
 */
@WebServlet("/AddCartServlet")
public class AddCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		//AddCartAmoutServlet
		//购物车商品添加
		JSONObject object1 = new JSONObject();
		CartDAO cart = new CartDAO();
		UsersDAO dao = new UsersDAO();
		PrintWriter out = response.getWriter();
		
		int users_id = Integer.parseInt(request.getParameter("userid"));
		int goods_id = Integer.parseInt(request.getParameter("goodsid"));
		String goods_color = request.getParameter("color");
		String goods_size = request.getParameter("size");
		int goods_amout = Integer.parseInt(request.getParameter("amount"));
		HttpSession session = request.getSession();
		Users users = (Users)session.getAttribute("SESSION_USERS");
		object1.put("type", "add cart goods");
		int status = 0;
		int amout = cart.isGoods(users_id, goods_id, goods_color, goods_size);
		if(amout == 0) {
			status = cart.addCart(users_id, goods_id, goods_color, goods_size, goods_amout);
			int cartAmout = dao.cartAmout(users_id);
			users.setCartAmout(cartAmout);
		} else {
			int cartAmout = dao.cartAmout(users_id);
			users.setCartAmout(cartAmout);
			status = cart.updateCart(users_id, goods_id, goods_color, goods_size, goods_amout, amout);
		}
		session.setAttribute("SESSION_USERS", users);
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
