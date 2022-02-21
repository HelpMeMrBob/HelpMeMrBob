package board.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import board.model.BoardDTO;
import board.model.JDBCTemplateDAO;

public class EditActionCommand implements BbsCommandImpl{
	@Override
	public void execute(Model model) {
		
		Map<String, Object> map= model.asMap();
		//커맨드객체를 통해 모든 폼값을 저장한 DTO를 가져옴
		HttpServletRequest req= (HttpServletRequest)map.get("req");
		
		BoardDTO boardDTO=(BoardDTO)map.get("boardDTO");
		
		JDBCTemplateDAO dao=new JDBCTemplateDAO();
		//DTO객체를 DAO로 전달함
		dao.edit(boardDTO);
	}
}
