package bookR.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import work.crypt.BCrypt;
import work.crypt.SHA256;
import bookR.bean.LogonDBBean;
import bookR.bean.LogonDataBean;

public class LogonDBBean {
	private static LogonDBBean instance = new LogonDBBean();

	public static LogonDBBean getInstance() {
		return instance;
	}

	private LogonDBBean() {
	}

	private Connection getConnection() throws Exception {
		DataSource ds = null;
		try{
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			ds = (DataSource) envCtx.lookup("jdbc/mssql");
		} catch(NamingException e) {
			e.printStackTrace();
		}
		return ds.getConnection();
	}

	public void insertMember(LogonDataBean member) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;

		SHA256 sha = SHA256.getInsatnce();
		try {
			conn = getConnection();

			String orgPass = member.getPasswd();
			String shaPass = sha.getSha256(orgPass.getBytes());
			String bcPass = BCrypt.hashpw(shaPass, BCrypt.gensalt());

			pstmt = conn
					.prepareStatement("insert into MEMBER values(?,?,?,getdate(),?,?);");
			pstmt.setString(1, member.getId());
			pstmt.setString(2, bcPass);
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getGender());
			pstmt.setString(5, member.getFavorite());
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

	public int userCheck(String id, String passwd) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = -1;

		SHA256 sha = SHA256.getInsatnce();
		try {
			conn = getConnection();

			String orgPass = passwd;
			String shaPass = sha.getSha256(orgPass.getBytes());

			pstmt = conn
					.prepareStatement("select passwd from member where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {// �빐�떦 �븘�씠�뵒媛� �엳�쑝硫� �닔�뻾
				String dbpasswd = rs.getString("passwd");
				if (BCrypt.checkpw(shaPass, dbpasswd))
					x = 1; // �씤利앹꽦怨�
				else
					x = 0; // 鍮꾨�踰덊샇 ��由�
			} else
				// �븘�씠�뵒媛� �뾾�쑝硫� �닔�뻾
				x = -1;// �븘�씠�뵒 �뾾�쓬

		} catch (Exception ex) {
			ex.printStackTrace();
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
		return x;
	}

	public int confirmId(String id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = -1;

		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("select id from MEMBER where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next())
				x = 1;
			else
				x = -1;
		} catch (Exception ex) {
			ex.printStackTrace();
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
		return x;
	}

}
