package cn.edu.imnu.mishop.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.imnu.mishop.bean.Goods;
import cn.edu.imnu.mishop.dao.GoodsDAO;

/**
 * Servlet implementation class GoodsDetailServlet
 */
@WebServlet("/GoodsDetailServlet")
public class GoodsDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoodsDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		int goods_id = Integer.valueOf((request.getParameter("goods_id"))).intValue();
		GoodsDAO dao = new GoodsDAO();
		Goods goods = dao.getGoodsDetail(goods_id);
		request.setAttribute("goodsDeatil", goods);
		request.getRequestDispatcher("item_show.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
