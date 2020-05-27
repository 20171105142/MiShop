package cn.edu.imnu.mishop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.edu.imnu.mishop.bean.Cart;
import cn.edu.imnu.mishop.util.DBUtil;

public class CartDAO {

	public int addCart(int users_id, int goods_id, String goods_color, String goods_size, int goods_amout) {
		// TODO Auto-generated method stub
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "INSERT into tb_carts(carts_userid, carts_goodsid, carts_goodscolor, carts_goodssize, carts_goodsamout) values (?,?,?,?,?)";
		int status = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, users_id);
			pstmt.setInt(2, goods_id);
			pstmt.setString(3, goods_color);
			pstmt.setString(4, goods_size);
			pstmt.setInt(5, goods_amout);
			status = pstmt.executeUpdate();
			if(status != 0) {
				return status;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(null, pstmt, conn);
		}
		return status;
	}

	public int isGoods(int users_id, int goods_id, String goods_color, String goods_size) {
		// TODO Auto-generated method stub
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet result = null;
		int amout = 0;
		
		String sql = "SELECT carts_goodsamout FROM tb_carts where carts_userid = ? "
				+ "and carts_goodsid = ? and carts_goodscolor = ? and carts_goodssize = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, users_id);
			pstmt.setInt(2, goods_id);
			pstmt.setString(3, goods_color);
			pstmt.setString(4, goods_size);
			result = pstmt.executeQuery();
			if(result.next()) {
				amout = result.getInt("carts_goodsamout");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(result, pstmt, conn);
		}
		return amout;
	}

	public int updateCart(int users_id, int goods_id, String goods_color, String goods_size, int goods_amout, int amout) {
		// TODO Auto-generated method stub
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "UPDATE tb_carts set carts_goodsamout=? where carts_userid=? and carts_goodsid=? and carts_goodscolor=? and carts_goodssize=?;";
		int status = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, goods_amout + amout);
			pstmt.setInt(2, users_id);
			pstmt.setInt(3, goods_id);
			pstmt.setString(4, goods_color);
			pstmt.setString(5, goods_size);
			status = pstmt.executeUpdate();
			if(status != 0) {
				return status;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(null, pstmt, conn);
		}
		return status;
	}
	
	public List<Cart> getCartGoods(int users_id) {
		// TODO Auto-generated method stub
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		List<Cart> list = new ArrayList<Cart>();
		ResultSet result = null;
		String sql = "SELECT carts_goodsid, goods_name, goods_cover, carts_goodscolor, goods_price,"
				+ "carts_goodssize, carts_goodsamout FROM tb_carts,tb_goods WHERE "
				+ "carts_userid = ? AND goods_id = carts_goodsid";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, users_id);
			result = pstmt.executeQuery();
			while(result.next()) {
				Cart cart = new Cart();
				cart.setGoods_id(result.getInt("carts_goodsid"));;
				cart.setGoods_name(result.getString("goods_name"));
				cart.setGoods_cover(result.getString("goods_cover"));
				cart.setGoods_price(result.getDouble("goods_price"));
				cart.setGoods_color(result.getString("carts_goodscolor"));
				cart.setGoods_size(result.getString("carts_goodssize"));
				cart.setGoods_amout(result.getInt("carts_goodsamout"));;
				list.add(cart);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(null, pstmt, conn);
		}
		return list;
	}
}
