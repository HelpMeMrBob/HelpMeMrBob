package infomation.model;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class InfomationDAO {
	
	@Autowired
	JdbcTemplate template;
	
	public InfomationDAO() {
		System.out.println("DB연결 확인");
	}
	
	//DB에서 키워드에 맞는 레코드 꺼내오기
	public ArrayList<InfomationDTO> keyword(String key) {
		
		String query = "SELECT * FROM restaurant WHERE food LIKE '%"+ key +"%'";
		ArrayList<InfomationDTO> restaurant = new ArrayList<InfomationDTO>();
		
		try {
			restaurant = (ArrayList<InfomationDTO>)template.query(query,
					new BeanPropertyRowMapper<InfomationDTO>(InfomationDTO.class));
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return restaurant;
	}
}
