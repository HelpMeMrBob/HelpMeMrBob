package board.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import board.model.BoardDTO;
import board.model.JDBCTemplateDAO;


public class ViewCommand implements BbsCommandImpl{

	@Override
	public void execute(Model model) {
		//요청 일괄받기
		Map<String, Object>paramMap=model.asMap();
		HttpServletRequest req=(HttpServletRequest)paramMap.get("req");
		
		//폼값받기
		String idx= req.getParameter("idx");
		String nowPage=req.getParameter("nowPage");
		//DAO,DTO객체 생성 및 상세보기 처리를 위한 메서드 호출
		JDBCTemplateDAO dao=new JDBCTemplateDAO();
		BoardDTO dto= new BoardDTO();
		dto=dao.view(idx);
		
		//줄바꿈 처리를 위해 <br/>로 변경
		dto.setContents(dto.getContents().replace("\r\n", "<br/>"));
		model.addAttribute("viewRow",dto);
		model.addAttribute("nowPage",nowPage);
	}
}
