package admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import admin.command.AdActiveCommand;
import admin.command.AdBlackCommand;
import admin.command.AdBoardCommand;
import admin.command.AdFoodCommand;
import admin.command.AdMemberCommand;
import admin.command.AdPlaceCommand;
import admin.command.AdReplyCommand;
import admin.command.AdVSEditCommand;
import admin.command.AdVSTalkCommand;
import admin.command.AdVSViewCommand;
import admin.command.AdminCommandImpl;
import admin.command.DeleteActionCommand;
import admin.command.DeleteFoodCommand;
import admin.command.DeleteReplyCommand;
import admin.command.DeleteVSTalkCommand;
import admin.model.AdMemberDAO;
import admin.model.AdPlaceDTO;
import admin.model.AdVSTalkDTO;

@Controller
public class AdminController {

	@Autowired
	private AdMemberDAO dao;
	
	//모든 Command객체의 부모타입의 참조 변수 생성
	AdminCommandImpl command =null;
	
	@Autowired
	AdMemberCommand admemberCommand;
	@Autowired
	AdBoardCommand adboardCommand;
	@Autowired
	DeleteActionCommand deleteActionCommand;
	@Autowired
	AdBlackCommand adblackCommand;
	@Autowired
	AdActiveCommand adactiveCommand;
	@Autowired
	AdReplyCommand adreplyCommand;
	@Autowired
	DeleteReplyCommand deleteReplyCommand;
	@Autowired
	AdVSTalkCommand advstalkCommand;
	@Autowired
	AdVSViewCommand advsViewCommand;
	@Autowired
	AdVSEditCommand advsEditCommand;
	@Autowired
	DeleteVSTalkCommand deleteVSTalkCommand;
	@Autowired
	AdFoodCommand adfoodCommand;
	@Autowired
	DeleteFoodCommand deleteFoodCommand;
	@Autowired
	AdPlaceCommand adPlaceCommand;
	
	
	//어드민 메인 진입
	@RequestMapping("/admin.do")
	public String goAdmin() {
		return "admin/main";
	}
	
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
	
	//회원 관리 진입
	@RequestMapping("/admin/member.do")
	public String list(Model model, HttpServletRequest req) {
		model.addAttribute("req", req);
	
		command = admemberCommand;
		command.execute(model);
		
		return "admin/member";
	}
	
	//회원 비활성화
	@RequestMapping(value="/admin/black.do", method=RequestMethod.POST)
	public String black(Model model, HttpServletRequest req) {
		
		model.addAttribute("req", req);
	
		command = adblackCommand;
		command.execute(model);
		
		return "redirect:member.do";
	}
	//회원 활성화
	@RequestMapping(value="/admin/active.do", method=RequestMethod.POST)
	public String active(Model model, HttpServletRequest req) {
		
		model.addAttribute("req", req);
	
		command = adactiveCommand;
		command.execute(model);
		
		return "redirect:member.do";
	}
	
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	//게시판 관리 진입
	@RequestMapping("/admin/photo.do")
	public String board(Model model, HttpServletRequest req) {
		model.addAttribute("req", req);
		
		command = adboardCommand;
		command.execute(model);
		
		return "admin/board";
	}
	
	//게시판 삭제
	@RequestMapping(value="/admin/delete.do", method=RequestMethod.POST)
	public String boardDelete(
			@RequestParam List<String> idx, Model model, HttpServletRequest req) {
		
		model.addAttribute("req", req);
		
		command = deleteActionCommand;
		command.execute(model);
		
		return "redirect:photo.do";
	}
	
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
	//리뷰 관리 진입
	@RequestMapping("/admin/reply.do")
	public String reply(Model model, HttpServletRequest req) {
		model.addAttribute("req", req);
		
		command = adreplyCommand;
		command.execute(model);
		
		return "admin/reply";
	}
	
	//리뷰 삭제
	@RequestMapping(value="/admin/delReply.do", method=RequestMethod.POST)
	public String delReply(
			@RequestParam List<String> rno, Model model, HttpServletRequest req) {
		
		model.addAttribute("req", req);
		
		command = deleteReplyCommand;
		command.execute(model);
		
		return "redirect:reply.do";
	}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	//투표 관리 진입 매핑*리스트 출력
	@RequestMapping("/admin/vsTalk.do")
	public String vsTalk(Model model, HttpServletRequest req) {
		
		model.addAttribute("req", req);
		
		command = advstalkCommand;
		command.execute(model);
		
		return "admin/vsTalk";
	}
	
	//투표 등록 폼 진입
	@RequestMapping("/admin/vsWrite.do")
	public String vsWrite(Model model, HttpServletRequest req) {
		
		return "admin/vsWrite";
	}
	
	//투표 등록 ->VSFileUploadController에서 매핑 (/admin/uploadAction.do)
	
	//상세보기
	@RequestMapping("/admin/vsView.do")
	public String view(Model model, HttpServletRequest req, AdVSTalkDTO adVSTalkDTO) {
		
		model.addAttribute("req", req);
		model.addAttribute("adVSTalkDTO", adVSTalkDTO);
		
		command = advsViewCommand;
		command.execute(model);
		
		return "admin/vsResult";
	}
	
	//투표 수정폼 진입 
	@RequestMapping("/admin/vsEdit.do")
	public String edit(Model model, HttpServletRequest req) {
		
		model.addAttribute("req", req);
		
		command = advsEditCommand;
		command.execute(model);
		
		return "admin/vsEdit";
	}
	
	//투표 삭제
	@RequestMapping("/admin/vsDelete.do")
	public String delete(Model model, HttpServletRequest req) {	
		model.addAttribute("req", req);
		
		command = deleteVSTalkCommand;
		command.execute(model);
		
		return "redirect:vsTalk.do";
	}
	
	
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//메뉴 관리 진입
	@RequestMapping("/admin/food.do")
	public String roullet(Model model, HttpServletRequest req) {
		model.addAttribute("req", req);
		
		command = adfoodCommand;
		command.execute(model);
		
		return "admin/menu";
	}

	//메뉴 삭제
	@RequestMapping("/admin/foodDelete.do")
	public String foodDelete(Model model, HttpServletRequest req) {	
		model.addAttribute("req", req);
		
		command = deleteFoodCommand;
		command.execute(model);
		
		return "redirect:food.do";
	}
	
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//식당 정보 관리 진입
	@RequestMapping(value="/admin/place.do")
	public String placeList(Model model, HttpServletRequest req) {
		
		return "admin/place";
	}
	
	//식당 등록 페이지 진입
	@RequestMapping(value="/admin/plcWrite.do")
	public String plcWrite(Model model, HttpServletRequest req) {
		
		return "admin/plcWrite";
	}
	
	//식당 글 등록하기
	@RequestMapping(value="/admin/plcAction.do")
	public String plcAction(Model model, HttpServletRequest req, AdPlaceDTO adPlaceDTO) {
		model.addAttribute("req", req);
		model.addAttribute("adPlaceDTO", adPlaceDTO);
		
		command = adPlaceCommand;
		command.execute(model);
		
		return "redirect:place.do";
	}
	
}
