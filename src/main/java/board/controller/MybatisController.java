package board.controller;

import java.lang.reflect.Parameter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import board.command.MybatisDAOImpl;
import board.model.BoardReplyVO;
import board.model.MybatisMemberImpl;
import board.model.ParameterDTO;
import member.model.MemberVO;
import util.ReplyPagingUtil;

@Controller
public class MybatisController {

	/*
	 * Mybatis를 사용하기 위해 빈을 자동주입 받는다. servlet-context.xml에서 생성함
	 */
	private SqlSession sqlSession;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		System.out.println("Mybatis 사용 준비 끝");
	}
	


	// 댓글쓰기
	@RequestMapping(value = "/replyWrite.do", method = RequestMethod.POST)
	public String writeAction(Model model, HttpServletRequest req, HttpSession session, BoardReplyVO boardReplyVO) {
		// 로그인확인
		if (session.getAttribute("siteUserInfo") == null) {
			// 만약 세션이 끊어졌다면 로그인페이지로 이동한다.
			return "redirect:login.do";
		}
		model.addAttribute("req", req);
		model.addAttribute("BoardReplyVO", boardReplyVO);

		model.addAttribute("idx", req.getParameter("idx"));
		model.addAttribute("nowPage", req.getParameter("nowPage"));

		String idx = req.getParameter("idx");
		System.out.println(idx);

		// insert문을 실행시 입력에 성공한 행의 갯수가 정수로 반환된다 얘 머임.
		int result = sqlSession.getMapper(MybatisDAOImpl.class).write(idx, req.getParameter("name"),
				req.getParameter("contents"), ((MemberVO) session.getAttribute("siteUserInfo")).getId());
		System.out.println("입력한 결과" + result);

		return "redirect:reviewView.do";
	}

	// 수정페이지 진입하기
	@RequestMapping("/modify.do")
	public String modify(Model model, HttpServletRequest req, HttpSession session) {
		// 수정페이지 진입시에도 로그인 확인해야함
		if (session.getAttribute("siteUserInfo") == null) {
			return "redirect:login.do";
		}

		/*
		 * 파라미터를 전달하는 4번째 방법으로 DTO(혹은 VO) 객체에 파라미터를 저장한 후 Mapper로 전달한다.
		 */
		ParameterDTO parameterDTO = new ParameterDTO();
		// 일련번호 저장
		parameterDTO.setBoard_idx(req.getParameter("idx"));
		// 사용자 아이디 저장
		parameterDTO.setUser_id(((MemberVO) session.getAttribute("siteUserInfo")).getId());

		// view() 메서드로 앞에서 저장된 DTO객체를 매개변수로 전달한다.
		BoardReplyVO dto = sqlSession.getMapper(MybatisDAOImpl.class).view(parameterDTO);

		model.addAttribute("dto", dto);
		return "main/contact5";
	}

	// 수정처리
	@RequestMapping("/modifyAction.do")
	public String modifyAction(HttpSession session, BoardReplyVO boardReplyVO, HttpServletRequest req) {
		// 수정처리에서 전송된 폼값은 커맨드객체를 통해 한꺼번에 받는다.
		String idx = req.getParameter("idx");
		// 수정처리 전 로그인 확인
		if (session.getAttribute("siteUserInfo") == null) {
			return "redirect:login.do";
		}
		// 수정처리를 위해 modify 메서드 호출
		int applyRow = sqlSession.getMapper(MybatisDAOImpl.class).modify(boardReplyVO);
		System.out.println("수정처리된 레코드 수:" + applyRow);
		// 방명록 게시판은 상세보기 페이지가 별도로 없으므로 리스트로 이동하면 된다.
		return "redirect:reviewView.do?idx=" + idx;
	}

	// 삭제처리
	@RequestMapping("/Replydelete.do")
	public String delete(HttpServletRequest req, HttpSession session) {
		// 로그인 확인 요거 시큐리티가 알아서 해준대 대단하징?
		if (session.getAttribute("siteUserInfo") == null) {
			return "redirect:login.do";
		}
		// 삭제처리를 위해 delete() 호출
		sqlSession.getMapper(MybatisDAOImpl.class).delete(req.getParameter("idx"),
				((MemberVO) session.getAttribute("siteUserInfo")).getId());
		String idx = req.getParameter("idx");
		return "redirect:reviewView.do?idx=" + idx;
	}
}
