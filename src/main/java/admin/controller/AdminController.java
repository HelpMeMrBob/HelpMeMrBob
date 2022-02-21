package admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

	//어드민 메인 매핑 처리
	@RequestMapping("/admin.do")
	public String goAdmin() {
		return "admin/main";
	}
	
	//회원 관리 매핑 처리
	@RequestMapping("/member.do")
	public String member() {
		return "admin/member";
	}
}
