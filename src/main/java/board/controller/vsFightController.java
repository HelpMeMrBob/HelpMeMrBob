package board.controller;

import java.lang.reflect.Parameter;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import admin.command.AdVSViewCommand;
import admin.command.AdminCommandImpl;
import admin.model.AdVSTalkDAO;
import admin.model.AdVSTalkDTO;
import board.command.vsFightDAOImpl;
import board.model.ParameterDTO;
import board.model.vsFight1VO;
import member.model.MemberVO;
import util.PagingUtil;
import util.PagingUtil2;

@Controller
public class vsFightController {

	/*
	 * Mybatis를 사용하기 위해 빈을 자동주입 받는다. servlet-context.xml에서 생성함
	 */
	private SqlSession sqlSession;
	
	AdminCommandImpl command =null;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		System.out.println("Mybatis 사용 준비 끝");
	}
	
	
	@RequestMapping("/VSFight.do")
	public String VSFightList(Model model, HttpServletRequest req, HttpSession session ) {
	
		//방명록 테이블의 게시물 갯수 카운트
		int totalRecordCount1=sqlSession.getMapper(vsFightDAOImpl.class)
				.getTotalCount1();
		
		
		
		
		
		//페이지 처리를 위한 설정값
		int pageSize=4;//한 페이지당 출력할 게시물의 갯수
		int blockPage=2;//한 블럭당 출력할 페이지 번호의 갯수
		//전체 페이지 수 계산
		int totalPage=(int)Math.ceil((double)totalRecordCount1/pageSize);
		//현재페이지 번호 설정
		/*
		 방명록URL?nowPage=		->이 경우 페이지번호는 빈값
		 방명록URL?nowPage=10		->10으로 설정
		 방명록URL				->null로 판단
		 */
		//페이지 번호가 null이거나 빈값인 경우 1페이지로 설정한다.
		int nowPage=(req.getParameter("nowPage")==null || req.getParameter("nowPage").equals(""))
				? 1:Integer.parseInt(req.getParameter("nowPage"));
		//해당 페이지에 출력할 게시물의 구간을 계산한다.
		int start=(nowPage-1)*pageSize+1;
		int end=nowPage*pageSize;
		
		String pagingImg=
				PagingUtil.pagingImg(totalRecordCount1,pageSize, blockPage, nowPage,
						req.getContextPath()+"/VSFight.do?");
		model.addAttribute("pagingImg",pagingImg);
/////오른쪽댓글페이징/////////////////////////////////////////////		
		int totalRecordCount2=sqlSession.getMapper(vsFightDAOImpl.class)
				.getTotalCount2();
		
		session.setAttribute("totalFight2", totalRecordCount2);
		
		
		
		//페이지 처리를 위한 설정값
		int pageSize2=4;//한 페이지당 출력할 게시물의 갯수
		int blockPage2=2;//한 블럭당 출력할 페이지 번호의 갯수
		//전체 페이지 수 계산
		int totalPage2=(int)Math.ceil((double)totalRecordCount2/pageSize2);
		//현재페이지 번호 설정
		/*
		 방명록URL?nowPage=		->이 경우 페이지번호는 빈값
		 방명록URL?nowPage=10		->10으로 설정
		 방명록URL				->null로 판단
		 */
		//페이지 번호가 null이거나 빈값인 경우 1페이지로 설정한다.
		int nowPage2=(req.getParameter("nowPage2")==null || req.getParameter("nowPage2").equals(""))
				? 1:Integer.parseInt(req.getParameter("nowPage2"));
		//해당 페이지에 출력할 게시물의 구간을 계산한다.
		int start2=(nowPage2-1)*pageSize2+1;
		int end2=nowPage2*pageSize2;
		
		String pagingImg2=
				PagingUtil2.pagingImg2(totalRecordCount2,pageSize2, blockPage2, nowPage2,
						req.getContextPath()+"/VSFight.do?");
		model.addAttribute("pagingImg2",pagingImg2);	
		
//////사진과 주제//////////////////////////////////////////////////////////////////////
		ArrayList<AdVSTalkDTO> adList=
				sqlSession.getMapper(vsFightDAOImpl.class).adList();
		
		String topic = null;
		String sFile1 = null;
		String sFile2 = null;
		int idx=0;
		for(AdVSTalkDTO addto: adList)
		{
			topic=addto.getTopic();
			addto.setTopic(topic);
			
			sFile1=addto.getSfile1();
			addto.setSfile1(sFile1);
			
			sFile2=addto.getSfile2();
			addto.setSfile2(sFile2);
			
			idx=addto.getIdx();
			addto.setIdx(idx);
		}
		
		model.addAttribute("topic",topic);
		model.addAttribute("sFile1",sFile1);
		model.addAttribute("sFile2",sFile2);
		model.addAttribute("idx",idx);
		
		
//1왼쪽댓글리스트///////////////////////////////////////		
		
		ArrayList<vsFight1VO> lists=
				sqlSession.getMapper(vsFightDAOImpl.class).listPage1(start, end, idx);
		/*
		 * System.out.println("토픽값 있나용"+topic); System.out.println("sFile1 있나용"+sFile1);
		 * System.out.println("sFile2 있나용"+sFile2);
		 */
		for(vsFight1VO dto: lists)
		{
			String temp=dto.getContents().replace("\r\n", "<br/>");
			dto.setContents(temp);
		}
		model.addAttribute("lists",lists);
///////////////////idx해당 댓글 갯수 받자
		int count1=sqlSession.getMapper(vsFightDAOImpl.class).count(idx);
		session.setAttribute("count1", count1);
		
		int count2=sqlSession.getMapper(vsFightDAOImpl.class).count(idx);
		session.setAttribute("count2", count2);
//////오른쪽댓글 리스트//////////////////////////////////////////////////////////////////////		
		
		ArrayList<vsFight1VO> lists2=
				sqlSession.getMapper(vsFightDAOImpl.class).listPage2(start2, end2, idx);
		/*
		 * System.out.println("토픽값 있나용"+topic); System.out.println("sFile1 있나용"+sFile1);
		 * System.out.println("sFile2 있나용"+sFile2);
		 */
		for(vsFight1VO dto: lists2)
		{
			String temp=dto.getContents().replace("\r\n", "<br/>");
			dto.setContents(temp);
		}
		model.addAttribute("lists2",lists2);
		
		return "main/vsFight";
	}
	
	
	
	
	


