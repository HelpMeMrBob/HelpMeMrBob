package board.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;


public class JDBCTemplateDAO {
	//멤버변수
	JdbcTemplate template;
	//생성자
	public JDBCTemplateDAO() {
		this.template=JdbcTemplateConst.template;
		System.out.println("JDBCTemplateDAO() 생성자 호출");
	}
	public void close() {
		//JDBCTemplate에서는 자원해제를 사용하지 않는다.
	}
	
	//게시물의 갯수 카운트
		public int getTotalCount(Map<String, Object>map) {
			String sql="SELECT COUNT(*) FROM board";
		
			if(map.get("Word")!=null){
				sql+=" WHERE "+map.get("Column")+" "
				   +" LIKE '%"+map.get("Word")+"%' ";
			}
			//쿼리문에서 count(*)을 통해 반환되는 값을 정수형태로 가져온다.
			return template.queryForObject(sql, Integer.class);
		}
	
	//게시판 리스트 가져오기(페이지처리없음)
	public ArrayList<BoardDTO> list(
			Map<String, Object>map){
		String sql="SELECT * FROM board ";
		if(map.get("Word")!=null) {
			sql+=" WHERE "+map.get("Column")+" "
			   +" LIKE '%"+map.get("Word")+"%' ";
		}
		sql+=" ORDER BY idx DESC";
		return (ArrayList<BoardDTO>)
			template.query(sql, 
					new BeanPropertyRowMapper<BoardDTO>(
							BoardDTO.class));
	}
	//글쓰기처리1
		public void write(final BoardDTO boardDTO) {
			template.update(new PreparedStatementCreator() {
				@Override
				public PreparedStatement createPreparedStatement(Connection con) throws SQLException{
					
					String sql="INSERT INTO board ("
						+" idx, id, tag, title, contents)"
						+" VALUES ("
						+" board_seq.NEXTVAL,?,?,?,?"
						+" )";
					PreparedStatement psmt=
							con.prepareStatement(sql);
					psmt.setString(1, boardDTO.getId());
					psmt.setString(2, boardDTO.getTag());
					psmt.setString(3, boardDTO.getTitle());
					psmt.setString(4, boardDTO.getContents());

					return psmt;
				}
			});
		}
	
}
