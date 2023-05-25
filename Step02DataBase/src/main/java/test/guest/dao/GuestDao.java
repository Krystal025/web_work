package test.guest.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import test.guest.dto.GuestDto;
import test.member.dto.MemberDto;
import test.util.DbcpBean;

public class GuestDao {
	
	private static GuestDao dao;
	//외부에서 객체를 생성하지 못하게 함  
	private GuestDao() {}
	
	//자신의 참조값을 리턴해주는 메소드 
	public static GuestDao getInstance() {
		if (dao == null) {
			dao = new GuestDao();
		}
		return dao;
	}
	
	//글을 수정하는 메소드
	public boolean update(GuestDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "UPDATE board_guest"
					+" SET writer=? content=?"
					+" WHERE num=?"
					+" AND pwd=?";
			pstmt = conn.prepareStatement(sql);
			// 실행할 sql문이 미완성이면 여기서 완성
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getNum());
			pstmt.setString(4, dto.getPwd());
			// sql문을 수행하고 변화된 (추가, 수정, 삭제된)row의 갯수 리턴받기
			rowCount = pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		// 만일 변화된 row 의 갯수가 0 보다 크면 작업 성공
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}	
	
	//글 하나의 정보를 반환하는 메소드
	public GuestDto getData(int num) {
		GuestDto dto = null;
		//필요한 객체의 참조값을 담을 지역변수 미리 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//DBCPBean 객체를 이용해서 Connection객체를 얻어온다 (Connection Pool에서 얻어오기)
			conn = new DbcpBean().getConn();
			//실행할 sql문
			String sql = "SELECT writer, content, regdate"
					+" FROM board_guest"
					+" WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			//sql문이 미완성이라면 여기서 완성
			pstmt.setInt(1, num);
			//SELECT문 수행하고 결과값 받아오기
			rs = pstmt.executeQuery();
			//반복문 돌면서 ResultSet에 담긴 내용 추출
			while (rs.next()) {
				//GuestDto 객체 생성해서 값을 ResultSet으로부터 얻어내서 담는다
				dto = new GuestDto();
				dto.setWriter(rs.getString("writer"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setNum(num);
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		//글 하나의 정보가 담긴 GuestDto 객체 리턴해주기
		return dto;
	}
	
	//글을 삭제하는 메소드
	public boolean delete(GuestDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "DELETE FROM board_guest"
					+" WHERE num=?"
					+" AND pwd=?";
			pstmt = conn.prepareStatement(sql);
			// 실행할 sql문이 미완성이면 여기서 완성
			pstmt.setInt(1, dto.getNum());
			pstmt.setString(2, dto.getPwd());
			// sql문을 수행하고 변화된 (추가, 수정, 삭제된)row의 갯수 리턴받기
			rowCount = pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		// 만일 변화된 row 의 갯수가 0 보다 크면 작업 성공
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	//글 내용을 입력받는 메소드
	public boolean insert(GuestDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "INSERT INTO board_guest"
					+ " (num, writer, content, pwd, regdate)"
					+ " VALUES(board_guest_seq.NEXTVAL, ?, ?, ?, SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			// 실행할 sql문이 미완성이면 여기서 완성
			pstmt.setString(1,  dto.getWriter());
			pstmt.setString(2,  dto.getContent());
			pstmt.setString(3,  dto.getPwd());
			// sql문을 수행하고 변화된 (추가, 수정, 삭제된)row의 갯수 리턴받기
			rowCount = pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		// 만일 변화된 row 의 갯수가 0 보다 크면 작업 성공
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}	
	
	//전체 글의 목록을 반환하는 메소드 
	public List<GuestDto> getList() {
		// 글목록을 담을 객체 미리 생성하기
		List<GuestDto> list = new ArrayList<>();
		// 필요한 객체의 참조값을 담을 지역변수 미리 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// DBCPBean 객체를 이용해서 Connection객체를 얻어온다 (Connection Pool에서 얻어오기)
			conn = new DbcpBean().getConn();
			// 실행할 sql문
			String sql = "SELECT num, writer, content, regdate" 
					+ " FROM board_guest" 
					+ " ORDER BY num ASC";
			pstmt = conn.prepareStatement(sql);
			// sql문이 미완성이라면 여기서 완성

			// SELECT문 수행하고 결과값 받아오기
			rs = pstmt.executeQuery();
			// 반복문 돌면서 ResultSet에 담긴 내용 추출
			while (rs.next()) {
				// ResultSet에 cursor가 위치한곳의 칼럼정보를 얻어와서 GuestDto 객체에 담고
				GuestDto dto = new GuestDto();
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				// ArrayList객체에 누적시키기
				list.add(dto);
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		// 회원목록이 담긴 ArrayList 객체 리턴해주기
		return list;
	}
}
