package board.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.PreparedStatementSetter;

public class JDBCTemplateDAO {
	// 멤버변수
	JdbcTemplate template;

	// 생성자
	public JDBCTemplateDAO() {
		this.template = JdbcTemplateConst.template;
		System.out.println("JDBCTemplateDAO() 생성자 호출");
	}

	public void close() {
		// JDBCTemplate에서는 자원해제를 사용하지 않는다.
	}

	// 게시물의 갯수 카운트
	public int getTotalCount(Map<String, Object> map) {
		String sql = "SELECT COUNT(*) FROM board";

		if (map.get("Word") != null) {
			sql += " WHERE " + map.get("Column") + " " + " LIKE '%" + map.get("Word") + "%' ";
		}
		// 쿼리문에서 count(*)을 통해 반환되는 값을 정수형태로 가져온다.
		return template.queryForObject(sql, Integer.class);
	}

	// 게시판 리스트 가져오기(페이지처리없음)
	public ArrayList<BoardDTO> list(Map<String, Object> map) {
		String sql = "SELECT * FROM board ";
		if (map.get("Word") != null) {
			sql += " WHERE " + map.get("Column") + " " + " LIKE '%" + map.get("Word") + "%' ";
		}
		sql += " ORDER BY idx DESC";
		return (ArrayList<BoardDTO>) template.query(sql, new BeanPropertyRowMapper<BoardDTO>(BoardDTO.class));
	}

	// 파일올리는 글쓰기
	public void reviewWrite(final BoardDTO boardDTO) {
		template.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {

				String sql = "INSERT INTO board (" + " idx, id, tag, title, contents,cate,"
						+ " userfile1, userfile2, userfile3, userfile4, userfile5)" + " VALUES ("
						+ " board_seq.NEXTVAL,?,?,?,?,'rwv'," + "?,?,?,?,?" + " )";
				PreparedStatement psmt = con.prepareStatement(sql);
				psmt.setString(1, boardDTO.getId());
				psmt.setString(2, boardDTO.getTag());
				psmt.setString(3, boardDTO.getTitle());
				psmt.setString(4, boardDTO.getContents());
				psmt.setString(5, boardDTO.getUserfile1());
				psmt.setString(6, boardDTO.getUserfile2());
				psmt.setString(7, boardDTO.getUserfile3());
				psmt.setString(8, boardDTO.getUserfile4());
				psmt.setString(9, boardDTO.getUserfile5());

				return psmt;
			}
		});
	}

	// 게시물 조회수 증가
	public void updateVisitCnt(final String idx) {
		// 쿼리문 작성
		String sql = "UPDATE board SET " + " visitCnt=visitCnt+1 " + " WHERE idx=? ";
		/*
		 * 행의 변화를 주는 쿼리문 실행이므로 update메서드를 사용함 첫번째인자는 쿼리문, 두번째 인자는 익명클래스를 통해 인파라미터를 설정한다.
		 */
		template.update(sql, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {

				ps.setInt(1, Integer.parseInt(idx));
			}
		});
	}

	// 게시물 상세보기
	public BoardDTO view(String idx) {
		// 조회수 증가를 위한 메서드 호출
		updateVisitCnt(idx);

		BoardDTO dto = new BoardDTO();
		String sql = "SELECT * FROM board " + " WHERE idx=" + idx;
		try {
			/*
			 * queryForObject()메서드는 쿼리문을 실행한 후 반드시 하나의 결과를 반환해야 한다. 그렇지 않으면 에러가 발생하게 되므로
			 * 예외처리를 하는 것이 봏다.
			 */
			dto = template.queryForObject(sql, new BeanPropertyRowMapper<BoardDTO>(BoardDTO.class));
			/*
			 * BeanPropertyRowMapper클래스는 쿼리의 실행결과를 DTO에 저장해주는 역할을 한다. 이때 테이블의 컬럼명과 DTO의
			 * 멤버변수명은 일치해야 한다.
			 */
		} catch (Exception e) {
			System.out.println("View()실행시 예외발생");
		}
		return dto;
	}

	// 임시로 넣었음
	/*
	 * public int id(String idx, String id) { String retNum=0; String
	 * sql="SELECT*FROM board " +" WHERE id='"+id+"' AND idx="+idx; try {
	 * 
	 * 일련번호와 패스워드가 일치하는 게시물이 있는 경우 정상처리되고, 만약 일치하는 게시물이 없으면 예외가 발생한다.
	 * queryForObject() 메서드는 반드시 하나의 결과가 나와야 하고, 그렇지 못한 경우 예외를 발생시키기 때문이다.
	 * 
	 * BoardDTO dto=template.queryForObject(sql, new
	 * BeanPropertyRowMapper<BoardDTO>( BoardDTO.class));
	 * 
	 * 일련번호는 시퀀스를 사용하므로 반드시 1이상의 값을 가지게 된다. 따라서 0이 반환된다면 패스워드 검증 실패로 판단할 수 있다.
	 * 
	 * retNum=dto.getIdx(); } catch(Exception e) {
	 * System.out.println("password() 예외발생"); } return retNum; }
	 */

	// 수정처리 final 지우면 에러남
	public void edit(final BoardDTO dto) {
		String sql = "UPDATE board " + " SET id=?, tag=?, title=?, contents=? " + " WHERE idx=?";

		template.update(sql, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {

				ps.setString(1, dto.getId());
				ps.setString(2, dto.getTag());
				ps.setString(3, dto.getTitle());
				ps.setString(4, dto.getContents());
				ps.setInt(5, dto.getIdx());
			}
		});
	}

	// 수정처리 final 지우면 에러남
	public void reviewEditAction(final BoardDTO dto) {
		String sql = "UPDATE board " 
				+ " SET id=?, tag=?, title=?, contents=? ,"
				+ " userfile1=?, userfile2=?, userfile3=?, userfile4=?, userfile5=? " 
				+ " WHERE idx=?";

		template.update(sql, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {

				ps.setString(1, dto.getId());
				ps.setString(2, dto.getTag());
				ps.setString(3, dto.getTitle());
				ps.setString(4, dto.getContents());
				ps.setString(5, dto.getUserfile1());
				ps.setString(6, dto.getUserfile2());
				ps.setString(7, dto.getUserfile3());
				ps.setString(8, dto.getUserfile4());
				ps.setString(9, dto.getUserfile5());
				ps.setInt(10, dto.getIdx());
			}
		});
	}

	public void delete(final String idx, final String id) {
		String sql = "DELETE FROM board " + " WHERE idx=? AND id=?";

		template.update(sql, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, idx);
				ps.setString(2, id);
			}
		});
	}

	public ArrayList<BoardDTO> listPage(Map<String, Object> map) {

		int start = Integer.parseInt(map.get("start").toString());
		int end = Integer.parseInt(map.get("end").toString());

		String sql = "" + "SELECT * FROM (" + "    SELECT Tb.*, rownum rNum FROM (" + "        SELECT * FROM board ";
		if (map.get("Word") != null) {
			sql += " WHERE " + map.get("Column") + " " + " LIKE '%" + map.get("Word") + "%' ";
		}
		sql += " ORDER BY idx DESC" + "    ) Tb" + ")" + " WHERE rNum BETWEEN " + start + " and " + end;

		return (ArrayList<BoardDTO>) template.query(sql, new BeanPropertyRowMapper<BoardDTO>(BoardDTO.class));
	}

}
