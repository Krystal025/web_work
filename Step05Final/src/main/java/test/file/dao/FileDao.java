package test.file.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import test.file.dto.FileDto;
import test.util.DbcpBean;

public class FileDao {
   //static 필드
   private static FileDao dao;
   //외부에서 객체 생성하지 못하도록 생성자를 private 로
   private FileDao() {}
   //자신의 참조값을 리턴해주는 메소드
   public static FileDao getInstance() {
      if(dao==null) {
         dao=new FileDao();
      }
      return dao;
   }   
   
   public List<FileDto> getList(){
	List<FileDto> list = new ArrayList<>();
	   //필요한 객체의 참조값을 담을 지역변수 미리 만들기
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try {
		//DBCPBean 객체를 이용해서 Connection객체를 얻어온다 (Connection Pool에서 얻어오기)
		conn = new DbcpBean().getConn();
		//실행할 sql문
		String sql = "SELECT num, writer, title, orgFileName, saveFileName, fileSize, regdate"
				+" FROM board_file"
				+" ORDER BY num DESC";
		pstmt = conn.prepareStatement(sql);
		//sql문이 미완성이라면 여기서 완성

		//SELECT문 수행하고 결과값 받아오기
		rs = pstmt.executeQuery();
		//반복문 돌면서 ResultSet에 담긴 내용 추출
		while (rs.next()) {
			FileDto tmp = new FileDto();
			tmp.setNum(rs.getInt("num"));
			tmp.setWriter(rs.getString("writer"));
			tmp.setTitle(rs.getString("title"));
			tmp.setOrgFileName(rs.getString("orgFileName"));
			tmp.setFileSize(rs.getLong("fileSize"));
			tmp.setRegdate(rs.getString("regdate"));
			//ArrayList객체에 누적시킨다 
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
   
   //업로드된 파일 정보를 DB 에 저장하는 메소드
   public boolean insert(FileDto dto) {
      Connection conn = null;
      PreparedStatement pstmt = null;
      int rowCount = 0;
      try {
         conn = new DbcpBean().getConn();
         String sql = "INSERT INTO board_file"
               + " (num, writer, title, orgFileName, saveFileName, fileSize, regdate)"
               + " VALUES(board_file_seq.NEXTVAL, ?, ?, ?, ?, ?, SYSDATE)";
         pstmt = conn.prepareStatement(sql);
         // ? 에 바인딩할게 있으면 해주고
         pstmt.setString(1, dto.getWriter());
         pstmt.setString(2, dto.getTitle());
         pstmt.setString(3, dto.getOrgFileName());
         pstmt.setString(4, dto.getSaveFileName());
         pstmt.setLong(5, dto.getFileSize());
         // INSERT OR UPDATE OR DELETE 문을 수행하고 수정되거나, 삭제되거나, 추가된 ROW 의 갯수 리턴 받기
         rowCount = pstmt.executeUpdate();
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         try {
            if (pstmt != null)
               pstmt.close();
            if (conn != null)
               conn.close();
         } catch (Exception e) {
         }
      }
      if (rowCount > 0) {
         return true;
      } else {
         return false;
      }
   }
}