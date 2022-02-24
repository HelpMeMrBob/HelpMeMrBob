package admin.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import admin.model.AdMemberDAO;

@Service
public class AdActiveCommand implements AdminCommandImpl{
	
	@Autowired
	AdMemberDAO dao;
	public AdActiveCommand() {
		System.out.println("AdActiveCommand 빈 자동 생성 됨");
	}
	
	@Override
	public void execute(Model model) {
		System.out.println("AdActiveCommand -> execute() 호출");
		
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = 
				(HttpServletRequest)paramMap.get("req");
		
		String id= req.getParameter("id");
		System.out.println(id);
		
		dao.memberActive(id);
	}
}
