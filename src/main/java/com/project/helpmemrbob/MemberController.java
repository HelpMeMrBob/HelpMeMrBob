package com.project.helpmemrbob;
	
import javax.servlet.http.HttpServletRequest;	
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import member.model.MemberDAOImpl;
import member.model.MemberVO;


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
			mv.setViewName("redirect:/");
			return mv;
		}
		
		/*
		 * // 로그인을 하지 않은 상태에서 페이지 진입했을때 사용 String backUrl =
		 * req.getParameter("backUrl"); if (backUrl == null || backUrl.equals("")) {
		 * mv.setViewName("Member/Login"); } else { mv.setViewName(backUrl); } return
		 * mv;
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
				
		return "Member/MyPage";
	}
	
	
	// 나의 작성 리스트 페이지 이동
	@RequestMapping("/mylist.do")
	public String myList(Model model)
	{
		return "Member/MyList";
	}
	
	//	회원 정보 수정 페이지 이동
	@RequestMapping("/memberUpdate.do")
	public String memberUpdate(Model model, HttpServletRequest req, HttpSession session)
	{
		if (session.getAttribute("siteUserInfo") == null)
		{
			return "redirect:login.do";
		}
				
		return "Member/MemberUpdate";
	}
	
	//	회원 정보 수정 처리
	@RequestMapping("/memberUpdateAction.do")
	public String memberUpdateAction(HttpSession session, MemberVO vo)
	{	
		if (session.getAttribute("siteUserInfo") == null)
		{
			return "redirect:login.do";
		}
		
		sqlSession.getMapper(MemberDAOImpl.class).memberUpdateAction(vo);
		System.out.println("회원 정보 수정 완료");
		
		return "Member/MyPage";
	}
}