//////////// 왼쪽 댓글쓰기
		@RequestMapping(value = "/FightWrite1.do", method = RequestMethod.POST)
		public String FightwriteAction1(Model model, HttpServletRequest req, HttpSession session, vsFight1VO vsFight1VO) {
			// 로그인확인
			if (session.getAttribute("siteUserInfo") == null) {
				// 만약 세션이 끊어졌다면 로그인페이지로 이동한다.
				return "redirect:login.do";
			}
			
			
			model.addAttribute("req", req);
			model.addAttribute("vsFight1VO", vsFight1VO);

			model.addAttribute("rno", req.getParameter("rno"));
			model.addAttribute("nowPage", req.getParameter("nowPage"));

			String rno = req.getParameter("rno");
			System.out.println(rno);

			String Sidx=req.getParameter("idx");
			int idx=Integer.parseInt(Sidx);
			
			// insert문을 실행시 입력에 성공한 행의 갯수가 정수로 반환된다 얘 머임.
			int result = sqlSession.getMapper(vsFightDAOImpl.class).write1(req.getParameter("contents"), 
					idx,
					((MemberVO) session.getAttribute("siteUserInfo")).getId());
			System.out.println("입력한 결과" + result);

			return "redirect:VSFight.do";
		}
		
		
		
////////////오른쪽 댓글쓰기
	@RequestMapping(value = "/FightWrite2.do", method = RequestMethod.POST)
	public String FightwriteAction2(Model model, HttpServletRequest req, HttpSession session, vsFight1VO vsFight1VO) {
		// 로그인확인
		if (session.getAttribute("siteUserInfo") == null) {
			// 만약 세션이 끊어졌다면 로그인페이지로 이동한다.
			return "redirect:login.do";
		}
		
		
		model.addAttribute("req", req);
		model.addAttribute("vsFight1VO", vsFight1VO);

		model.addAttribute("rno", req.getParameter("rno"));
		model.addAttribute("nowPage2", req.getParameter("nowPage2"));

		String rno = req.getParameter("rno");
		System.out.println(rno);

		String Sidx=req.getParameter("idx");
		int idx=Integer.parseInt(Sidx);
		
		// insert문을 실행시 입력에 성공한 행의 갯수가 정수로 반환된다 얘 머임.
		int result = sqlSession.getMapper(vsFightDAOImpl.class).write2(req.getParameter("contents"), 
				idx,
				((MemberVO) session.getAttribute("siteUserInfo")).getId());
		System.out.println("입력한 결과" + result);

		return "redirect:VSFight.do";
	}
		
		
		
		
		
		

	// 수정페이지 진입하기
	//너 이거 리턴페이지 설정 안했음
	@RequestMapping("/fightModify.do")
	public String fightModify(Model model, HttpServletRequest req, HttpSession session) {
		// 수정페이지 진입시에도 로그인 확인해야함
		if (session.getAttribute("siteUserInfo") == null) {
			return "redirect:login.do";
		}

		/*
		 * 파라미터를 전달하는 4번째 방법으로 DTO(혹은 VO) 객체에 파라미터를 저장한 후 Mapper로 전달한다.
		 */
		ParameterDTO parameterDTO = new ParameterDTO();
		// 일련번호 저장
		parameterDTO.setBoard_idx(req.getParameter("rno"));
		// 사용자 아이디 저장
		parameterDTO.setUser_id(((MemberVO) session.getAttribute("siteUserInfo")).getId());

		// view() 메서드로 앞에서 저장된 DTO객체를 매개변수로 전달한다.
		vsFight1VO dto = sqlSession.getMapper(vsFightDAOImpl.class).view(req.getParameter("rno"), 
				((MemberVO) session.getAttribute("siteUserInfo")).getId());

		model.addAttribute("dto", dto);
		return "main/contact7";
	}

	// 수정처리
	@RequestMapping("/fightModifyAction.do")
	public String fightModifyAction(HttpSession session, vsFight1VO vsFight1VO, HttpServletRequest req) {
		// 수정처리에서 전송된 폼값은 커맨드객체를 통해 한꺼번에 받는다.
		String rno = req.getParameter("rno");
		String idx = req.getParameter("idx");
		System.out.println("와라!!!!!!!!!!!!!!!!!"+rno);
		// 수정처리 전 로그인 확인
		if (session.getAttribute("siteUserInfo") == null) {
			return "redirect:login.do";
		}
		// 수정처리를 위해 modify 메서드 호출
		int applyRow = sqlSession.getMapper(vsFightDAOImpl.class).modify(vsFight1VO);
		System.out.println("수정처리된 레코드 수:" + applyRow);
		// 방명록 게시판은 상세보기 페이지가 별도로 없으므로 리스트로 이동하면 된다.
		//return "redirect:reviewView.do?rno=" + rno;
		return "redirect:VSFight.do?idx="+idx;
	}

	// 삭제처리
	@RequestMapping("/Fightdelete1.do")
	public String Fightdelete1(HttpServletRequest req, HttpSession session) {
		// 로그인 확인 요거 시큐리티가 알아서 해준대 대단하징?
		if (session.getAttribute("siteUserInfo") == null) {
			return "redirect:login.do";
		}
		// 삭제처리를 위해 delete() 호출
		sqlSession.getMapper(vsFightDAOImpl.class).delete1(req.getParameter("rno"),
				((MemberVO) session.getAttribute("siteUserInfo")).getId());
		String rno = req.getParameter("rno");
		//return "redirect:reviewView.do?rno=" + rno;
		return "redirect:VSFight.do?rno="+rno;
	}
	// 삭제처리
		@RequestMapping("/Fightdelete2.do")
		public String Fightdelete2(HttpServletRequest req, HttpSession session) {
			// 로그인 확인 요거 시큐리티가 알아서 해준대 대단하징?
			if (session.getAttribute("siteUserInfo") == null) {
				return "redirect:login.do";
			}
			// 삭제처리를 위해 delete() 호출
			sqlSession.getMapper(vsFightDAOImpl.class).delete2(req.getParameter("rno"),
					((MemberVO) session.getAttribute("siteUserInfo")).getId());
			String rno = req.getParameter("rno");
			//return "redirect:reviewView.do?rno=" + rno;
			return "redirect:VSFight.do?rno="+rno;
		}
}
