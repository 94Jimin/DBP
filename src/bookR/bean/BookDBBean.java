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

	public void insertBook(BookDataBean book) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = getConnection();
			String sql = "insert into BOOK(subject,writer,publisher,image,main_code,sub_code) values (?,?,?,?,?,?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, book.getSubject());
			pstmt.setString(2, book.getWriter());
			pstmt.setString(3, book.getPublisher());
			pstmt.setString(4, book.getImage());
			pstmt.setInt(5, book.getMainCode());
			pstmt.setInt(6, book.getSubCode());
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

	public int registedBookConfirm(int mainCode, int subCode, String subject,
			String writer) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = -1;

		try {
			conn = getConnection();

			String sql = "select subject from BOOK where main_code=? and sub_code=? and subject=? and writer=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mainCode);
			pstmt.setInt(2, subCode);
			pstmt.setString(3, subject);
			pstmt.setString(4, writer);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				x = 1; // 해당책이 이미 등록되어 있음
			} else {
				x = -1; // 해당 책이 이미 등록되어 있지 않음
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
		return x;
	}

	public BookDataBean[] getBooks(int main_code, int count) throws Exception { // 메인페이지에서
																				// 3개
																				// 책
																				// 가져가기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BookDataBean bookList[] = null;
		int i = 0;

		try {
			conn = getConnection();

			String sql = "select top(?) * from BOOK where main_code=? order by grade desc;";

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
					books.setImage(rs.getString("image"));
					books.setGrade(rs.getFloat("grade"));
					books.setMainCode(rs.getInt("main_code"));
					books.setSubCode(rs.getInt("sub_code"));

					bookList[i] = books;
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

	public BookDataBean getBook(int code) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BookDataBean book = null;

		try {
			conn = getConnection();

			String sql = "select  * from BOOK where code=?;";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, code);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				book = new BookDataBean();
				book.setCode(rs.getInt("code"));
				book.setSubject(rs.getString("subject"));
				book.setWriter(rs.getString("writer"));
				book.setPublisher(rs.getString("publisher"));
				book.setImage(rs.getString("image"));
				book.setGrade(rs.getFloat("grade"));
				book.setMainCode(rs.getInt("main_code"));
				book.setSubCode(rs.getInt("sub_code"));

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
		return book;
	}

	public int getBookCode(String subject) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int code = -1;

		try {
			conn = getConnection();

			String sql = "select top(1) * from BOOK where subject=? order by code desc;";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, subject);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				code = rs.getInt("code");
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
		return code;
	}

	/*
	 * public String getBookSubject(int code) throws Exception { Connection conn
	 * = null; PreparedStatement pstmt = null; ResultSet rs = null; String
	 * subject = null;
	 * 
	 * try { conn = getConnection();
	 * 
	 * String sql = "select subject from BOOK where code=?;";
	 * 
	 * pstmt = conn.prepareStatement(sql); pstmt.setInt(1, code); rs =
	 * pstmt.executeQuery();
	 * 
	 * if (rs.next()) { subject = rs.getString("subject"); } } catch (Exception
	 * e) { e.printStackTrace(); } finally { if (rs != null) try { rs.close(); }
	 * catch (SQLException ex) { } if (pstmt != null) try { pstmt.close(); }
	 * catch (SQLException ex) { } if (conn != null) try { conn.close(); } catch
	 * (SQLException ex) { } } return subject; }
	 */

	public BookDataBean getBookInfo(int code) throws Exception { // 책 info 페이지에서
																	// 사용
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BookDataBean book = null;

		try {
			conn = getConnection();

			String sql = "select * from BOOK where code=?;";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, code);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				book = new BookDataBean();

				book.setCode(rs.getInt("code"));
				book.setSubject(rs.getString("subject"));
				book.setWriter(rs.getString("writer"));
				book.setPublisher(rs.getString("publisher"));
				book.setImage(rs.getString("image"));
				book.setGrade(rs.getFloat("grade"));
				book.setMainCode(rs.getInt("main_code"));
				book.setSubCode(rs.getInt("sub_code"));
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
		return book;
	}

	public List<BookDataBean> getMyListBook(List<ListDataBean> lists) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		List<BookDataBean> books = null;

		try {
			conn = getConnection();

			books = new ArrayList<BookDataBean>();
			if (lists == null) {

			} else {
				for (ListDataBean list : lists) {
					sql = "select * from BOOK where code=?;";

					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, list.getBookCode());
					rs = pstmt.executeQuery();

					if (rs.next()) {
						BookDataBean book = new BookDataBean();

						book.setCode(rs.getInt("code"));
						book.setSubject(rs.getString("subject"));
						book.setWriter(rs.getString("writer"));
						book.setPublisher(rs.getString("publisher"));
						book.setImage(rs.getString("image"));
						book.setGrade(rs.getFloat("grade"));
						book.setMainCode(rs.getInt("main_code"));
						book.setSubCode(rs.getInt("sub_code"));

						books.add(book);
					}

				}
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
		return books;
	}

	public void updateCount(int code, int count) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = getConnection();
			String sql = "update BOOK set count=? where code=?;";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, count);
			pstmt.setInt(2, code);
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

	public void updateGrade(int code, float grade) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = getConnection();
			String sql = "update BOOK set grade=? where code=?;";

			pstmt = conn.prepareStatement(sql);
			pstmt.setFloat(1, grade);
			pstmt.setInt(2, code);
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

	public void updateGrade(int code, int grade) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;

		try {
			conn = getConnection();

			sql = "select count,grade from BOOK where code=?;";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, code);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				float beforeGsrade = rs.getFloat("grade");
				System.out.println(beforeGsrade);
				int count = rs.getInt("count");
				float resultGrade = 0.0f;

				updateCount(code, count + 1);
				resultGrade = ((beforeGsrade*count) + grade) / (count + 1);

				System.out.println(resultGrade);

				updateGrade(code, resultGrade);

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
	}

}
