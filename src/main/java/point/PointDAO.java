package point;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import item.ItemDAO;
import item.ItemDTO;




public class PointDAO {
	@Autowired
	JdbcTemplate template;
	
	public PointDAO() {
		this.template = JdbcTemplateConst.template;
		System.out.println("PointDAO() 생성자 호출");
	}
	
	public int selectCount(Map<String, Object> map) {
		String sql = "SELECT COUNT(*) FROM member";
		System.out.println(template.queryForObject(sql, Integer.class));
		return template.queryForObject(sql, Integer.class);
	}
	
	/*
	 buySticker() : 스티커를 구매했을때 호출되는 함수.
	 해당 아이디가 가진 포인트(밥알)이 10000밥알 이상일때만 스티커가 구매가능하다.
	 (밥알이 만개미만일 시에는 구매를 실패함. 
	 나중에 int의 return 0과 1로 구매실패한거띄워도 될듯)
	  
	  구매완료시 해당 id의 item에 temOName에 등록됨.
	 */
	public boolean buySticker(final PointDTO pdto, final ItemDTO idto) {
		final ItemDAO idao = new ItemDAO();
		boolean flag = false;
		
		
		if(getTotalPoint(pdto.getId())>=10000) {
			String sql = " UPDATE point SET point = point - 10000 "
					
				+ " WHERE id=?";
			template.update(sql, new PreparedStatementSetter() {
				
				@Override
				public void setValues(PreparedStatement ps ) throws
				SQLException{
					ps.setString(1, pdto.getId());
					System.out.println("구매 아이디: "+ pdto.getId());
					idto.setId(pdto.getId());
					System.out.println("구매한 아이템 :"+ pdto.getSticker());
					idto.setTemOname(pdto.getSticker());
					idao.getItem(idto);
					//idao.getItem2(idto);
				}
				});
			flag=true;
			System.out.println(getTotalPoint(pdto.getId()));
			System.out.println("buyTicket()실행 완료");
		}
		else {
			System.out.println(" buyTicket()오류 :포인트 잔액 부족");
		}
		return flag;
	}
	
	/*
	 포인트 테이블 해당아이디가 가진 토탈 포인트(밥알)을 가져온다.
	 */
	public int getTotalPoint(String id) {
		String sql2 = " select point from point "
				+ " WHERE id= '"+id+"'";
	 
		System.out.println(sql2);
		//쿼리문에서 count(*)을 통해 반환되는 값을 정수형태로 가져온다.
		System.out.println("포인트는: "+template.queryForObject(sql2, Integer.class));
		
		return template.queryForObject(sql2, Integer.class);
	}
	
	//지급기준에 따라 포인트가 더해짐
	public void addPoint(String tname,final PointDTO pdto) {
		//포인트의 획득 경로에 따라 얻는 달라짐.
		int pt = 0;
		String sql;
		
		if(tname.equals("register")) {
			pt = 0;
			
		}
		else if(tname.equals("review")) {
			pt = 1000;
		}else if(tname.equals("popularComments")) {
			pt = 2000;
		}else if(tname.equals("popularPhoto")) {
			pt = 5000;
		}
		
		 sql = " UPDATE point SET point = point + "+ pt
					
				+ " WHERE id=?";
		
		try {
			template.update(sql, new PreparedStatementSetter() {
				
				@Override
				public void setValues(PreparedStatement ps ) throws
				SQLException{
					ps.setString(1, pdto.getId());
				}
				});
			
			
		}catch(Exception e) {
			System.out.println(" addPoint() 실행중 오류");
		}
	
	}
	
	//카카오페이 결제시 밥알(포인트)가 충전됨.
	public void buyPonts(final PointDTO pdto, String payResult) {
		int pt =0;
		
		if(payResult.equals("1000")) {
			pt = 50000;
		}else if(payResult.equals("3000")) {
			pt = 157500;
		}else if(payResult.equals("5000")) {
		    pt = 275000;
		}
		String sql = " UPDATE point SET point = point + "+ pt
				
				+ " WHERE id=?";
		
		try {
			template.update(sql, new PreparedStatementSetter() {
				
				@Override
				public void setValues(PreparedStatement ps ) throws
				SQLException{
					ps.setString(1, pdto.getId());
				}
				});
		System.out.println("밥알교환 addPoint() 실행 완료");	
			
		}catch(Exception e) {
			System.out.println(" addPoint() 실행중 오류");
		}
		
	}
	
	
	
	
	
	
	
}
