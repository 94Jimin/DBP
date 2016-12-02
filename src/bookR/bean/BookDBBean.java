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

public class BookDBBean {
	private static BookDBBean instance = new BookDBBean();

	public static BookDBBean getInstance() {
		return instance;
	}

	private BookDBBean() {
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

	public List<BookDataBean> getTop3Book(int main_code) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<BookDataBean> bookList = null;

		try {
			conn = getConnection();

			pstmt = conn
					.prepareStatement("select top(3) * from BOOK where main_code=?;");
			pstmt.setInt(1, main_code);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				bookList = new ArrayList<BookDataBean>();

				do {
					BookDataBean books = new BookDataBean();

					books.setCode(rs.getInt("code"));
					books.setSubject(rs.getString("subject"));

					bookList.add(books);
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

		return bookList;
	}

	public BookDataBean[] getBooks(int main_code, int count) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BookDataBean bookList[] = null;
		int i=0;

		try {
			conn = getConnection();

			String sql = "select top(?) * from BOOK where main_code=?;";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, count);
			pstmt.setInt(2, main_code);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				bookList = new BookDataBean[count];

				do {
					BookDataBean books = new BookDataBean();

					books.setCode(rs.getInt("code"));
					books.setSubject(rs.getString("subject"));
					books.setWriter(rs.getString("writer"));
					books.setPublisher(rs.getString("publisher"));
					books.setMain_code(rs.getInt("main_code"));
					books.setSub_code(rs.getInt("sub_code"));

					bookList[i]=books;
					i++;
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
		return bookList;
	}
	
}
