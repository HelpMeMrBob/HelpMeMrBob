package recommand.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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
	
	@RequestMapping("/resources/worldcup_react_build8/index.html")
	@ResponseBody
	public Map<String, String> worldcupList(RecommandParameterDTO recommandParameterDTO) {
		
		ArrayList<RecommandDTO> record = sqlSession.getMapper(RecommandDAO.class)
				.listData(recommandParameterDTO);
		
		Map<String, String> map = new HashMap<String, String>();
		for(RecommandDTO dto : record) {
			map.put("idx", dto.getIdx());
			map.put("food", dto.getFood());
			map.put("image", dto.getImage());
			map.put("recomndCnt", dto.getRecomndCnt());
			map.put("Lgroup", dto.getLgroup());
			map.put("Mgroup", dto.getMgroup());
		}
		
		return map;
	}
}
