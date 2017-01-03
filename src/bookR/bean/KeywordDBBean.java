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

public class KeywordDBBean {
	private static KeywordDBBean instance = new KeywordDBBean();

	public static KeywordDBBean getInstance() {
		return instance;
	}

	private KeywordDBBean() {
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

	public void insertKeyword(int keywordCode, int bookCode) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = getConnection();
			String sql = "insert into KEYWORD(keyword_code,book_code) values (?,?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, keywordCode);
			pstmt.setInt(2, bookCode);
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

	public List<BookDataBean> getSearchResult(int keyword1, int keyword2,
			int keyword3) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<BookDataBean> books = null;
		//System.out.println(keyword1 + " " + keyword2 + " " + keyword3 + " ");

		try {
			conn = getConnection();
			String sql = "select distinct book_code from KEYWORD";
			if (keyword1 !=0 && keyword2 != 0 && keyword3 != 0) {
				sql += " where keyword_code=? or keyword_code=? or keyword_code=?;";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, keyword1);
				pstmt.setInt(2, keyword2);
				pstmt.setInt(3, keyword3);
			} else if (keyword1 !=0 && keyword2 != 0 && keyword3 == 0) {
				sql += " where keyword_code=? or keyword_code=?;";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, keyword1);
				pstmt.setInt(2, keyword2);
			} else if (keyword1 !=0 && keyword2 == 0 && keyword3 != 0) {
				sql += " where keyword_code=? or keyword_code=?;";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, keyword1);
				pstmt.setInt(2, keyword3);
			} else if (keyword1 !=0 && keyword2 == 0 && keyword3 == 0) {
				sql += " where keyword_code=?;";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, keyword1);
			} else if (keyword1 ==0 && keyword2 != 0 && keyword3 != 0) {
				sql += " where keyword_code=?;";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, keyword2);
				pstmt.setInt(2, keyword3);
			} else if (keyword1 ==0 && keyword2 != 0 && keyword3 == 0) {
				sql += " where keyword_code=?;";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, keyword2);
			} else if (keyword1 ==0 && keyword2 == 0 && keyword3 != 0) {
				sql += " where keyword_code=?;";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, keyword3);
			}
			//System.out.println(sql);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				books = new ArrayList<BookDataBean>();
				do {
					BookDataBean book = new BookDataBean();
					book.setCode(rs.getInt("book_code"));

					books.add(book);
				} while (rs.next());
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
		return books;
	}
}
