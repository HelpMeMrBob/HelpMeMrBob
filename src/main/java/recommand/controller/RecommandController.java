package recommand.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import recommand.command.RecommandImpl;
import recommand.model.RecommandDAO;

@Controller
public class RecommandController {
	
	//@Autowired
	private RecommandDAO dao;
	
	RecommandImpl command = null;
	
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
