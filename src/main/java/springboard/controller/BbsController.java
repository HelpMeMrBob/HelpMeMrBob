package springboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;

import point.JdbcTemplateConst;

@Controller
public class BbsController {
	
	private JdbcTemplate template;
	
	@Autowired
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
		System.out.println("@Autowired -> JDBCTemplate 연결 성공");
		
		JdbcTemplateConst.template = this.template;
	}
	
	

}
