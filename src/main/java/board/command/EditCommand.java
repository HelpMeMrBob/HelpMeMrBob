package board.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import board.model.BoardDTO;
import board.model.JDBCTemplateDAO;

public class EditCommand implements BbsCommandImpl{

	@Override
	public void execute(Model model) {

		//Model에 저장된 request내장객체를 얻어옴
		Map<String, Object>paramMap=model.asMap();
		HttpServletRequest req=(HttpServletRequest)paramMap.get("req");
		//일련번호를 파라미터로 받은 후
		String idx=req.getParameter("idx");
		JDBCTemplateDAO dao=new JDBCTemplateDAO();
		
		//기존의 게시물을 얻어온다.
		BoardDTO dto=dao.view(idx);
		model.addAttribute("viewRow",dto);
		//dao.close();
	}
}
