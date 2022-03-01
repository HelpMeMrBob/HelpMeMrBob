package admin.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import admin.model.AdVSTalkDAO;
import admin.model.AdVSTalkDTO;

@Service
public class AdVSEditCommand implements AdminCommandImpl{
	
	@Autowired
	AdVSTalkDAO dao;
	public AdVSEditCommand() {
		System.out.println("AdVSEditCommand 빈 자동 생성 됨");
	}
	
	@Override
	public void execute(Model model) {
		
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
	
		//일련번호를 파라미터로 받은 후 
		String idx = req.getParameter("idx");
		
		//기존의 게시물을 얻어온다.
		AdVSTalkDTO dto = dao.view(idx);
		model.addAttribute("viewRow", dto);
	}
}
