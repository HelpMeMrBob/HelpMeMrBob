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
public class AdMemberDAO {

	/*
	 servlet-context.xml에서 생성한 빈을 자동 주입 받는다.
	 오라클 연결 정보를 가지고 있다.  
	 */
	@Autowired
	JdbcTemplate template;
	
	public AdMemberDAO() {		
		System.out.println("AdMemberDAO() 생성자 호출");
	}	
	public void close() {}
	
	//게시물의 갯수 카운트 
	public int getTotalCount(Map<String, Object> map) {
		
		String sql ="SELECT COUNT(*) FROM member ";
		
		System.out.println(sql);
		//쿼리문에서 count(*)를 통해 반환되는 값을 정수 형태로 가져온다.
		return template.queryForObject(sql, Integer.class);
	}
	
	//member리스트 가져오기 (페이징)
	public ArrayList<AdMemberDTO> memberlist(Map<String, Object> map){
		
		int start = Integer.parseInt(map.get("start").toString());
		int end = Integer.parseInt(map.get("end").toString());
		
		String sql = "SELECT * FROM " 
			     +" (SELECT Tb.*, rownum rNum FROM "
			     +" (SELECT * FROM member ORDER BY name ASC) Tb) "
			     +" WHERE rNum BETWEEN " + start + " AND " + end;
		/*
		 RowMapper가 select를 통해 얻어온 ResultSet을 DTO객체에 
		 저장하고, List컬렉션에 적재하여 반환한다. 그러므로 DAO에서
		 개발자가 반복적으로 하던 작업을 자동으로 처리해준다. 
		 */
		System.out.println(sql);
		return (ArrayList<AdMemberDTO>)template.query(sql, 
				new BeanPropertyRowMapper<AdMemberDTO>(AdMemberDTO.class));	
	}
	
	//비활성화 처리
	public void memberBlack(final String id) {
		
		String sql="UPDATE member SET grade='black' WHERE id=?";
		
		template.update(sql, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				
				ps.setString(1, id);
			}
		});
	}
	
	//활성화 처리
	public void memberActive(final String id) {
		String sql="UPDATE member SET grade='member' WHERE id=?";
		
		template.update(sql, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				
				ps.setString(1, id);
			}
		});
	}
	
	
	//활성화 처리 
}
