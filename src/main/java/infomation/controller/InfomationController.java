package infomation.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import infomation.command.InfomationCommandImpl;
import infomation.command.SearchKeywordCommand;
import infomation.model.InfomationDAO;
import infomation.model.InfomationDTO;

@Controller
public class InfomationController {
	
	@Autowired
	private InfomationDAO dao;
	
	InfomationCommandImpl command = null;
	
	@Autowired
	SearchKeywordCommand searchKeywordCommand;
	
	//지도 화면 매핑
	@RequestMapping("/infomation.do")
	public String infomation(Model model) {
		return "main/infomation";
	}
	
	//검색어 처리 매핑
	@RequestMapping("/restaurant.do")
	public String restaurant(Model model, HttpServletRequest req, InfomationDTO infomationDTO) {
		
		model.addAttribute("req", req);
		command = searchKeywordCommand;
		command.execute(model);
		
		return "main/infomation";
	}
}
