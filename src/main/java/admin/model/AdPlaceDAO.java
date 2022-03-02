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
public class AdPlaceDAO {

	/*
	 servlet-context.xml에서 생성한 빈을 자동 주입 받는다.
	 오라클 연결 정보를 가지고 있다.  
	 */
	@Autowired
	JdbcTemplate template;
	
	public AdPlaceDAO() {		
		System.out.println("AdPlaceDAO() 생성자 호출");
	}	
	public void close() {}
	
	//게시물의 갯수 카운트 
	public int getTotalCount(Map<String, Object> map) {
		
		String sql ="SELECT COUNT(*) FROM restaurant ";
		
		System.out.println(sql);
		//쿼리문에서 count(*)를 통해 반환되는 값을 정수 형태로 가져온다.
		return template.queryForObject(sql, Integer.class);
	}
	
	//리스트 가져오기 (페이징)
	public ArrayList<AdVSTalkDTO> placeList(Map<String, Object> map){
		
		int start = Integer.parseInt(map.get("start").toString());
		int end = Integer.parseInt(map.get("end").toString());
		
		String sql = "SELECT * FROM " 
			     +" (SELECT Tb.*, rownum rNum FROM "
			     +" (SELECT * FROM restaurant ORDER BY idx DESC) Tb) "
			     +" WHERE rNum BETWEEN " + start + " AND " + end;
		
		System.out.println(sql);
		return (ArrayList<AdVSTalkDTO>)template.query(sql, 
				new BeanPropertyRowMapper<AdVSTalkDTO>(AdVSTalkDTO.class));	
	}

	//게시물 입력
	public int plcWrite(final AdPlaceDTO adPlaceDTO) {
		//작성된 폼 값을 저장한 DTO객체를 매개변수로 전달 받음
		/*
		 매개변수로 전달된 값을 익명 클래스 내에서 사용할 때는
		 반드시 final로 선언하여 값이 변경 불가능하게 처리해야 한다.
		 final로 선언하지 않으면 에러가 발생한다. 이것은 Java의 규칙이다.
		 */
		int result = template.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection con)
					throws SQLException {
				
				/*
				 하나의 쿼리문 내에서 nextval을 여러 번 사용하더라도 항상
				 같은 시퀀스를 반환한다. 
				 */
				String sql = "INSERT INTO restaurant ( "
						+ " idx, food, place, address, plcNum, menu, price, operTime ) "
						+ " VALUES( "
						+ " restaurant_seq.NEXTVAL, 'null', ?, ?, ?, ?, ?, ? )";
				
				PreparedStatement psmt =
						con.prepareStatement(sql);
				psmt.setString(1, adPlaceDTO.getPlace());
				psmt.setString(2, adPlaceDTO.getAddress());
				psmt.setString(3, adPlaceDTO.getPlcNum());
				psmt.setString(4, adPlaceDTO.getMenu());
				psmt.setString(5, adPlaceDTO.getPrice());
				psmt.setString(6, adPlaceDTO.getOperTime());
				
				return psmt;
			}
		});
		return result;
	}
	
	//게시물 삭제
	public void delete(final String idx) {
		
		String sql="DELETE FROM restaurant WHERE idx=?";
		
		template.update(sql, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				
				ps.setString(1, idx);
			}
		});
	}
}
