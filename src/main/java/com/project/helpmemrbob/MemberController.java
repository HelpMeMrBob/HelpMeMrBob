package com.project.helpmemrbob;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberDAOImpl;
import member.model.MemberVO;
import member.model.ParameterDTO;
import point.PointDAO;
import point.PointDTO;
import util.PagingUtil;


@Controller
public class MemberController
{
	private SqlSession sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession)
	{
		this.sqlSession = sqlSession;
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
			session.setAttribute("siteUserInfo", vo);
			mv.setViewName("redirect:/");
			return mv;
		}
	
	}
	
	//	카카오 로그인
	@RequestMapping(value = "/kakaologin.do", method = RequestMethod.POST)
	public ModelAndView kakaoLogin(@RequestParam Map<String, Object> map, HttpSession session)
	{
		ModelAndView mv = new ModelAndView();
		
		String id = (String)map.get("id");
		String name = (String)map.get("name");
		String email = (String)map.get("email");
		
		MemberVO memberVO = new MemberVO();
		
		memberVO.setId(id);
		memberVO.setName(name);
		memberVO.setEmail(email);
		
		//	할때마다 동의여부가 떠서 회원가입 한번하면 무조건 오류.. 어떻게 해야할지
		//	sqlSession.getMapper(MemberDAOImpl.class).kakaoRegisterAction(memberVO);
		
		String kid = memberVO.getId();
		String kname = memberVO.getName();
		String kemail = memberVO.getEmail();
		
		MemberVO vo
			= sqlSession.getMapper(MemberDAOImpl.class).kakaoLogin(kid, kname, kemail);
		
		
		
		System.out.println(vo.getId());
		
		session.setAttribute("siteUserInfo", vo);
		mv.setViewName("redirect:/");
		return mv;
	}
	
	//	로그아웃 처리
	@RequestMapping("/logout.do")
	public ModelAndView logout(HttpSession session)
	{
		session.invalidate();
		
		ModelAndView mv = new ModelAndView("redirect:/");
		return mv;
	}
	
	//	아이디·비밀번호 찾기 페이지 이동
	@RequestMapping("/findIdPassword.do")
	public String findIdPasswordPage()
	{
		return "Member/FindIdPassword";
	}
	
	//	아이디 찾기
	@RequestMapping("/findId.do")
	public ModelAndView findIdAction(HttpServletRequest req, HttpSession session)
	{
		MemberVO vo = sqlSession.getMapper(MemberDAOImpl.class)
				  .findId(req.getParameter("name"), req.getParameter("email"));
	
		ModelAndView mv = new ModelAndView();
		session.setAttribute("findId", vo);
		
		mv.setViewName("Member/FindResult");
		
		return mv;
	}
	
	//	비밀번호 찾기
	@RequestMapping("/findPassword.do")
	public ModelAndView findPasswordAction(HttpServletRequest req, HttpSession session)
	{
		MemberVO vo = sqlSession.getMapper(MemberDAOImpl.class)
				.findPassword(req.getParameter("id"), req.getParameter("email"));
		
		ModelAndView mv = new ModelAndView();
		session.setAttribute("findPassword", vo);
	
		String host = "smtp.naver.com";
		final String username = "junh0y";
		final String password = "yyjh0323!";
		int port = 465;
		
		String to = vo.getEmail();
		String subject = "[Help me, Mr.Bob!] 비밀번호 찾기 메일 발송";
		String content = vo.getName() +"님의 비밀번호는"+ vo.getPass() +"입니다.";
		
		Properties props = System.getProperties();
		
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host);
		
		Session sessionM = Session.getDefaultInstance(props, new javax.mail.Authenticator()
			{
				String userName = username;
				String passWord = password;
				protected PasswordAuthentication getPasswordAuthentication()
				{
					return new PasswordAuthentication(userName, passWord);
				}
			}
		);

		sessionM.setDebug(true);
		
		Message mimeMessage = new MimeMessage(sessionM);
		try
		{
			mimeMessage.setFrom(new InternetAddress("junh0y@naver.com"));
			mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
			mimeMessage.setSubject(subject);
			mimeMessage.setText(content);
			Transport.send(mimeMessage);
		}
		catch (AddressException e)
		{
			e.printStackTrace();
		}
		catch (MessagingException e)
		{
			e.printStackTrace();
		}
		
		mv.setViewName("Member/FindResult");
		
		return mv;
	}

	//	고객센터 페이지 이동
	@RequestMapping("/customerService.do")
	public String customerService()
	{		
		return "Member/CustomerService";
	}
	
	//	고객센터 이메일 전송
	@RequestMapping("/customerServiceSend.do")
	public String customerServiceSend(HttpServletRequest req)
	{
		String customerName = req.getParameter("name");
		String customerEmail = req.getParameter("email");
		String customerContent = req.getParameter("contents");
	
		sqlSession.getMapper(MemberDAOImpl.class)
			.customerServiceSave(customerName, customerEmail, customerContent);
		
		String host = "smtp.naver.com";
		final String username = "junh0y";
		final String password = "yyjh0323!";
		int port = 465;
		
		String to = "junh0y@naver.com";
		String subject = "[고객문의] "+ customerName +"님의 문의사항";
		String content = customerContent;
		
		Properties props = System.getProperties();
		
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host);
		
		Session sessionM = Session.getDefaultInstance(props, new javax.mail.Authenticator()
			{
				String userName = username;
				String passWord = password;
				protected PasswordAuthentication getPasswordAuthentication()
				{
					return new PasswordAuthentication(userName, passWord);
				}
			}
		);

		sessionM.setDebug(true);
		
		Message mimeMessage = new MimeMessage(sessionM);
		try
		{
			mimeMessage.setFrom(new InternetAddress(customerEmail));
			mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
			mimeMessage.setSubject(subject);
			mimeMessage.setText(content);
			Transport.send(mimeMessage);
		}
		catch (AddressException e)
		{
			e.printStackTrace();
		}
		catch (MessagingException e)
		{
			e.printStackTrace();
		}
		
		return "Member/CustomerService";
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
		final PointDTO pdto = new PointDTO();
	
		ParameterDTO parameterDTO = new ParameterDTO();
		String id = req.getParameter("id");

		
		
		sqlSession.getMapper(MemberDAOImpl.class).registerAction(vo);
		int preference
		= sqlSession.getMapper(MemberDAOImpl.class).myPreferenceInsert(vo);
		
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