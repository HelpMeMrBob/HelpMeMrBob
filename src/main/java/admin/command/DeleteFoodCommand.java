package admin.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import admin.model.AdFoodDAO;

//food delete 
@Service
public class DeleteFoodCommand implements AdminCommandImpl{
	
	@Autowired
	AdFoodDAO dao;
	public DeleteFoodCommand() {
		System.out.println("DeleteFoodCommand 빈 자동 생성 됨");
	}
	
	@Override
	public void execute(Model model) {
		System.out.println("DeleteFoodCommand -> execute() 호출");
		
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = 
				(HttpServletRequest)paramMap.get("req");
		
		String idx= req.getParameter("idx");
		System.out.println(idx);	
		
			
			dao.delete(idx);


	}
}
