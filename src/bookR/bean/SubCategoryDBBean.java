package bookR.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class SubCategoryDBBean {
	private static SubCategoryDBBean instance = new SubCategoryDBBean();

	public static SubCategoryDBBean getInstance() {
		return instance;
	}

	private SubCategoryDBBean() {
	}

	private Connection getConnection() throws Exception {
		DataSource ds = null;
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			ds = (DataSource) envCtx.lookup("jdbc/mssql");
		} catch (NamingException e) {
			e.printStackTrace();
		}
		return ds.getConnection();
	}
	
	public List<SubCategoryDataBean> getSubCategoryList(int main_code) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<SubCategoryDataBean> subList = null;

		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("select * from SUB_CATEGORY where main_code=?");
			pstmt.setInt(1, main_code);
			rs = pstmt.executeQuery();
			if (rs.next()){
				subList = new ArrayList<SubCategoryDataBean>();
				do {
					SubCategoryDataBean category = new SubCategoryDataBean();
					
					category.setCode(rs.getInt("code"));
					category.setName(rs.getString("name"));
					category.setMain_code(rs.getInt("main_code"));
					
					subList.add(category);
				} while(rs.next());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		
		return subList;
	}
}