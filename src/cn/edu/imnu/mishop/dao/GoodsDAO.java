package cn.edu.imnu.mishop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import cn.edu.imnu.mishop.bean.Goods;
import cn.edu.imnu.mishop.util.DBUtil;

public class GoodsDAO {

	public int getrecordCount() {
		// TODO Auto-generated method stub
		int recordCount = 0;
		
		String sql = "SELECT COUNT(*) FROM tb_goods";
		
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet result = null;
		try {
			pstmt = conn.prepareStatement(sql);
			result = pstmt.executeQuery();
			
			if(result.next()) {
				recordCount = result.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(result, pstmt, conn);
		}
		
		return recordCount;
	}
	
	public List<Goods> getGoodsPageList(int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		int firstIndex = pageSize * (pageNo - 1);
		List<Goods> list = new ArrayList<Goods>();
		
		String sql = "SELECT * FROM tb_goods limit ?,?";
		
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet result = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, firstIndex);
			pstmt.setInt(2, pageSize);
			result = pstmt.executeQuery();
			
			while(result.next()) {
				Goods goods = new Goods();
				goods.setGoods_id(result.getInt("goods_id"));
				goods.setGoods_name(result.getString("goods_name"));
				goods.setGoods_price(result.getString("goods_price"));
				goods.setGoods_cover(result.getString("goods_cover"));
				list.add(goods);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(result, pstmt, conn);
		}
		
		return list;
	}
	public Goods getGoodsDetail(int goods_id){
		String sql = "SELECT * FROM tb_goods WHERE goods_id = ?";
		Goods goods = new Goods();
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet result = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, goods_id);
			result = pstmt.executeQuery();
			
			if(result.next()) {
				goods.setGoods_id(result.getInt("goods_id"));
				goods.setGoods_name(result.getString("goods_name"));
				goods.setGoods_price(result.getString("goods_price"));
				goods.setGoods_sale(result.getString("goods_sale"));
				goods.setGoods_cover(result.getString("goods_cover"));
				goods.setGoods_color(result.getString("goods_color"));
				goods.setGoods_size(result.getString("goods_size"));
				goods.setGoods_stock(result.getString("goods_stock"));
				goods.setGoods_weight(result.getString("goods_weight"));
				goods.setGoods_identifier(result.getString("goods_identifier"));
				goods.setGoods_listing(result.getString("goods_listing"));
				goods.setGoods_DisplayImages(result.getString("goods_displayImages"));
				goods.setGoods_productImages(result.getString("goods_productImages"));
				goods.setGoods_detailImages(result.getString("goods_detailImages"));
				goods.setGoods_sizeAndTyrImages(result.getString("goods_sizeAndTyrImages"));
				goods.setGoods_modelImages(result.getString("goods_modelImages"));
				goods.setGoods_questionImages(result.getString("goods_questionImages"));
				goods.setGoods_enlargeDisplayImages(result.getString("goods_enlargeDisplayImages"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(result, pstmt, conn);
		}
		return goods;
	}
	public List<Goods> getHotGoods(String search){
		List<Goods> list = new ArrayList<Goods>();
		String sql = "SELECT * FROM	tb_goods WHERE "
					+ "goods_typeid in (SELECT goodsType_id FROM tb_goodstype "
					+ "WHERE goodsType_name LIKE ?) ORDER BY goods_sale DESC LIMIT 0, 8;";
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet result = null;
		
		try {			
			pstmt = conn.prepareStatement(sql);
		
			pstmt.setString(1, "%" + search + "%");
			
			result = pstmt.executeQuery();
			
			while(result.next()) {
				Goods goods = new Goods();
				goods.setGoods_id(result.getInt("goods_id"));
				goods.setGoods_name(result.getString("goods_name"));
				goods.setGoods_price(result.getString("goods_price"));
				goods.setGoods_cover(result.getString("goods_cover"));
				list.add(goods);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(result, pstmt, conn);
		}
		return list;
	}
}
