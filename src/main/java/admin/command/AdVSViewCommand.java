package admin.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import admin.model.AdVSTalkDAO;
import admin.model.AdVSTalkDTO;

@Service
public class AdVSViewCommand implements AdminCommandImpl{

	@Autowired
	AdVSTalkDAO dao;
	public AdVSViewCommand() {
		System.out.println("AdVSViewCommand 빈 자동 생성 됨");
	}

	@Override
	public void execute(Model model) {
		//요청 일괄 받기 
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		AdVSTalkDTO dto = (AdVSTalkDTO)paramMap.get("adVSTalkDTO");
	
		dto = dao.view(String.valueOf(dto.getIdx()));
		
		model.addAttribute("viewRow", dto);
		model.addAttribute("nowPage", dto.getNowPage());
	}
}
