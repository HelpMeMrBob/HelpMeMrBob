package board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import board.command.LikeDAOImpl;
import board.model.LikeVO;
import member.model.MemberVO;

@Controller
public class LikeController {
	
	/*
	Mybatis를 사용하기 위해 빈을 자동주입 받는다.
	servlet-context.xml에서 생성함
	 */
	private SqlSession sqlSession;
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}

	
	@RequestMapping(value="/like.do", method=RequestMethod.POST)
	public String create(Model model, HttpServletRequest req, HttpSession session){
	    //System.out.println("--> like() created");
		//로그인확인
		if(session.getAttribute("siteUserInfo")==null) {
			//만약 세션이 끊어졌다면 로그인페이지로 이동한다.
			return "redirect:login.do";
		}  
		
		//현재 로그인 한 사람의 ID
		String id = ((MemberVO)session.getAttribute("siteUserInfo")).getId();
		//현재 게시글의 인덱스
		String idx = req.getParameter("idx");
		
		//현재 로그인 한 사람이 현재 게시글에 좋아요를 했는지 안했는지 확인 (했으면 1, 안했으면 0)
		int likeResult = sqlSession.getMapper(LikeDAOImpl.class).checkLike(id, idx);
		
		//int LikeCount=sqlSession.getMapper(LikeDAOImpl.class).count(id, idx,lno);
		System.out.println("좋아요다 이자식아 : " + likeResult);
		//System.out.println("=====LikeCount는==="+LikeCount);
		//session.setAttribute("lno", LikeCount);
		//System.out.println("=====LikeCount는==="+LikeCount);
		
		if(likeResult==0) {
			//insert문을 실행시 입력에 성공한 행의 갯수가 정수로 반환된다 얘 머임
			int result= sqlSession.getMapper(LikeDAOImpl.class).create(
			req.getParameter("lno"),req.getParameter("idx"),
			((MemberVO)session.getAttribute("siteUserInfo")).getId());
			System.out.println("입력한 결과"+result);
			likeResult = 1;
		}
		else if(likeResult==1) {
			//삭제처리를 위해 delete() 호출
			sqlSession.getMapper(LikeDAOImpl.class).delete(
			((MemberVO)session.getAttribute("siteUserInfo")).getId(),
			req.getParameter("idx"));
			likeResult = 0;
		}
		
		model.addAttribute("likeResult", likeResult);
		model.addAttribute("like_id", id);
		model.addAttribute("like_idx", idx);
		
		return "redirect:reviewView.do?idx="+ idx;
	}
	
	@RequestMapping(value="/scrap.do", method=RequestMethod.POST)
	public String scrap_create(Model model, HttpServletRequest req, HttpSession session){
	    //System.out.println("--> like() created");
		//로그인확인
		if(session.getAttribute("siteUserInfo")==null) {
			//만약 세션이 끊어졌다면 로그인페이지로 이동한다.
			return "redirect:login.do";
		}  
		
		//현재 로그인 한 사람의 ID
		String id = ((MemberVO)session.getAttribute("siteUserInfo")).getId();
		//현재 게시글의 인덱스
		String idx = req.getParameter("idx");
		
		int scrapResult = sqlSession.getMapper(LikeDAOImpl.class).checkScrap(id, idx);
		
		if(scrapResult==0) {
			//insert문을 실행시 입력에 성공한 행의 갯수가 정수로 반환된다 얘 머임
			int result= sqlSession.getMapper(LikeDAOImpl.class).scrap_create(
			req.getParameter("scrapNo"),req.getParameter("idx"),
			((MemberVO)session.getAttribute("siteUserInfo")).getId());
			System.out.println("입력한 결과"+result);
			scrapResult = 1;
		}
		else if(scrapResult==1) {
			//삭제처리를 위해 delete() 호출
			sqlSession.getMapper(LikeDAOImpl.class).scrap_delete(
			((MemberVO)session.getAttribute("siteUserInfo")).getId(),
			req.getParameter("idx"));
			scrapResult = 0;
		}
		
		System.out.println("스크랩이다 이자식아 : " + scrapResult);
		
		model.addAttribute("scrapResult", scrapResult);
		model.addAttribute("idx", idx);
		model.addAttribute("id", id);
		
		return "redirect:reviewView.do?idx="+ idx;
	}
}