package admin.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import admin.model.AdPlaceDAO;

//place delete
@Service
public class DeletePlaceCommand implements AdminCommandImpl{
	
	@Autowired
	AdPlaceDAO dao;
	public DeletePlaceCommand() {
		System.out.println("DeletePlaceCommand 빈 자동 생성 됨");
	}
	
	@Override
	public void execute(Model model) {
		System.out.println("DeletePlaceCommand -> execute() 호출");
		
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = 
				(HttpServletRequest)paramMap.get("req");
		
		String idx= req.getParameter("idx");
		System.out.println(idx);	
		
			
		dao.delete(idx);


	}
}
