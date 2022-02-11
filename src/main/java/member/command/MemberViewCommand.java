package member.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import member.model.MemberDAO;
import member.model.MemberDTO;

@Service
public class MemberViewCommand implements MemberCommandImpl
{
	@Autowired
	MemberDAO dao;
		
	@Override
	public void execute(Model model)
	{
		System.out.println("MemberViewCommand → execute() 호출");
		
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		MemberDTO dto = (MemberDTO)paramMap.get("memberDTO");
		
		dto = dao.memberView(dto.getId());
		
		model.addAttribute("memberView", dto);
	}
}