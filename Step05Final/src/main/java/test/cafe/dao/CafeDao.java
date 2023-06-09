package test.cafe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import test.cafe.dto.CafeDto;
import test.util.DbcpBean;

public class CafeDao {
	
	private static CafeDao dao;
	
	private CafeDao() {}
	
	public static CafeDao getInstance() {
		if(dao == null) {
			dao = new CafeDao();
		}
		return dao;
	}
	
	//전체 글의 갯수를 리턴해주는 메소드
	public int getCount() {
		int count = 0;
		//필요한 객체의 참조값을 담을 지역변수 미리 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//DBCPBean 객체를 이용해서 Connection객체를 얻어온다 (Connection Pool에서 얻어오기)
			conn = new DbcpBean().getConn();
			//실행할 sql문
			String sql = "SELECT MAX(ROWNUM)AS num FROM board_cafe";
			pstmt = conn.prepareStatement(sql);
			//sql문이 미완성이라면 여기서 완성

			//SELECT문 수행하고 결과값 받아오기
			rs = pstmt.executeQuery();
			//반복문 돌면서 ResultSet에 담긴 내용 추출
			while (rs.next()) {
				count = rs.getInt("num");
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
		return count;
	}
	
	//글 조회수 올리는 메소드 
	public boolean addViewCount(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "UPDATE board_cafe"
						+" SET viewCount=viewCount+1"
						+" WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			// 실행할 sql문이 미완성이면 여기서 완성
			pstmt.setInt(1, num);
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
	
	//글 목록보기 메소드
	public List<CafeDto> getList(CafeDto dto){
		List<CafeDto> list = new ArrayList<>();
		//필요한 객체의 참조값을 담을 지역변수 미리 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//DBCPBean 객체를 이용해서 Connection객체를 얻어온다 (Connection Pool에서 얻어오기)
			conn = new DbcpBean().getConn();
			//실행할 sql문
			String sql = "SELECT *"
					+ "	  FROM"
					+ "		  (SELECT result1.*, ROWNUM AS rnum"
					+ "		   FROM"
					+ "				(SELECT num, writer, title, viewCount, regdate"
					+ "				FROM board_cafe"
					+ "				ORDER BY num DESC) result1)"
					+ "	  WHERE rnum BETWEEN ? AND ?";
			pstmt = conn.prepareStatement(sql);
			//sql문이 미완성이라면 여기서 완성
			pstmt.setInt(1, dto.getStartRowNum());
			pstmt.setInt(2, dto.getEndRowNum());
			//SELECT문 수행하고 결과값 받아오기
			rs = pstmt.executeQuery();
			//반복문 돌면서 ResultSet에 담긴 내용 추출
			while (rs.next()) {
				CafeDto tmp = new CafeDto();
				tmp.setNum(rs.getInt("num"));
				tmp.setWriter(rs.getString("writer"));
				tmp.setTitle(rs.getString("title"));
				tmp.setViewCount(rs.getInt("viewCount"));
				tmp.setRegdate(rs.getString("regdate"));
				//list에 누적 
				list.add(tmp);
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
		return list;
	}
	
	//글 정보 가져오기 메소드 
	public CafeDto getData(int num) {
		CafeDto dto = null;
		//필요한 객체의 참조값을 담을 지역변수 미리 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//DBCPBean 객체를 이용해서 Connection객체를 얻어온다 (Connection Pool에서 얻어오기)
			conn = new DbcpBean().getConn();
			//실행할 sql문
			String sql = "SELECT writer, title, content, viewCount, regdate"
						+" FROM board_cafe"
						+" WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			//sql문이 미완성이라면 여기서 완성
			pstmt.setInt(1, num);
			//SELECT문 수행하고 결과값 받아오기
			rs = pstmt.executeQuery();
			//반복문 돌면서 ResultSet에 담긴 내용 추출
			while (rs.next()) {
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setViewCount(rs.getInt("viewCount"));
				dto.setRegdate(rs.getString("regdate"));
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
		return dto;
	}
	
	//글 삭제 메소드
	public boolean delete(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "DELETE FROM board_cafe"
						+" WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			// 실행할 sql문이 미완성이면 여기서 완성
			pstmt.setInt(1, num);
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
	
	//글 수정 메소드
	public boolean update(CafeDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "UPDATE board_cafe"
						+" SET title=?, content=?"
						+" WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			// 실행할 sql문이 미완성이면 여기서 완성
			pstmt.setString(1,dto.getTitle());
			pstmt.setString(2,dto.getContent());
			pstmt.setInt(3, dto.getNum());
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
	
	//글 추가 메소드
	public boolean insert(CafeDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "INSERT INTO board_cafe"
						+" (num, writer, title, content, viewCount, regdate)"
						+" VALUES(board_cafe_seq.NEXTVAL, ?, ?, ?, ?, SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			// 실행할 sql문이 미완성이면 여기서 완성
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setInt(4, dto.getViewCount());
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
}
