package infomation.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import infomation.model.FavoriteDTO;
import infomation.model.InfomationDAOInter;
import infomation.model.InfomationDTO;
import infomation.model.ReviewDTO;
import member.model.MemberVO;
import recommand.model.RecommandDTO;

@Controller
public class InfomationController {
	
	private SqlSession sqlSession2;
	
	@Autowired
	public InfomationController(SqlSession sqlSession2, SqlSession sqlSession3) {
		this.sqlSession2 = sqlSession2;
	}
	
	//지도 화면 매핑
	@RequestMapping("/infomation.do")
	public String infomation(Model model, HttpSession session) {
		
		if(session.getAttribute("siteUserInfo") != null) {
			return "redirect:favoriteList.do";
		}
		
		return "main/infomation";
	}
	
	//검색어 처리 매핑
	@RequestMapping("/restaurant.do")
	public String restaurant(Model model, HttpServletRequest req, HttpSession session) {
		
		if(session.getAttribute("siteUserInfo") != null) {
			model.addAttribute("loginCheck", "Login");
			//DB에서 즐겨찾기 리스트목록 가져오기
			MemberVO vo = (MemberVO)session.getAttribute("siteUserInfo");
			ArrayList<FavoriteDTO> favoriteList = 
					sqlSession2.getMapper(InfomationDAOInter.class).favoriteList(vo.getId());
			model.addAttribute("favoriteList", favoriteList);
		}
		
		//DB에서 검색어에 맞는 결과 리스트 가져오기
		String search = req.getParameter("search");
		String selectMenu = req.getParameter("menu");
		
		if (selectMenu != null) {
			search = selectMenu;
		}
		
		ArrayList<InfomationDTO> keyword = sqlSession2.getMapper(InfomationDAOInter.class).keyword(search);
		model.addAttribute("keyword", keyword);
		
		return "main/infomation";
	}
	
	//즐겨찾기 등록
	@RequestMapping("/favorite.do")
	public String favorite(Model model, HttpServletRequest req, HttpSession session, FavoriteDTO favoriteDTO) {
		
		if (session.getAttribute("siteUserInfo") == null) {
			return "redirect:login.do";
		}
		
		try {
			sqlSession2.getMapper(InfomationDAOInter.class).favorite(favoriteDTO);
		}
		catch (Exception e) {
			e.printStackTrace();
			System.out.println("이미 추가한 즐겨찾기 항목");
			model.addAttribute("error");
		}
		
		return "redirect:favoriteList.do";
	}
	
	//즐겨찾기 리스트 가져오기
	@RequestMapping("/favoriteList.do")
	public String favoriteList(Model model, HttpSession session) {
		
		if (session.getAttribute("siteUserInfo") == null) {
			return "redirect:login.do";
		}
		
		MemberVO vo = (MemberVO)session.getAttribute("siteUserInfo");
		ArrayList<FavoriteDTO> favoriteList = sqlSession2.getMapper(InfomationDAOInter.class).favoriteList(vo.getId());
		
		model.addAttribute("favoriteList", favoriteList);
		
		return "main/infomation";
	}
	
	//즐겨찾기 수정
	@RequestMapping("/favoriteModify.do")
	public String favoriteModify(Model model, HttpSession session, HttpServletRequest req) {
		
		if (session.getAttribute("siteUserInfo") == null) {
			return "redirect:login.do";
		}
		
		sqlSession2.getMapper(InfomationDAOInter.class).favoriteModify(
				req.getParameter("memo"),
				req.getParameter("idx"));
		
		return "redirect:favoriteList.do";
	}
	
	//즐겨찾기 삭제
	@RequestMapping("/favoriteDelete.do")
	public String favoriteDelete(Model model, HttpSession session, HttpServletRequest req) {
		
		if (session.getAttribute("siteUserInfo") == null) {
			return "redirect:login.do";
		}
		
		sqlSession2.getMapper(InfomationDAOInter.class).favoriteDelete(req.getParameter("idx"));
		
		return "redirect:favoriteList.do";
	}
	
	//상세보기 매핑
	@RequestMapping("/detailView.do")
	public String detailView(Model model, HttpServletRequest req) {
		
		String place = req.getParameter("place");
		ArrayList<InfomationDTO> detailView = 
				sqlSession2.getMapper(InfomationDAOInter.class).detailView(place);
		
		ArrayList<ReviewDTO> review = 
				sqlSession2.getMapper(InfomationDAOInter.class).review(place);
		
		model.addAttribute("review", review);
		model.addAttribute("detailView", detailView);
		
		return "main/detailView";
	}
	
	//안드로이드와 연결하기 위한 REST API
	@RequestMapping("/searchMenuList.do")
	@ResponseBody
	public Map<String, Object> menuList(HttpServletRequest req) {
		
		//DB에서 검색어에 맞는 결과 리스트 가져오기
		String search = req.getParameter("search");
		String selectMenu = req.getParameter("menu");
		
		if (selectMenu != null) {
			search = selectMenu;
		}
		
		ArrayList<InfomationDTO> keyword = sqlSession2.getMapper(InfomationDAOInter.class).keyword(search);
		Map<String, Object> result = new HashMap<String, Object>();
		
		System.out.println("안드로이드 연결 시도");
		
		result.put("keyword", keyword);
		
		return result;
	}
	
	//전체 음식목록을 가져오는 REST API
	@RequestMapping("/allFood.do")
	@ResponseBody
	public Map<String, Object> allFood() {
		
		Map<String, Object> map = new HashMap<String, Object>();
		ArrayList<RecommandDTO> allFood = sqlSession2.getMapper(InfomationDAOInter.class).allFood();
		
		map.put("allFood", allFood);
		
		return map;
	}
	
//	//선호 목록을 가져오는 REST API
//	@RequestMapping("/favoriteList.do")
//	@ResponseBody
//	public Map<String, Object> favoriteList(HttpSession session) {
//		
//		String id = ((MemberVO)session.getAttribute("siteUserInfo")).getId();
//		String tab = "1";
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		ArrayList<MyFoodDTO> favList = sqlSession2.getMapper(InfomationDAOInter.class).favoriteList(id, tab);
//		
//		map.put("favList", favList);
//		
//		return map;
//	}
}
