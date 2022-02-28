package com.project.helpmemrbob;

import java.sql.Connection;	
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspWriter;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import util.PagingUtil;
import member.model.MemberDAOImpl;
import member.model.MemberVO;
import member.model.ParameterDTO;
import point.PointDAO;
import point.PointDTO;


@Controller
public class MemberController
{
	private SqlSession sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession)
	{
		this.sqlSession = sqlSession;
		System.out.println("MyBatis 사용 준비 끝");
	}
	
	
	//	로그인 페이지 이동
	@RequestMapping("/login.do")
	public String login(Model model)
	{
		return "Member/Login";
	}
	
	//	로그인 처리
	@RequestMapping("/loginAction.do")
	public ModelAndView loginAction(HttpServletRequest req, HttpSession session)
	{
		MemberVO vo = sqlSession.getMapper(MemberDAOImpl.class)
				  .login(req.getParameter("id"), req.getParameter("pass"));
	
		ModelAndView mv = new ModelAndView();
	
	if (vo == null)
	{
		mv.addObject("LoginNG", "아이디/패스워드가 틀렸습니다.");
		mv.setViewName("Member/Login");
		return mv;
	}
	else
	{
		session.setAttribute("siteUserInfo", vo);	//	로그인 성공
		System.out.println("로그인 아이디 : "+ vo.getId());
		System.out.println("레벨 : "+ vo.getLev());
		mv.setViewName("redirect:/");
		return mv;
	}
	/*
	// 로그인을 하지 않은 상태에서 페이지 진입했을때 사용
	String backUrl = req.getParameter("backUrl");
	if (backUrl == null || backUrl.equals(""))
	{
	mv.setViewName("Member/Login");
	}
	else
	{
		mv.setViewName(backUrl);
	}
	return mv;
	*/
}
	
	//	로그아웃 처리
	@RequestMapping("/logout.do")
	public ModelAndView logout(HttpSession session)
	{
		session.invalidate();
		
		ModelAndView mv = new ModelAndView("redirect:/");
		return mv;
	}
	
	
	//	마이 페이지 페이지 이동
	@RequestMapping("/mypage.do")
	public String myPage(Model model, HttpServletRequest req, HttpSession session)
	{
		if (session.getAttribute("siteUserInfo") == null)
		{
			return "redirect:login.do";
		}
		
		ParameterDTO parameterDTO = new ParameterDTO();
		parameterDTO.setId(((MemberVO)session.getAttribute("siteUserInfo")).getId());
		
		ArrayList<MemberVO> point
		= sqlSession.getMapper(MemberDAOImpl.class).myPoint(parameterDTO);
		
		ArrayList<MemberVO> stickers
		= sqlSession.getMapper(MemberDAOImpl.class).mySticker(parameterDTO);
		
		ArrayList<MemberVO> preference
		= sqlSession.getMapper(MemberDAOImpl.class).myPreference(parameterDTO);
		
		model.addAttribute("stickers", stickers);
		model.addAttribute("preference", preference);
		model.addAttribute("point", point);

		return "Member/MyPage";
	}
	
	
	// 나의 작성 리스트 페이지 (리뷰 게시판)
	@RequestMapping("/mylist.do")
	public String myList(Model model, HttpServletRequest req, HttpSession session)
	{
		
		if (session.getAttribute("siteUserInfo") == null)
		{
			return "redirect:login.do";
		}
		
		ParameterDTO parameterDTO = new ParameterDTO();
		
		parameterDTO.setSearchField(req.getParameter("searchField"));
		parameterDTO.setSearchTxt(req.getParameter("searchTxt"));
		parameterDTO.setId(((MemberVO)session.getAttribute("siteUserInfo")).getId());
		
		System.out.println("검색어 : "+ parameterDTO.getSearchTxt());
		System.out.println("아이디 : "+ parameterDTO.getId());
		
		int totalRecordCount
			= sqlSession.getMapper(MemberDAOImpl.class).getTotalCountSearch(parameterDTO);
		
		int pageSize = 10;
		int blockPage = 2;
		//	int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);
		
		int nowPage
			= (req.getParameter("nowPage") == null || req.getParameter("nowPage").equals("")) 
				? 1 : Integer.parseInt(req.getParameter("nowPage"));
		
		int start = (nowPage - 1) * pageSize + 1;
		int end = nowPage * pageSize;
		
		parameterDTO.setStart(start);
		parameterDTO.setEnd(end);

		ArrayList<MemberVO> lists
			= sqlSession.getMapper(MemberDAOImpl.class).listPageSearch(parameterDTO);
		
		String pagingImg = PagingUtil.pagingImg(totalRecordCount, pageSize, blockPage, nowPage,
						   req.getContextPath() +"/mylist.do?");
		
		model.addAttribute("pagingImg", pagingImg);
		
		int virtualNum = 0;
		int countNum = 0;
		
		for (MemberVO vo : lists)
		{
			virtualNum = totalRecordCount - (((nowPage - 1) * pageSize) + countNum++);
			vo.setVirtualNum(virtualNum);
		}

		model.addAttribute("lists", lists);
		return "Member/MyList";
	}
	
	
	//	나의 작성 리스트 페이지 (댓글)
	@RequestMapping("/mycommentlist.do")
	public String myCommentList(Model model, HttpServletRequest req, HttpSession session)
	{
		if (session.getAttribute("siteUserInfo") == null)
		{
			return "redirect:login.do";
		}
		
		ParameterDTO parameterDTO = new ParameterDTO();
		
		parameterDTO.setSearchField(req.getParameter("searchField"));
		parameterDTO.setSearchTxt(req.getParameter("searchTxt"));
		parameterDTO.setId(((MemberVO)session.getAttribute("siteUserInfo")).getId());
		
		System.out.println("검색어 : "+ parameterDTO.getSearchTxt());
		System.out.println("아이디 : "+ parameterDTO.getId());
		
		int totalRecordCount
			= sqlSession.getMapper(MemberDAOImpl.class)
			  .getCommentTotalCountSearch(parameterDTO);
		
		int pageSize = 10;
		int blockPage = 2;
		
		int nowPage
			= (req.getParameter("nowPage") == null || req.getParameter("nowPage").equals("")) 
				? 1 : Integer.parseInt(req.getParameter("nowPage"));

		int start = (nowPage - 1) * pageSize + 1;
		int end = nowPage * pageSize;
		
		parameterDTO.setStart(start);
		parameterDTO.setEnd(end);

		ArrayList<MemberVO> lists
			= sqlSession.getMapper(MemberDAOImpl.class).commentListPageSearch(parameterDTO);

		
		String pagingImg = PagingUtil.pagingImg(totalRecordCount, pageSize, blockPage, nowPage,
						   req.getContextPath() +"/mycommentlist.do?");
		model.addAttribute("pagingImg", pagingImg);
		
		int virtualNum = 0;
		int countNum = 0;
		
		for (MemberVO vo : lists)
		{
			virtualNum = totalRecordCount - (((nowPage - 1) * pageSize) + countNum++);
			vo.setVirtualNum(virtualNum);
			String temp = vo.getContents().replace("\r\n", "<br />");
			vo.setContents(temp);
		}
		model.addAttribute("lists", lists);
		
		return "Member/MyCommentList";
	}


	
	//	회원 정보 수정 페이지 이동
	@RequestMapping("/memberUpdate.do")
	public String memberUpdate(Model model, HttpServletRequest req, HttpSession session)
	{
		if (session.getAttribute("siteUserInfo") == null)
		{
			return "redirect:login.do";
		}
		
		ParameterDTO parameterDTO = new ParameterDTO();
		parameterDTO.setId(((MemberVO)session.getAttribute("siteUserInfo")).getId());

		ArrayList<MemberVO> preference
		= sqlSession.getMapper(MemberDAOImpl.class).myPreference(parameterDTO);
		
		model.addAttribute("preference", preference);
		
		
		
		return "Member/MemberUpdate";
	}
	
	//	회원 정보 수정 처리
	@RequestMapping("/memberUpdateAction.do")
	public String memberUpdateAction(Model model, HttpSession session, MemberVO vo)
	{	
		if (session.getAttribute("siteUserInfo") == null)
		{
			return "redirect:login.do";
		}
		
		sqlSession.getMapper(MemberDAOImpl.class).memberUpdateAction(vo);
		sqlSession.getMapper(MemberDAOImpl.class).myPreferenceUpdate(vo);

		System.out.println("회원 정보 수정 완료");
		session.invalidate();
		
		return "redirect:login.do";
	}
	
	//회원가입 페이지 이동
	@RequestMapping("/memberRegister.do")
	public String memberJoin (Model model)
	{
		return "Member/MemberRegister";
	}
	@Autowired
	JdbcTemplate template;
	//회원가입 액션페이지
	@RequestMapping("/registerAction.do")
	public String registerAction (HttpServletRequest req,Model model, MemberVO vo)
	{	
		PointDAO pdao = new PointDAO(); 
		final PointDTO pdto = new PointDTO();
	
		String id = req.getParameter("id");
		pdto.setId(id);
		
		
		sqlSession.getMapper(MemberDAOImpl.class).registerAction(vo);
		System.out.println("회원가입페이지에서 넘어온 아이디: "+id);
		
		try {
			template.update( new PreparedStatementCreator() {
				int resultSet = 0;
				
				//이자체가 오류를 던진걸 catch하지는 못하는건가??
				//만약 이게 안된다면 home에서 session.id가 있을때만 pdao.buySticker()를 호출하게함.
				
				@Override
				public PreparedStatement createPreparedStatement(Connection con) 
						throws SQLException {
				String sql = " INSERT INTO point (id, point )"
						+" VALUES (?,0)";
				PreparedStatement psmt =
						con.prepareStatement(sql);
				psmt.setString(1, pdto.getId());
				
				
				System.out.println(sql);
				return psmt;
				}
				
			});	
			System.out.println("회원가입 포인트 0으로 설정완료.");
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("회원가입 포인트 기본설정 중 오류 발생.");
		}
		System.out.println("회원 가입 완료");
		
		return "redirect:/";
	}
	
