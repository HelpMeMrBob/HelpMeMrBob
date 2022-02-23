package admin.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import admin.model.AdBoardDAO;

//board delete 
@Service
public class DeleteActionCommand implements AdminCommandImpl{
	
	@Autowired
	AdBoardDAO dao;
	public DeleteActionCommand() {
		System.out.println("DeleteActionCommand 빈 자동 생성 됨");
	}
	
	@Override
	public void execute(Model model) {
		System.out.println("DeleteActionCommand -> execute() 호출");
		
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = 
				(HttpServletRequest)paramMap.get("req");
		
		String idx=req.getParameter("idx");
		
		dao.delete(idx);
	}
}
