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

}
