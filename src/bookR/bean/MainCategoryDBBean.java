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

public class MainCategoryDBBean {
	private static MainCategoryDBBean instance = new MainCategoryDBBean();

	public static MainCategoryDBBean getInstance() {
		return instance;
	}

	private MainCategoryDBBean() {
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

	public List<MainCategoryDataBean> getMainCategoryList() throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<MainCategoryDataBean> mainList = null;

		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("select * from MAIN_CATEGORY");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				mainList = new ArrayList<MainCategoryDataBean>();
				do {
					MainCategoryDataBean category = new MainCategoryDataBean();

					category.setCode(rs.getInt("code"));
					category.setName(rs.getString("name"));

					mainList.add(category);
				} while (rs.next());
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

		return mainList;
	}

	public MainCategoryDataBean getMainCategory(int code) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MainCategoryDataBean mainCategory = null;

		try {
			conn = getConnection();

			pstmt = conn
					.prepareStatement("select * from MAIN_CATEGORY where code=?;");
			pstmt.setInt(1, code);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				mainCategory = new MainCategoryDataBean();

				mainCategory.setCode(rs.getInt("code"));
				mainCategory.setName(rs.getString("name"));
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

		return mainCategory;
	}
}
