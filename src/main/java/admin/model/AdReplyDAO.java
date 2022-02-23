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
public class AdReplyDAO {

	/*
	 servlet-context.xml에서 생성한 빈을 자동 주입 받는다.
	 오라클 연결 정보를 가지고 있다.  
	 */
	@Autowired
	JdbcTemplate template;
	
	public AdReplyDAO() {		
		System.out.println("AdReplyDAO() 생성자 호출");
	}	
	public void close() {}
	
	//게시물의 갯수 카운트 
	public int getTotalCount(Map<String, Object> map) {
		
		String sql ="SELECT COUNT(*) FROM board_rep ";
		
		System.out.println(sql);
		//쿼리문에서 count(*)를 통해 반환되는 값을 정수 형태로 가져온다.
		return template.queryForObject(sql, Integer.class);
	}
	
	//review리스트 가져오기 (페이징)
	public ArrayList<AdReplyDTO> boardlist(Map<String, Object> map){
		
		int start = Integer.parseInt(map.get("start").toString());
		int end = Integer.parseInt(map.get("end").toString());
		
		String sql = "SELECT * FROM " 
			     +" (SELECT Tb.*, rownum rNum FROM "
			     +" (SELECT * FROM board_rep ORDER BY idx DESC) Tb) "
			     +" WHERE rNum BETWEEN " + start + " AND " + end;
		
		System.out.println(sql);
		return (ArrayList<AdReplyDTO>)template.query(sql, 
				new BeanPropertyRowMapper<AdReplyDTO>(AdReplyDTO.class));	
	}

	//board 게시물 삭제
	public void delete(final String idx) {
		
		String sql="DELETE FROM board_rep WHERE idx=?";
		
		template.update(sql, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {			
				ps.setString(1, idx);
			}
		});
	}
}
