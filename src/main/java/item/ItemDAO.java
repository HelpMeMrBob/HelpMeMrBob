package item;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;

import point.JdbcTemplateConst;

public class ItemDAO {
	
	@Autowired
	JdbcTemplate template;
	
	public ItemDAO() {//실험
		this.template = JdbcTemplateConst.template;
		System.out.println("ItemDAO 생성자 호출");
	}
	
	public void getItem(String id, String temOname) {
		try {
			String sql = " INSERT INTO haveItem (id, temOname )"
					+" VALUES ('"+id+"', '"+temOname+"');";
			System.out.println("사용자계정 getItem() 실행완료1 ");
		}catch(Exception e) {
			System.out.print("사용자계정 getItem() 오류발생1 ");
			e.printStackTrace();
		}
	}
	
	//사용자 아이디를 얻어와서 거기서 구매한 스티커를 장착함.
		public void getItem(final ItemDTO idto) {
			template.update( new PreparedStatementCreator() {
				int resultSet = 0;
				
				//이자체가 오류를 던진걸 catch하지는 못하는건가??
				//만약 이게 안된다면 home에서 session.id가 있을때만 pdao.buySticker()를 호출하게함.
				
				@Override
				public PreparedStatement createPreparedStatement(Connection con) 
						throws SQLException {
				String sql = " INSERT INTO haveItem (id, temOname )"
						+" VALUES (?,?)";
				PreparedStatement psmt =
						con.prepareStatement(sql);
				psmt.setString(1, idto.getId());
				psmt.setString(2, idto.getTemOname());
				
				System.out.println(sql);
				System.out.println("사용자계정 getItem() 실행완료3 ");
				return psmt;
				}
				
			});			
		}
		
				//사용자 아이디를 얻어와서 거기서 구매한 스티커를 장착함.
		public void getItem2(final ItemDTO idto) {
			try {
						template.update( new PreparedStatementCreator() {
							int resultSet = 0;
								
						//이자체가 오류를 던진걸 catch하지는 못하는건가??
						//만약 이게 안된다면 home에서 session.id가 있을때만 pdao.buySticker()를 호출하게함.
								
						@Override
						public PreparedStatement createPreparedStatement(Connection con) 
									throws SQLException {
							String sql = " INSERT INTO haveItem (id, temOname )"
									+" VALUES (?,?)";
							PreparedStatement psmt = con.prepareStatement(sql);
							psmt.setString(1, idto.getId());
							psmt.setString(2, idto.getTemOname());
									
							System.out.println(sql);
							System.out.println("사용자계정 getItem() 실행완료3 ");
							return psmt;
							}
								
						});		
					}catch(Exception e) {
						System.out.println("사용자 계정 getItem()중 오류가 발생했습니다.");
					
					}
		}

	

}
