package member.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO
{
	@Autowired
	JdbcTemplate template;

	public MemberDAO()
	{	//	JDBC 연결 확인
		System.out.println("JDBCTemplateDAO() 생성자 호출");
	}
	
	public void close()
	{
		
	}

	
	//	회원 정보 불러오기
	public MemberDTO memberView(String id)
	{
		MemberDTO dto = new MemberDTO();		
		String sql = "SELECT * FROM member WHERE id = ?"+ id;
		try
		{
			dto = template.queryForObject(sql, 
					new BeanPropertyRowMapper<MemberDTO>(MemberDTO.class));
		}
		catch (Exception e)
		{
			System.out.println("memberView() 실행시 예외발생");		 
		}
		return dto;
	}
	
}