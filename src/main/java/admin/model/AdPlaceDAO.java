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
		
		if(map.get("Word")!=null) {
			sql += " WHERE " + map.get("Column") + " "
				+ " LIKE '%" + map.get("Word") + "%' ";
		}
		
		System.out.println(sql);
		//쿼리문에서 count(*)를 통해 반환되는 값을 정수 형태로 가져온다.
		return template.queryForObject(sql, Integer.class);
	}
	
	//리스트 가져오기 (페이징)
	public ArrayList<AdPlaceDTO> placeList(Map<String, Object> map){
		
		int start = Integer.parseInt(map.get("start").toString());
		int end = Integer.parseInt(map.get("end").toString());
		
		String sql = "SELECT * FROM " 
			     +" (SELECT Tb.*, rownum rNum FROM "
			     +" (SELECT * FROM restaurant ";
			
			if(map.get("Word")!=null){
				sql +=" WHERE "+map.get("Column")+" "
					+ " LIKE '%"+map.get("Word")+"%' ";				
			}
			     
		     sql += "ORDER BY idx asc) Tb) "
			     +" WHERE rNum BETWEEN " + start + " AND " + end ;
		
		System.out.println(sql);
		return (ArrayList<AdPlaceDTO>)template.query(sql, 
				new BeanPropertyRowMapper<AdPlaceDTO>(AdPlaceDTO.class));	
	}

	//게시물 입력
	public int plcWrite(final AdPlaceDTO adPlaceDTO) {

		int result = template.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection con)
					throws SQLException {

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
	
	//게시물 상세보기
	public AdPlaceDTO view(String idx) {
		
		
		AdPlaceDTO dto = new AdPlaceDTO();
		
		String sql = "SELECT * FROM restaurant WHERE idx="+idx;
		
		try { 
			dto = template.queryForObject(sql, 
					new BeanPropertyRowMapper<AdPlaceDTO>(AdPlaceDTO.class));
		}
		catch (Exception e) {
			System.out.println("View()실행 시 예외 발생");
		}
		return dto;
	}
	
	//수정처리
	public void plcEdit(final AdPlaceDTO dto) {
		String sql = "UPDATE restaurant "
				+ " SET place=?, address=?, plcNum=?, menu=?, price=?, operTime=? "
				+ " WHERE idx=?";
		
		template.update(sql, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, dto.getPlace());
				ps.setString(2, dto.getAddress());
				ps.setString(3, dto.getPlcNum());
				ps.setString(4, dto.getMenu());
				ps.setString(5, dto.getPrice());
				ps.setString(6, dto.getOperTime());
				ps.setInt(7, dto.getIdx());
			}
		});
	}
	
}