/*───────────────────────────────────────────────────────────────────────────────────────────────
	나의 스크랩 목록 (Tab 1 - Tab 10)
───────────────────────────────────────────────────────────────────────────────────────────────*/
	@RequestMapping("/myscrap1.do")
	public String myScrap1(Model model, HttpServletRequest req, HttpSession session)
	{
		if (session.getAttribute("siteUserInfo") == null)
		{
			return "redirect:login.do";
		}
		
		ParameterDTO parameterDTO = new ParameterDTO();
		
		parameterDTO.setSearchField(req.getParameter("searchField"));
		parameterDTO.setSearchTxt(req.getParameter("searchTxt"));
		parameterDTO.setId(((MemberVO)session.getAttribute("siteUserInfo")).getId());
		parameterDTO.setLev(((MemberVO)session.getAttribute("siteUserInfo")).getLev());
		parameterDTO.setTab(1);
		
		int totalRecordCount
			= sqlSession.getMapper(MemberDAOImpl.class).getScrapTotalCountSearch(parameterDTO);
		
		int pageSize = 10;
		
		int nowPage
			= (req.getParameter("nowPage") == null || req.getParameter("nowPage").equals("")) 
				? 1 : Integer.parseInt(req.getParameter("nowPage"));
	
		ArrayList<MemberVO> lists
			= sqlSession.getMapper(MemberDAOImpl.class).scrapListPageSearch(parameterDTO);
		
		int virtualNum = 0;
		int countNum = 0;
		
		for (MemberVO vo : lists)
		{
			virtualNum = totalRecordCount - (((nowPage - 1) * pageSize) + countNum++);
			vo.setVirtualNum(virtualNum);
		}
	
		model.addAttribute("lists", lists);
		
		return "Member/MyScrapTap1";
	}	
	@RequestMapping("/myscrap2.do")
	public String myScrap2(Model model, HttpServletRequest req, HttpSession session)
	{
		if (session.getAttribute("siteUserInfo") == null)
		{
			return "redirect:login.do";
		}
		
		ParameterDTO parameterDTO = new ParameterDTO();
		
		parameterDTO.setSearchField(req.getParameter("searchField"));
		parameterDTO.setSearchTxt(req.getParameter("searchTxt"));
		parameterDTO.setId(((MemberVO)session.getAttribute("siteUserInfo")).getId());
		parameterDTO.setLev(((MemberVO)session.getAttribute("siteUserInfo")).getLev());
		parameterDTO.setTab(2);
		
		int totalRecordCount
			= sqlSession.getMapper(MemberDAOImpl.class).getScrapTotalCountSearch(parameterDTO);
		
		int pageSize = 10;
		
		int nowPage
			= (req.getParameter("nowPage") == null || req.getParameter("nowPage").equals("")) 
				? 1 : Integer.parseInt(req.getParameter("nowPage"));
	
		ArrayList<MemberVO> lists
			= sqlSession.getMapper(MemberDAOImpl.class).scrapListPageSearch(parameterDTO);
		
		int virtualNum = 0;
		int countNum = 0;
		
		for (MemberVO vo : lists)
		{
			virtualNum = totalRecordCount - (((nowPage - 1) * pageSize) + countNum++);
			vo.setVirtualNum(virtualNum);
		}
	
		model.addAttribute("lists", lists);
		
		return "Member/MyScrapTap2";
	}
	@RequestMapping("/myscrap3.do")
	public String myScrap3(Model model, HttpServletRequest req, HttpSession session)
	
	{
		if (session.getAttribute("siteUserInfo") == null)
		{
			return "redirect:login.do";
		}		
		ParameterDTO parameterDTO = new ParameterDTO();
		
		parameterDTO.setSearchField(req.getParameter("searchField"));
		parameterDTO.setSearchTxt(req.getParameter("searchTxt"));
		parameterDTO.setId(((MemberVO)session.getAttribute("siteUserInfo")).getId());
		parameterDTO.setTab(2);
		
		int totalRecordCount
			= sqlSession.getMapper(MemberDAOImpl.class).getScrapTotalCountSearch(parameterDTO);
	
		ArrayList<MemberVO> lists
			= sqlSession.getMapper(MemberDAOImpl.class).scrapListPageSearch(parameterDTO);
		
		int virtualNum = 0;
		
		for (MemberVO vo : lists)
		{
			virtualNum = totalRecordCount++;
			vo.setVirtualNum(virtualNum);
		}
	
		model.addAttribute("lists", lists);
		
		return "Member/MyScrapTap3";
	}
	@RequestMapping("/myscrap4.do")
	public String myScrap4(Model model, HttpServletRequest req, HttpSession session)
	{
		if (session.getAttribute("siteUserInfo") == null)
		{
			return "redirect:login.do";
		}		
		ParameterDTO parameterDTO = new ParameterDTO();
		
		parameterDTO.setSearchField(req.getParameter("searchField"));
		parameterDTO.setSearchTxt(req.getParameter("searchTxt"));
		parameterDTO.setId(((MemberVO)session.getAttribute("siteUserInfo")).getId());
		parameterDTO.setTab(4);
		
		int totalRecordCount
			= sqlSession.getMapper(MemberDAOImpl.class).getScrapTotalCountSearch(parameterDTO);
	
		ArrayList<MemberVO> lists
			= sqlSession.getMapper(MemberDAOImpl.class).scrapListPageSearch(parameterDTO);
		
		int virtualNum = 0;
		
		for (MemberVO vo : lists)
		{
			virtualNum = totalRecordCount++;
			vo.setVirtualNum(virtualNum);
		}
	
		model.addAttribute("lists", lists);
		
		return "Member/MyScrapTap4";
	}
	@RequestMapping("/myscrap5.do")
	public String myScrap5(Model model, HttpServletRequest req, HttpSession session)
	{
		if (session.getAttribute("siteUserInfo") == null)
		{
			return "redirect:login.do";
		}		
		ParameterDTO parameterDTO = new ParameterDTO();
		
		parameterDTO.setSearchField(req.getParameter("searchField"));
		parameterDTO.setSearchTxt(req.getParameter("searchTxt"));
		parameterDTO.setId(((MemberVO)session.getAttribute("siteUserInfo")).getId());
		parameterDTO.setTab(5);
		
		int totalRecordCount
			= sqlSession.getMapper(MemberDAOImpl.class).getScrapTotalCountSearch(parameterDTO);
	
		ArrayList<MemberVO> lists
			= sqlSession.getMapper(MemberDAOImpl.class).scrapListPageSearch(parameterDTO);
		
		int virtualNum = 0;
		
		for (MemberVO vo : lists)
		{
			virtualNum = totalRecordCount++;
			vo.setVirtualNum(virtualNum);
		}
	
		model.addAttribute("lists", lists);
		
		return "Member/MyScrapTap5";
	}
	@RequestMapping("/myscrap6.do")
	public String myScrap6(Model model, HttpServletRequest req, HttpSession session)
	{
		if (session.getAttribute("siteUserInfo") == null)
		{
			return "redirect:login.do";
		}		
		ParameterDTO parameterDTO = new ParameterDTO();
		
		parameterDTO.setSearchField(req.getParameter("searchField"));
		parameterDTO.setSearchTxt(req.getParameter("searchTxt"));
		parameterDTO.setId(((MemberVO)session.getAttribute("siteUserInfo")).getId());
		parameterDTO.setTab(6);
		
		int totalRecordCount
			= sqlSession.getMapper(MemberDAOImpl.class).getScrapTotalCountSearch(parameterDTO);
	
		ArrayList<MemberVO> lists
			= sqlSession.getMapper(MemberDAOImpl.class).scrapListPageSearch(parameterDTO);
		
		int virtualNum = 0;
		
		for (MemberVO vo : lists)
		{
			virtualNum = totalRecordCount++;
			vo.setVirtualNum(virtualNum);
		}
	
		model.addAttribute("lists", lists);
		
		return "Member/MyScrapTap6";
	}
		@RequestMapping("/myscrap7.do")
	public String myScrap7(Model model, HttpServletRequest req, HttpSession session)
	{
		if (session.getAttribute("siteUserInfo") == null)
		{
			return "redirect:login.do";
		}		
		ParameterDTO parameterDTO = new ParameterDTO();
		
		parameterDTO.setSearchField(req.getParameter("searchField"));
		parameterDTO.setSearchTxt(req.getParameter("searchTxt"));
		parameterDTO.setId(((MemberVO)session.getAttribute("siteUserInfo")).getId());
		parameterDTO.setTab(2);
		
		int totalRecordCount
			= sqlSession.getMapper(MemberDAOImpl.class).getScrapTotalCountSearch(parameterDTO);
	
		ArrayList<MemberVO> lists
			= sqlSession.getMapper(MemberDAOImpl.class).scrapListPageSearch(parameterDTO);
		
		int virtualNum = 0;
		
		for (MemberVO vo : lists)
		{
			virtualNum = totalRecordCount++;
			vo.setVirtualNum(virtualNum);
		}
	
		model.addAttribute("lists", lists);
		
		return "Member/MyScrapTap7";
	}
	@RequestMapping("/myscrap8.do")
	public String myScrap8(Model model, HttpServletRequest req, HttpSession session)
	{
		if (session.getAttribute("siteUserInfo") == null)
		{
			return "redirect:login.do";
		}		
		ParameterDTO parameterDTO = new ParameterDTO();
		
		parameterDTO.setSearchField(req.getParameter("searchField"));
		parameterDTO.setSearchTxt(req.getParameter("searchTxt"));
		parameterDTO.setId(((MemberVO)session.getAttribute("siteUserInfo")).getId());
		parameterDTO.setTab(2);
		
		int totalRecordCount
			= sqlSession.getMapper(MemberDAOImpl.class).getScrapTotalCountSearch(parameterDTO);
	
		ArrayList<MemberVO> lists
			= sqlSession.getMapper(MemberDAOImpl.class).scrapListPageSearch(parameterDTO);
		
		int virtualNum = 0;
		
		for (MemberVO vo : lists)
		{
			virtualNum = totalRecordCount++;
			vo.setVirtualNum(virtualNum);
		}
	
		model.addAttribute("lists", lists);
		
		return "Member/MyScrapTap8";
	}
	@RequestMapping("/myscrap9.do")
	public String myScrap9(Model model, HttpServletRequest req, HttpSession session)
	{
		if (session.getAttribute("siteUserInfo") == null)
		{
			return "redirect:login.do";
		}		
		ParameterDTO parameterDTO = new ParameterDTO();
		
		parameterDTO.setSearchField(req.getParameter("searchField"));
		parameterDTO.setSearchTxt(req.getParameter("searchTxt"));
		parameterDTO.setId(((MemberVO)session.getAttribute("siteUserInfo")).getId());
		parameterDTO.setTab(9);
		
		int totalRecordCount
			= sqlSession.getMapper(MemberDAOImpl.class).getScrapTotalCountSearch(parameterDTO);
	
		ArrayList<MemberVO> lists
			= sqlSession.getMapper(MemberDAOImpl.class).scrapListPageSearch(parameterDTO);
		
		int virtualNum = 0;
		
		for (MemberVO vo : lists)
		{
			virtualNum = totalRecordCount++;
			vo.setVirtualNum(virtualNum);
		}
	
		model.addAttribute("lists", lists);
		
		return "Member/MyScrapTap9";
	}
		@RequestMapping("/myscrap10.do")
	public String myScrap10(Model model, HttpServletRequest req, HttpSession session)
		{
		if (session.getAttribute("siteUserInfo") == null)
		{
			return "redirect:login.do";
		}		
		ParameterDTO parameterDTO = new ParameterDTO();
		
		parameterDTO.setSearchField(req.getParameter("searchField"));
		parameterDTO.setSearchTxt(req.getParameter("searchTxt"));
		parameterDTO.setId(((MemberVO)session.getAttribute("siteUserInfo")).getId());
		parameterDTO.setTab(10);
		
		int totalRecordCount
			= sqlSession.getMapper(MemberDAOImpl.class).getScrapTotalCountSearch(parameterDTO);
	
		ArrayList<MemberVO> lists
			= sqlSession.getMapper(MemberDAOImpl.class).scrapListPageSearch(parameterDTO);
		
		int virtualNum = 0;
		
		for (MemberVO vo : lists)
		{
			virtualNum = totalRecordCount++;
			vo.setVirtualNum(virtualNum);
		}
	
		model.addAttribute("lists", lists);
		
		return "Member/MyScrapTap10";
	}
}