package board.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import board.model.BoardDTO;
import board.model.JDBCTemplateDAO;


public class WriteActionCommand implements BbsCommandImpl{

	@Override
	public void execute(Model model) {
		//Model에 저장된 값을 Map컬렉션으로 변환한다.
		Map<String, Object>paramMap=model.asMap();
		//첫번째로 request내장객체를 가져온다.
		HttpServletRequest req=(HttpServletRequest)paramMap.get("req");
		//두번째로 작성페이지에서 전송한 모든 폼값이 저장된 DTO객체를 가져온다.
		BoardDTO boardDTO=(BoardDTO)paramMap.get("boardDTO");
		//폼값 확인용 로그
		//System.out.println("springBbsDTO.title="+springBbsDTO.getTitle());
		
		//DAO객체 생성 및 쓰기처리
		JDBCTemplateDAO dao=new JDBCTemplateDAO();
		//int affected=dao.write(springBbsDTO);
		//System.out.println("입력된 결과:"+affected);
		//dao.write(boardDTO);
		//dao.close();
	}
}
