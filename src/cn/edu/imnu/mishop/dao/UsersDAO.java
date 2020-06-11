package cn.edu.imnu.mishop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import cn.edu.imnu.mishop.bean.Goods;
import cn.edu.imnu.mishop.bean.Users;
import cn.edu.imnu.mishop.util.DBUtil;

	public class UsersDAO {
		public boolean isExistPhone(String phone) {
			// TODO Auto-generated method stub
			//判断注册手机号是否被注册
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
			//存储注册手机号和密码
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
			//验证用户手机号和密码
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

		public int cartAmout(int userID) {
			// TODO Auto-generated method stub
			Connection conn = DBUtil.getConnection();
			PreparedStatement pstmt = null;
			ResultSet result = null;
			String sql = "SELECT COUNT(*) FROM tb_carts WHERE carts_userid = ?";
			int cartAmout = 0;
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, userID);
				result = pstmt.executeQuery();
				if(result.next()) {
					cartAmout = result.getInt(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				DBUtil.closeJDBC(result, pstmt, conn);
			}
			return cartAmout;
		}

		public int UpdateUserInfo(int users_id, String sex, String birthday) {
			// TODO Auto-generated method stub
			//UsersDAO
			Connection conn = DBUtil.getConnection();
			PreparedStatement pstmt = null;
			ResultSet result = null;
			String sql = "UPDATE tb_users SET users_sex = ?, users_birthday = ? WHERE users_id = ?";
			int status = 0;
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, sex);
				pstmt.setString(2, birthday);
				pstmt.setInt(3, users_id);
				status = pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				DBUtil.closeJDBC(result, pstmt, conn);
			}
			return status;
		}
		public Users getUserInfo(int users_id){
			String sql = "SELECT * FROM	tb_users WHERE users_id = ?;";
			Connection conn = DBUtil.getConnection();
			PreparedStatement pstmt = null;
			ResultSet result = null;
			Users users = new Users();
			try {			
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, users_id);
				result = pstmt.executeQuery();
				if(result.next()) {
					users.setUsers_sex(result.getString("users_sex"));
					users.setUsers_birthday(result.getString("users_birthday"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				DBUtil.closeJDBC(result, pstmt, conn);
			}
			return users;
		}
}
