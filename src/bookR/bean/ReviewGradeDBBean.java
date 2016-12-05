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

public class ReviewGradeDBBean {
	private static ReviewGradeDBBean instance = new ReviewGradeDBBean();

	public static ReviewGradeDBBean getInstance() {
		return instance;
	}

	private ReviewGradeDBBean() {
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

	public int confirmRG(String id, int bookCode) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int x = 0;

		try {
			conn = getConnection();

			sql = "select * from REVIEW_GRADE where id=? and book_code=?;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, bookCode);

			rs = pstmt.executeQuery();
			if (rs.next()) { // grade만 존재
				x = 1;
			} else { // 후기가 아예 존재하지 않음
				x = -1;
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

	public void insertRG(String id, int bookCode, String review, int grade) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;

		try {
			conn = getConnection();

			sql = "insert into REVIEW_GRADE values(?,?,?,?);";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, bookCode);
			pstmt.setString(3, review);
			pstmt.setInt(4, grade);

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

	public void updateRG(String id, int bookCode, String review, int grade) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;

		try {
			conn = getConnection();

			sql = "update REVIEW_GRADE set review=?,grade=? where id=? and book_code=?;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, review);
			pstmt.setInt(2, grade);
			pstmt.setString(3, id);
			pstmt.setInt(4, bookCode);

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

	public List<ReviewGradeDataBean> getRG(int bookCode) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		List<ReviewGradeDataBean> rgLists = null;

		try {
			conn = getConnection();

			sql = "select * from REVIEW_GRADE where book_code=?;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bookCode);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				rgLists = new ArrayList<ReviewGradeDataBean>();

				do {
					if (rs.getString("review").equals("")) {
						continue;
					}
					ReviewGradeDataBean list = new ReviewGradeDataBean();

					list.setId(rs.getString("id"));
					list.setBook_code(rs.getInt("book_code"));
					list.setReview(rs.getString("review"));
					list.setGrade(rs.getInt("grade"));

					rgLists.add(list);
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
		return rgLists;
	}

	public int getGrade(String id, int bookCode) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int grade = 0;

		try {
			conn = getConnection();

			sql = "select * from REVIEW_GRADE where book_code=? and id=?;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bookCode);
			pstmt.setString(2, id);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				grade = rs.getInt("grade");
				//System.out.println(grade);
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
		return grade;
	}
	
	public String getReview(String id, int bookCode) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		String review = null;

		try {
			conn = getConnection();

			sql = "select * from REVIEW_GRADE where book_code=? and id=?;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bookCode);
			pstmt.setString(2, id);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				review = rs.getString("review");
				//System.out.println(grade);
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
		return review;
	}

}
