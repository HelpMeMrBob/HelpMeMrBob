package admin.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import admin.model.AdReplyDAO;

//board reply
@Service
public class DeleteReplyCommand implements AdminCommandImpl{
	
	@Autowired
	AdReplyDAO dao;
	public DeleteReplyCommand() {
		System.out.println("DeleteReplyCommand 빈 자동 생성 됨");
	}
	
	@Override
	public void execute(Model model) {
		System.out.println("DeleteReplyCommand -> execute() 호출");
		
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = 
				(HttpServletRequest)paramMap.get("req");
		
		String[] rno= req.getParameterValues("rno");
		System.out.println(rno[0]);	
		
		for(int i=0; i<rno.length; i++) {
			
			dao.delete(rno[i]);
		}

	}
}
