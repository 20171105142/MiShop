package cn.edu.imnu.mishop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

import cn.edu.imnu.mishop.util.DBUtil;

	public class UsersDAO {
		public boolean isExistPhone(String phone) {
			// TODO Auto-generated method stub
			Connection conn = DBUtil.getConnection();
			PreparedStatement pstmt = null;
			ResultSet result = null;
			String sql = "SELECT * FROM tb_users where users_phone = ?";
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, phone);
				result = pstmt.executeQuery();
				if(result.next()) {
					return true;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				DBUtil.closeJDBC(result, pstmt, conn);
			}
			return false;
		}
	
		public void save(String phone, String password) {
			// TODO Auto-generated method stub
			Connection conn = DBUtil.getConnection();
			PreparedStatement pstmt = null;
			String sql = "INSERT into tb_users(users_phone,users_password,users_registerDate) values (?,?,?)";
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, phone);
				pstmt.setString(2, password);
				pstmt.setTimestamp(3, new Timestamp(new Date().getTime()));
				pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				DBUtil.closeJDBC(null, pstmt, conn);
			}
		}
		public void reset(String phone, String password) {
			// TODO Auto-generated method stub
			Connection conn = DBUtil.getConnection();
			PreparedStatement pstmt = null; 
			String sql = "update tb_users set users_password=? where users_phone=?";
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, password);
				pstmt.setString(2, phone);
				pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				DBUtil.closeJDBC(null, pstmt, conn);
			}
		}
	
		public int login(String phone, String password) {
			// TODO Auto-generated method stub
			Connection conn = DBUtil.getConnection();
			PreparedStatement pstmt = null;
			ResultSet result = null;
			int UserID = 0;
			String sql = "SELECT * FROM tb_users where users_phone = ? and users_password = ?";
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, phone);
				pstmt.setString(2, password);
				result = pstmt.executeQuery();
				if(result.next()) {
					UserID = result.getInt("users_id");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				DBUtil.closeJDBC(result, pstmt, conn);
			}
			return UserID;
		}
	}
