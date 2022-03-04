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
			
			String id = ((MemberVO)session.getAttribute("siteUserInfo")).getId();
			String idx = req.getParameter("idx");
			
			int likeResult = sqlSession.getMapper(LikeDAOImpl.class).checkLike(id, idx);
			
			//int LikeCount=sqlSession.getMapper(LikeDAOImpl.class).count(id, idx,lno);
			System.out.println("좋아요다 이자식아 : " + likeResult);
			session.setAttribute("likeResult", likeResult);
			//session.setAttribute("lno", LikeCount);
			session.setAttribute("like_id", id);
			session.setAttribute("like_idx", idx);
			//System.out.println("=====LikeCount는==="+LikeCount);
			
			
			
			//session.setAttribute("lno", LikeCount);
			//System.out.println("=====LikeCount는==="+LikeCount);
			
			if(likeResult==0) {
				//insert문을 실행시 입력에 성공한 행의 갯수가 정수로 반환된다 얘 머임
				int result= sqlSession.getMapper(LikeDAOImpl.class).create(
				req.getParameter("lno"),req.getParameter("idx"),
				((MemberVO)session.getAttribute("siteUserInfo")).getId());
				System.out.println("입력한 결과"+result);
			}
			else if(likeResult==1) {
				//삭제처리를 위해 delete() 호출
				sqlSession.getMapper(LikeDAOImpl.class).delete(
				((MemberVO)session.getAttribute("siteUserInfo")).getId(),
				req.getParameter("idx"));
			}
			
			model.addAttribute("idx",req.getParameter("idx"));
			model.addAttribute("id", id);
			session.setAttribute("Lid", id);
			
			return "redirect:reviewView.do?idx="+ idx + "&id=" + id;
		  
	}
	  
	  @RequestMapping(value="/scrap.do", method=RequestMethod.POST)
	  public String scrap_create(Model model, HttpServletRequest req, HttpSession session){
	    //System.out.println("--> like() created");
		//로그인확인
			if(session.getAttribute("siteUserInfo")==null) {
				//만약 세션이 끊어졌다면 로그인페이지로 이동한다.
				return "redirect:login.do";
			}  
			
			String id = ((MemberVO)session.getAttribute("siteUserInfo")).getId();
			String idx = req.getParameter("idx");
			String scrapNo = req.getParameter("scrapNo");
			
			int ScrapCount=sqlSession.getMapper(LikeDAOImpl.class).scrap_count(id, idx,scrapNo);
			
			session.setAttribute("scrapNo", ScrapCount);
			System.out.println("=====ScrapCount는==="+ScrapCount);
			
			if(ScrapCount==0) {
				//insert문을 실행시 입력에 성공한 행의 갯수가 정수로 반환된다 얘 머임
				int result= sqlSession.getMapper(LikeDAOImpl.class).scrap_create(
				req.getParameter("scrapNo"),req.getParameter("idx"),
				((MemberVO)session.getAttribute("siteUserInfo")).getId());
				System.out.println("입력한 결과"+result);
				
				model.addAttribute("scrapNo",req.getParameter("scrapNo"));
				model.addAttribute("idx",req.getParameter("idx"));
				model.addAttribute("id",req.getParameter("id"));
			}
			if(ScrapCount==1) {
				//삭제처리를 위해 delete() 호출
				sqlSession.getMapper(LikeDAOImpl.class).scrap_delete(
				((MemberVO)session.getAttribute("siteUserInfo")).getId(),
				req.getParameter("idx"));
				
				model.addAttribute("idx",req.getParameter("idx"));
				model.addAttribute("id",req.getParameter("id"));
			}
			
			
			int result = sqlSession.getMapper(LikeDAOImpl.class).checkScrap(id, idx);
			
			System.out.println("스크랩이다 이자식아 : " + result);
			session.setAttribute("scrapResult", result);
			
			return "redirect:reviewView.do?idx="+ idx;
		  
	}
	  
}
