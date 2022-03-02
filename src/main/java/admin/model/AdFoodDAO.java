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

@Repository
public class AdFoodDAO {

	@Autowired
	JdbcTemplate template;
	
	public AdFoodDAO() {		
		System.out.println("AdFoodDAO() 생성자 호출");
	}
	public void close() {}
	
	//게시물의 갯수 카운트 
	public int getTotalCount(Map<String, Object> map) {
		
		String sql ="SELECT COUNT(*) FROM food ";
		
		System.out.println(sql);
		//쿼리문에서 count(*)를 통해 반환되는 값을 정수 형태로 가져온다.
		return template.queryForObject(sql, Integer.class);
	}
	
	//리스트 가져오기 (페이징)
	public ArrayList<AdFoodDTO> foodList(Map<String, Object> map){
		
		int start = Integer.parseInt(map.get("start").toString());
		int end = Integer.parseInt(map.get("end").toString());
		
		String sql = "SELECT * FROM " 
			     +" (SELECT Tb.*, rownum rNum FROM "
			     +" (SELECT * FROM food ORDER BY idx DESC) Tb) "
			     +" WHERE rNum BETWEEN " + start + " AND " + end;
		
		System.out.println(sql);
		return (ArrayList<AdFoodDTO>)template.query(sql, 
				new BeanPropertyRowMapper<AdFoodDTO>(AdFoodDTO.class));	
	}
	
	//food추가
	public int foodWrite(final AdFoodDTO adFoodDTO) {
		
		int result = template.update(new PreparedStatementCreator() {
			
		@Override
		public PreparedStatement createPreparedStatement(Connection con)
				throws SQLException {
			
				String sql = "INSERT INTO food ( "
						+ " idx, food, image, Lgroup ) "
						+ " VALUES( "
						+ " food_seq.NEXTVAL, ?, ?, ? )";				
				PreparedStatement psmt =
						con.prepareStatement(sql);
				psmt.setString(1, adFoodDTO.getFood());
				psmt.setString(2, adFoodDTO.getImage());
				psmt.setString(3, adFoodDTO.getLgroup());
				
				return psmt;
			}
		});
		return result;
	}
	
	
	//food 게시물 삭제
	public void delete(final String idx) {
		
		String sql="DELETE FROM food WHERE idx=?";
		
		template.update(sql, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				
				ps.setString(1, idx);
			}
		});
	}
}
