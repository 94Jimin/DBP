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

public class KeywordInfoDBBean {
	private static KeywordInfoDBBean instance = new KeywordInfoDBBean();

	public static KeywordInfoDBBean getInstance() {
		return instance;
	}

	private KeywordInfoDBBean() {
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

	public void insertKeywordInfo(KeywordInfoDataBean keywordInfo)
			throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = getConnection();
			String sql = "insert into KEYWORD_INFO(group_code,name,sub_code) values (?,?,?)";

			pstmt = conn.prepareStatement(sql);
			// pstmt.setInt(1, keywordInfo.getCode());
			pstmt.setInt(1, keywordInfo.getGroupCode());
			pstmt.setString(2, keywordInfo.getName());
			pstmt.setInt(3, keywordInfo.getSubCode());
			pstmt.executeUpdate();

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
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
	}

	public List<KeywordInfoDataBean> getGroupKeyword(int groupCode, int subCode) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<KeywordInfoDataBean> keywordInfos = null;

		try {
			conn = getConnection();
			String sql = "select * from KEYWORD_INFO where group_code=? and sub_code=? order by name;";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, groupCode);
			pstmt.setInt(2, subCode);
			rs = pstmt.executeQuery();
			
			if (rs.next()){
				keywordInfos = new ArrayList<KeywordInfoDataBean>();
				do{
					KeywordInfoDataBean keywordInfo = new KeywordInfoDataBean();
					keywordInfo.setCode(rs.getInt("code"));
					keywordInfo.setGroupCode(rs.getInt("group_code"));
					keywordInfo.setName(rs.getString("name"));
					keywordInfo.setSubCode(rs.getInt("sub_code"));
					
					keywordInfos.add(keywordInfo);
				} while(rs.next());
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
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
		return keywordInfos;
	}
}
