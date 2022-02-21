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
import util.PagingUtil;

@Controller
public class MybatisController {

	/*
	Mybatis를 사용하기 위해 빈을 자동주입 받는다.
	servlet-context.xml에서 생성함
	 */
	private SqlSession sqlSession;
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
		System.out.println("Mybatis 사용 준비 끝");
	}
	//댓글ㅎㅎ
	@RequestMapping("/mybatis/list.do")
	public String list(Model model, HttpServletRequest req) {
		//댓 갯수 카운트
		int totalRecordCount=sqlSession.getMapper(MybatisDAOImpl.class)
				.getTotalCount();
		//페이지 처리를 위한 설정값
		int pageSize=4;//한 페이지당 출력할 게시물의 갯수
		int blockPage=2;//한 블럭당 출력할 페이지 번호의 갯수
		//전체 페이지 수 계산
		int totalPage=(int)Math.ceil((double)totalRecordCount/pageSize);
		//현재페이지 번호 설정
		//페이지 번호가 null이거나 빈값인 경우 1페이지로 설정한다.
		int nowPage=(req.getParameter("nowPage")==null || req.getParameter("nowPage").equals(""))
				? 1:Integer.parseInt(req.getParameter("nowPage"));
		//해당 페이지에 출력할 게시물의 구간을 계산한다.
		int start=(nowPage-1)*pageSize+1;
		int end=nowPage*pageSize;
		
		/*
		 서비스 역할의 인터페이스의 추상메서드를 호출하면 mapper가 동작됨
		 전달된 파라미터는 #{param1}과 같이 순서대로 사용한다.
		 */
		ArrayList<BoardReplyVO> lists=
				sqlSession.getMapper(MybatisDAOImpl.class).listPage(start, end);
		String pagingImg=
				PagingUtil.pagingImg(totalRecordCount,pageSize, blockPage, nowPage,
						req.getContextPath()+"/mybatis/list.do?");
		model.addAttribute("pagingImg",pagingImg);
		
		for(BoardReplyVO dto: lists)
		{
			String temp=dto.getContents().replace("\r\n", "<br/>");
			dto.setContents(temp);
		}
		model.addAttribute("lists",lists);
		
		return "main/blog-single2";
	}
	 
	//글쓰기 페이지 매핑
	@RequestMapping("/mybatis/write.do")
	public String write(Model model, HttpSession session, HttpServletRequest req) {
		/*
		 매핑된 메서드 내에서 session 내장객체를 사용하기 위해 매개변수로 선언해준다.
		 */
		//session 영역에 해당 속성이 없다면 로그아웃 상태이므로 로그인페이지로 이동한다.
		if(session.getAttribute("siteUserInfo")==null) {
			/*
			현재상태는 글쓰기를 위해 버튼을 클릭했으므로, 만약 로그인이 완료된다면
			글쓰기 페이지로 이동하는 것이 좋다. 따라서 backUrl이라는 파라미터에
			쓰기페이지의 View 경로를 붙여서 리다이렉트 시킨다.
			 */
			model.addAttribute("backUrl","07Mybatis/write");
			return "redirect:login.do";
		}
		//로그인이 완료된 상태라면 쓰기 페이지로 진입한다.
		return "07Mybatis/write";
	}
	//로그인 페이지 매핑 
	@RequestMapping("/mybatis/login.do")
	public String login(Model model) {
		return "07Mybatis/login";
	}
	//로그인처리(session객체 사용)
	@RequestMapping("/mybatis/loginAction.do")
	public ModelAndView loginAction(HttpServletRequest req, HttpSession session) {
		//폼값으로 전송된 id, pass를 매개변수로 전달하여 Mapper 호출
		MemberVO vo=sqlSession.getMapper(MybatisMemberImpl.class)
				.login(req.getParameter("id"), req.getParameter("pass"));
		ModelAndView mv=new ModelAndView();
		if(vo==null) {
			//로그인에 실패한 경우(정보 불일치 등)
			mv.addObject("LoginNG","아이디/패스워드가 틀렸습니다.");
			//로그인 페이지로 다시 돌아간다.
			mv.setViewName("07Mybatis/login");
			return mv;
		}
		else {
			//로그인에 성공한 경우 세션영역에 MemberVO객체를 저장한다.
			session.setAttribute("siteUserInfo", vo);
		}
		//글쓰기 페이지로의 진입에 실패한 경우라면 backUrl을 통해 글쓰기 페이지로 이동시킨다.
		String backUrl=req.getParameter("backUrl");
		if(backUrl==null|| backUrl.equals("")) {
			//디폴트로 이동할 페이지는 로그인이다.
			mv.setViewName("07Mybatis/login");
		}
		else {
			mv.setViewName(backUrl);
		}
		return mv;
	}
	
	//댓글쓰기
	@RequestMapping(value="/replyWrite.do",
			method=RequestMethod.POST)
	public String writeAction(Model model, HttpServletRequest req, HttpSession session, BoardReplyVO boardReplyVO) {
		//로그인확인
		if(session.getAttribute("siteUserInfo")==null) {
			//만약 세션이 끊어졌다면 로그인페이지로 이동한다.
			return "redirect:login.do";
		}
		//insert문을 실행시 입력에 성공한 행의 갯수가 정수로 반환된다.
				int result= sqlSession.getMapper(MybatisDAOImpl.class).write(
						req.getParameter("name"),
						req.getParameter("contents"),
						((MemberVO)session.getAttribute("siteUserInfo")).getId());
				System.out.println("입력한 결과"+result);
				
				model.addAttribute("req",req);
				model.addAttribute("BoardReplyVO",boardReplyVO);
				
				model.addAttribute("idx",req.getParameter("idx"));
				model.addAttribute("nowPage",req.getParameter("nowPage"));
				
				return "redirect:reviewView.do";
			}
	//수정페이지 진입하기
	@RequestMapping("/mybatis/modify.do")
	public String modify(Model model, HttpServletRequest req,
			HttpSession session) {
		//수정페이지 진입시에도 로그인 확인해야함
		if(session.getAttribute("siteUserInfo")==null) {
			return "redirect:login.do";
		}
		
		/*
		 파라미터를 전달하는 4번째 방법으로 DTO(혹은 VO) 객체에 파라미터를 
		 저장한 후 Mapper로 전달한다.
		 */
		ParameterDTO parameterDTO =new ParameterDTO();
		//일련번호 저장
		parameterDTO.setBoard_idx(req.getParameter("idx"));
		//사용자 아이디 저장
		parameterDTO.setUser_id(((MemberVO)session.getAttribute("siteUserInfo")).getId());
		
		//view() 메서드로 앞에서 저장된 DTO객체를 매개변수로 전달한다.
		BoardReplyVO dto=sqlSession.getMapper(MybatisDAOImpl.class).view(parameterDTO);
		
		model.addAttribute("dto",dto);
		return "07Mybatis/modify";
	}
	//수정처리
	@RequestMapping("/mybatis/modifyAction.do")
	public String modifyAction(HttpSession session, BoardReplyVO boardReplyVO) {
		//수정처리에서 전송된 폼값은 커맨드객체를 통해 한꺼번에 받는다.
		
		//수정처리 전 로그인 확인 
		if(session.getAttribute("siteUserInfo")==null) {
			return "redirect:login.do";
		}
		//수정처리를 위해 modify 메서드 호출
		int applyRow=sqlSession.getMapper(MybatisDAOImpl.class).modify(boardReplyVO);
		System.out.println("수정처리된 레코드 수:"+applyRow);
		//방명록 게시판은 상세보기 페이지가 별도로 없으므로 리스트로 이동하면 된다.
		return "redirect:list.do";
	}
	//삭제처리
	@RequestMapping("/mybatis/delete.do")
	public String delete(HttpServletRequest req, HttpSession session) {
		//로그인 확인 요거 시큐리티가 알아서 해준대 대단하징?
		if(session.getAttribute("siteUserInfo")==null) {
			return "redirect:login.do";
		}
		//삭제처리를 위해 delete() 호출
		sqlSession.getMapper(MybatisDAOImpl.class).delete(
				req.getParameter("idx"),
				((MemberVO)session.getAttribute("siteUserInfo")).getId());
		return "redirect:list.do";
	}
}
