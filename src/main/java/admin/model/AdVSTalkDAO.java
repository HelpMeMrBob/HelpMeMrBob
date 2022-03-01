package admin.model;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.stereotype.Repository;

//스프링 컨테이너가 시작될 때 Scan의 대상이 되므로 자동으로 빈이 생성된다. 
@Repository
public class AdVSTalkDAO {

	/*
	 servlet-context.xml에서 생성한 빈을 자동 주입 받는다.
	 오라클 연결 정보를 가지고 있다.  
	 */
	@Autowired
	JdbcTemplate template;
	
	public AdVSTalkDAO() {		
		System.out.println("AdVSTalkDAO() 생성자 호출");
	}	
	public void close() {}
	
	//투표 등록 DB입력
	public int writeVS(final AdVSTalkDTO adVSTalkDTO) {
		
		int result = template.update(new PreparedStatementCreator() {
			
		@Override
		public PreparedStatement createPreparedStatement(Connection con)
				throws SQLException {
			
				String sql = "INSERT INTO VStalk ( "
						+ " idx, topic, ofile1, sfile1, ofile2, sfile2 ) "
						+ " VALUES( "
						+ " vstalk_seq.NEXTVAL, ?, ?, ?, ?, ? )";				
				PreparedStatement psmt =
						con.prepareStatement(sql);
				psmt.setString(1, adVSTalkDTO.getTopic());
				psmt.setString(2, adVSTalkDTO.getOfile1());
				psmt.setString(3, adVSTalkDTO.getSfile1());
				psmt.setString(4, adVSTalkDTO.getOfile2());
				psmt.setString(5, adVSTalkDTO.getSfile2());
				
				return psmt;
			}
		});
		return result;
	}
	
	//게시물의 갯수 카운트 
	public int getTotalCount(Map<String, Object> map) {
		
		String sql ="SELECT COUNT(*) FROM VStalk ";
		
		System.out.println(sql);
		return template.queryForObject(sql, Integer.class);
	}
		
	//VS투표 리스트 출력
	public ArrayList<AdVSTalkDTO> vsList(Map<String, Object> map){
		
		int start = Integer.parseInt(map.get("start").toString());
		int end = Integer.parseInt(map.get("end").toString());
		
		String sql = "SELECT * FROM " 
			     +" (SELECT Tb.*, rownum rNum FROM "
			     +" (SELECT * FROM VStalk ORDER BY idx DESC) Tb) "
			     +" WHERE rNum BETWEEN " + start + " AND " + end;
		
		System.out.println(sql);
		return (ArrayList<AdVSTalkDTO>)template.query(sql, 
				new BeanPropertyRowMapper<AdVSTalkDTO>(AdVSTalkDTO.class));	
	}
	
	//게시물 상세보기
	public AdVSTalkDTO view(String idx) {
		
		AdVSTalkDTO dto = new AdVSTalkDTO();
		
		String sql = "SELECT * FROM VStalk WHERE idx="+idx;
		
		try { 
			dto = template.queryForObject(sql, 
					new BeanPropertyRowMapper<AdVSTalkDTO>(AdVSTalkDTO.class));
		}
		catch (Exception e) {
			System.out.println("View()실행 시 예외 발생");
		}
		return dto;
	}
	
	//수정 처리 
	public void edit(final AdVSTalkDTO dto) {
		String sql = "UPDATE VStalk "
				+ " SET topic=?, ofile1=?, sfile1=?, ofile2=?, sfile2=? "
				+ " WHERE idx=?";
		
		template.update(sql, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, dto.getTopic());
				ps.setString(2, dto.getOfile1());
				ps.setString(3, dto.getSfile1());
				ps.setString(4, dto.getOfile2());
				ps.setString(5, dto.getSfile2());
				ps.setInt(6, dto.getIdx());
			}
		});
	}
	
	//삭제처리
	public void delete(final String idx) {
		
		String sql="DELETE FROM VStalk WHERE idx=?";
		
		template.update(sql, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				
				ps.setString(1, idx);
			}
		});
	}

}
