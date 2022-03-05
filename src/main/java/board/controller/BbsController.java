package board.controller;

import java.util.ArrayList;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import board.command.BbsCommandImpl;
import board.command.DeleteActionCommand;
import board.command.EditActionCommand;
import board.command.EditCommand;
import board.command.LikeDAOImpl;
import board.command.ListCommand;
import board.command.MybatisDAOImpl;
import board.command.ViewCommand;
import board.command.WriteActionCommand;
import board.model.BoardDTO;
import board.model.BoardReplyVO;
import board.model.JDBCTemplateDAO;
import board.model.JdbcTemplateConst;
import board.model.LikeVO;
import member.model.MemberVO;
import member.model.ParameterDTO;
import util.ReplyPagingUtil;

@Controller
public class BbsController {
	/*
	 * Mybatis를 사용하기 위해 빈을 자동주입 받는다. servlet-context.xml에서 생성함
	 */
	private SqlSession sqlSession;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		System.out.println("Mybatis 사용 준비 끝");
	}

	BbsCommandImpl command = null;

	private JdbcTemplate template;

	@Autowired
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
		System.out.println("@Autowired->JDBCTemplate 연결성공");
		// JdbcTemplate을 해당 프로그램 전체에서 사용하기 위한 설정(static타입)
		JdbcTemplateConst.template = this.template;
	}

	@RequestMapping("/reviewList.do")
	public String reviewList(Model model, HttpServletRequest req) {

		model.addAttribute("req", req);// request객체 자체를 Model에 저장
		command = new ListCommand();// service역할의 ListCommand객체 생성
		command.execute(model);// 해당 객체로 Model객체 자체를 전달

		return "main/causes-layout";
	}

	@RequestMapping("/Calendar.do")
	public String Calendar(Model model, HttpServletRequest req) {

		return "main/blog-single3";
	}

	// 글쓰기 페이지로 진입하기 위한 매핑처리
	@RequestMapping("/reviewWrite.do")
	public String reviewWrite(HttpSession session) {
		if (session.getAttribute("siteUserInfo") == null) {
			// 만약 세션이 끊어졌다면 로그인페이지로 이동한다.
			return "redirect:login.do";
		}
		ParameterDTO parameterDTO = new ParameterDTO();
		parameterDTO.setId(((MemberVO)session.getAttribute("siteUserInfo")).getId());
		
		return "main/contact4";
	}

	// 전송방식이 post이므로 value, method까지 같이 기술해서 매핑
	@RequestMapping(value = "/writeAction.do", method = RequestMethod.POST)
	public String writeAction(Model model, HttpServletRequest req, BoardDTO boardDTO) {

		model.addAttribute("req", req);
		model.addAttribute("boardDTO", boardDTO);
		// 요청을 전달할 service객체를 생성한 후 execute()메서드 호출
		command = new WriteActionCommand();
		command.execute(model);

		// 뷰를 반환하지 않고, 지정된 URL(요청명)으로 이동한다.
		return "redirect:reviewList.do?nowPage=1";
	}

	// HttpSession session 에러뜨면 얘떄문임
	@RequestMapping("/reviewView.do")
	public String reviewView(Model model,HttpSession session, HttpServletRequest req) {
		// 사용자의 요청을 저장한 request객체를 Model객체에 저장한 후 전달한다.
		model.addAttribute("req", req);
		command = new ViewCommand();
		command.execute(model);

		// 여기는 댓글불러오기
		// 방명록 테이블의 게시물 갯수 카운트
		int totalRecordCount = sqlSession.getMapper(MybatisDAOImpl.class).getTotalCount();
		// 페이지 처리를 위한 설정값
		int pageSize = 4;// 한 페이지당 출력할 게시물의 갯수
		int blockPage = 2;// 한 블럭당 출력할 페이지 번호의 갯수
		// 전체 페이지 수 계산
		int totalPage = (int) Math.ceil((double) totalRecordCount / pageSize);
		// 현재페이지 번호 설정
		/*
		 * 방명록URL?nowPage= ->이 경우 페이지번호는 빈값 방명록URL?nowPage=10 ->10으로 설정 방명록URL ->null로
		 * 판단
		 */
		// 페이지 번호가 null이거나 빈값인 경우 1페이지로 설정한다.
		int nowPage = (req.getParameter("nowPage") == null || req.getParameter("nowPage").equals("")) ? 1
				: Integer.parseInt(req.getParameter("nowPage"));
		// 해당 페이지에 출력할 게시물의 구간을 계산한다.
		int start = (nowPage - 1) * pageSize + 1;
		int end = nowPage * pageSize;

		model.addAttribute("idx", req.getParameter("idx"));
		String idx = req.getParameter("idx");
		/*
		 * 서비스 역할의 인터페이스의 추상메서드를 호출하면 mapper가 동작됨 전달된 파라미터는 #{param1}과 같이 순서대로 사용한다.
		 */
		ArrayList<BoardReplyVO> lists = sqlSession.getMapper(MybatisDAOImpl.class).listPage(start, end, idx);
		
		////////////////좋아요버튼//////////////////////////
		
		
		String pagingImg = ReplyPagingUtil.ReplypagingImg(totalRecordCount, pageSize, blockPage, nowPage,
				req.getContextPath() + "/reviewView.do?", idx);
		model.addAttribute("pagingImg", pagingImg);

		for (BoardReplyVO dto : lists) {
			String temp = dto.getContents().replace("\r\n", "<br/>");
			dto.setContents(temp);
		}
		model.addAttribute("lists", lists);
		// 댓글불러오기끝

		System.out.println(start + "=" + end + "=" + idx);
		System.out.println(lists.size());
		
		String id = ((MemberVO)session.getAttribute("siteUserInfo")).getId();
		String likeResult = req.getParameter("likeResult");
		String scrapResult = req.getParameter("scrapResult");
		
		if (likeResult == null) {
			int result = sqlSession.getMapper(LikeDAOImpl.class).checkLike(id, idx);
			likeResult = String.valueOf(result);
		}
		if (scrapResult == null) {
			int result = sqlSession.getMapper(LikeDAOImpl.class).checkScrap(id, idx);
			scrapResult = String.valueOf(result);
		}
		
		model.addAttribute("id", id);
		model.addAttribute("idx", idx);
		model.addAttribute("likeResult", likeResult);
		model.addAttribute("scrapResult", scrapResult);

		return "main/blog-single2";
	}

	// 패스워드 검색페이지 진입
	@RequestMapping("/reviewId.do")
	public String password(Model model, HttpServletRequest req) {
		// 일련번호는 컨트롤러에세 파라미터를 받은 후 Model에 저장하여 View로 전달함
		model.addAttribute("idx", req.getParameter("idx"));
		return "main/password";
	}

	// 글쓰기 페이지로 진입하기 위한 매핑처리
	@RequestMapping("/reviewEdit.do")
	public String reviewEdit(Model model, HttpServletRequest req) {

		model.addAttribute("req", req);
		command = new EditCommand();
		command.execute(model);
		return "main/contact6";
	}

	// 수정처리
	@RequestMapping("/editAction.do")
	public String editAction(HttpServletRequest req, Model model, BoardDTO boardDTO) {
		/*
		 * request내장객체와 수정페이지에서 전송한 모든 폼값을 저장한 DTO객체를 Model에 저장한 후 서비스 객체로 전달한다.
		 */
		model.addAttribute("req", req);
		model.addAttribute("boardDTO", boardDTO);
		command = new EditActionCommand();
		command.execute(model);
		/*
		 * 수정처리가 완료되면 상세페이지로 이동하게 되는데 이때 idx와 같은 파라미터가 필요하다. Model객체에 저장한 후 redirect하면
		 * 자동으로 쿼리스트링 형태로 만들어준다.
		 */
		model.addAttribute("idx", req.getParameter("idx"));
		model.addAttribute("nowPage", req.getParameter("nowPage"));

		return "redirect:reviewView.do";

	}

	// 여기가 에러
	@RequestMapping("/reviewEditAction2.do")
	public String reviewEditAction2(HttpServletRequest req, Model model, BoardDTO boardDTO) {
		/*
		 * request내장객체와 수정페이지에서 전송한 모든 폼값을 저장한 DTO객체를 Model에 저장한 후 서비스 객체로 전달한다.
		 */
		model.addAttribute("req", req);
		model.addAttribute("boardDTO", boardDTO);
		command = new EditActionCommand();
		command.execute(model);
		/*
		 * 수정처리가 완료되면 상세페이지로 이동하게 되는데 이때 idx와 같은 파라미터가 필요하다. Model객체에 저장한 후 redirect하면
		 * 자동으로 쿼리스트링 형태로 만들어준다.
		 */
		model.addAttribute("idx", req.getParameter("idx"));
		model.addAttribute("nowPage", req.getParameter("nowPage"));

		return "redirect:reviewView.do";

	}

	// 삭제
	@RequestMapping("/deleteAction.do")
	public String deleteAction(HttpServletRequest req, Model model, BoardDTO boardDTO) {
		/*
		 * request내장객체와 수정페이지에서 전송한 모든 폼값을 저장한 DTO객체를 Model에 저장한 후 서비스 객체로 전달한다.
		 */
		model.addAttribute("req", req);
		command = new DeleteActionCommand();
		command.execute(model);

		model.addAttribute("idx", req.getParameter("idx"));
		model.addAttribute("nowPage", req.getParameter("nowPage"));

		return "redirect:reviewList.do";
	}
	

}