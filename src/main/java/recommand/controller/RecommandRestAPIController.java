package recommand.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import recommand.model.RecommandDAO;
import recommand.model.RecommandDTO;

@Controller
public class RecommandRestAPIController {
	
	@Autowired
	private SqlSession sqlSession3;
	
	@RequestMapping("/worldcupData.do")
	@ResponseBody
	public ArrayList<RecommandDTO> worldcupList(RecommandDTO recommandDTO) {
		
		ArrayList<RecommandDTO> record = sqlSession3.getMapper(RecommandDAO.class)
				.listData(recommandDTO);
		ArrayList<RecommandDTO> result = new ArrayList<RecommandDTO>();
		int[] num = new int[64];
		
		// 중복되지 않는 64개의 난수 생성(좋은 코드는 아님..)
		while(true) {
	        boolean flag = true;
	        
	        for (int i = 0; i < num.length; i++) {
	        	int temp = (int)(Math.random() * 191) + 1;
	            num[i] = temp;
	            for (int j = 1; j < num.length; j++) {
	                if (num[i] == num[j] && i != j) {
	                    flag = false;
	                    break;
	                }
	            }
	            if (!flag) break;
        	}
        	if (flag) break;
    	}
		
		for (int i = 0; i < record.size(); i++) {
			for (int j = 0; j < num.length; j++) {
				if (Integer.parseInt(record.get(i).getIdx()) == num[j]) {
					result.add(record.get(j));
				}
			}
		}
		
		return result;
	}
	
	// 룰렛 화면 매핑
	@RequestMapping("/roulette.do")
	public String roulette(Model model) {
		return "recommand/roulette";
	}
	
	// 월드컵 화면 매핑
	@RequestMapping("/worldcup.do")
	public String worldcup(Model model) {
		return "recommand/worldcup";
	}
}
