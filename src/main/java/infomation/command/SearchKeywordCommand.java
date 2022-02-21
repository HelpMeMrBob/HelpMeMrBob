package infomation.command;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import infomation.model.InfomationDAO;
import infomation.model.InfomationDTO;

@Service
public class SearchKeywordCommand implements InfomationCommandImpl {
	
	@Autowired
	InfomationDAO dao;
	
	@Override
	public void execute(Model model) {
		
		System.out.println("keyword 확인용 로그");
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		//검색어 얻어오기
		String search = req.getParameter("search");
		
		//DB에서 검색어가 들어간 자료들 가져오기
		ArrayList<InfomationDTO> keyword = dao.keyword(search);
		
		//모델 객체에 가져온 자료 저장
		model.addAttribute("keyword", keyword);
	}
}
