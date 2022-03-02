package admin.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import admin.model.AdPlaceDAO;
import admin.model.AdPlaceDTO;

@Service
public class AdPlcEditcommand implements AdminCommandImpl{
	
	@Autowired
	AdPlaceDAO dao;
	public AdPlcEditcommand() {
		System.out.println("AdPlcEditcommand 빈 자동 생성 됨");
	}
	
	@Override
	public void execute(Model model) {
		//Model에 저장된 request내장 객체를 얻어온다.
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		//일련번호를 파라미터로 받은 후 
		String idx = req.getParameter("idx");
		
		//기존의 게시물을 얻어온다.
		AdPlaceDTO dto = dao.view(idx);
		
		model.addAttribute("viewRow", dto);
		//dao.close();
	}
}
