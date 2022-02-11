package board.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import board.command.BbsCommandImpl;
import board.command.ListCommand;
import board.command.WriteActionCommand;
import board.model.BoardDTO;
import board.model.JdbcTemplateConst;
@Controller
public class BbsController {
	
	BbsCommandImpl command=null;
	
	private JdbcTemplate template;
	
	@Autowired
	public void setTemplate(JdbcTemplate template) {
		this.template=template;
		System.out.println("@Autowired->JDBCTemplate 연결성공");
		//JdbcTemplate을 해당 프로그램 전체에서 사용하기 위한 설정(static타입)
		JdbcTemplateConst.template=this.template;
	}
	
	@RequestMapping("/reviewList.do")
	public String reviewList(Model model, HttpServletRequest req) {
		
		model.addAttribute("req",req);//request객체 자체를 Model에 저장
		command=new ListCommand();//service역할의 ListCommand객체 생성
		command.execute(model);//해당 객체로 Model객체 자체를 전달
		
		return "main/causes-layout";
	}
	
	//글쓰기 페이지로 진입하기 위한 매핑처리
	@RequestMapping("/reviewWrite.do")
	public String reviewWrite() {
		return "main/contact2";
	}
	//전송방식이 post이므로 value, method까지 같이 기술해서 매핑
	@RequestMapping(value="/writeAction.do",
			method=RequestMethod.POST)
	public String writeAction(Model model, 
			HttpServletRequest req, BoardDTO boardDTO) {
		/*
		 글쓰기 페이지에서 전송된 모든 폼값은 BoardDTO 객체를 통해
		 한번에 받을 수 있다. Spring에서는 커맨드객체를 통해 이와 같은
		 처리를 할 수 있다.
		 */
		model.addAttribute("req",req);
		model.addAttribute("boardDTO",boardDTO);
		//요청을 전달할 service객체를 생성한 후 execute()메서드 호출
		command=new WriteActionCommand();
		command.execute(model);
		
		//뷰를 반환하지 않고, 지정된 URL(요청명)으로 이동한다.
		return "redirect:reviewList.do?nowPage=1";
	}
	
}
