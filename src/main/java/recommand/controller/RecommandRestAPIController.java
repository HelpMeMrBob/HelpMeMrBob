package recommand.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import recommand.model.RecommandDAO;
import recommand.model.RecommandDTO;
import recommand.model.RecommandParameterDTO;

@Controller
public class RecommandRestAPIController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/worldcupList.do")
	@ResponseBody
	public ArrayList<RecommandDTO> worldcupList(HttpServletRequest req) {
		
		RecommandParameterDTO recommandParameterDTO = new RecommandParameterDTO();
		
		ArrayList<RecommandDTO> lists =
				sqlSession.getMapper(RecommandDAO.class).listData(recommandParameterDTO);
		
		return lists;
	}
}
