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

public class ListDBBean {
	private static ListDBBean instance = new ListDBBean();

	public static ListDBBean getInstance() {
		return instance;
	}

	private ListDBBean() {
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

	public String generateListCode(String id, int x) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		String listCode = null;

		try {
			conn = getConnection();

			sql = "select list_code from LIST where id=? order by list_code;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();
			if (x == 1) { // 이미 list가 존재
				String[] array = null;
				listCode = rs.getString("list_code");
				array = listCode.split("_");
				String code = Integer.toString(Integer
						.parseInt(array[array.length - 1]) + 1);
				listCode = id + "_" + code;
			} else { // list를 처음 만듬
				listCode = id + "_1";
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

		return listCode;
	}

	public void insertList(String id,String listCode, int bookCode) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;

		try {
			conn = getConnection();

			sql = "insert into LIST(id,list_code,book_code) values(?,?,?);";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, listCode);
			pstmt.setInt(3, bookCode);

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

	public int confirmListNum(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int x = -1;

		try {
			conn = getConnection();

			sql = "select list_code from LIST where id=?;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();
			if (rs.next()) { // 이미 list가 존재
				x = 1;
			} else { // list를 처음 만듬
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

	/*public int getListCode(int bookCode) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int listCode = 0;

		try {
			conn = getConnection();

			sql = "select * from LIST_BOOK where book_code=?;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bookCode);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				listCode = rs.getInt("list_code");
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
		return listCode;
	}*/

	/*
	 * public String nextFind(String str){ String array =
	 * "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z"; String arr[] =
	 * array.split(","); String result = null; int i =0; while (i<=arr.length){
	 * if (arr[i].equals(str)){ result = arr[i++]; } i++; } return result; }
	 */

	public List<ListDataBean> getListList(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		List<ListDataBean> lists = null;

		try {
			conn = getConnection();

			sql = "select * from LIST where id=? order by list_code;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();
			if (rs.next()) { // 이미 list가 존재
				lists = new ArrayList<ListDataBean>();

				do {
					ListDataBean list = new ListDataBean();
					list.setId(id);
					list.setListCode(rs.getString("list_code"));
					list.setBookCode(rs.getInt("book_code"));

					lists.add(list);
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

		return lists;
	}

}
