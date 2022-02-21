package member.controller;

import javax.servlet.http.HttpServletRequest;	

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import member.command.MemberCommandImpl;
import member.command.MemberViewCommand;
import member.model.MemberDAO;
import member.model.MemberDTO;
 
@Controller 
public class MemberController 
{
	@Autowired
	private MemberDAO dao;

	MemberViewCommand command = null;
	
	@Autowired
	MemberViewCommand memberViewCommand;
	
	@RequestMapping("/member/view.do")
	public String memberView(Model model, HttpServletRequest req, MemberDTO memberDTO)
	{ 
		model.addAttribute("req", req);
		command = memberViewCommand;
		command.execute(model);

		return "Member/MemberInfoEdit";
	}	
}