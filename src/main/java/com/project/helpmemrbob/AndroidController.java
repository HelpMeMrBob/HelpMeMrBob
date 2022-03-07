package com.project.helpmemrbob;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import mybatis.BoardDTO;
import mybatis.IAndroidDAO;
import mybatis.IBoardDAO;
import mybatis.MemberVO;
import mybatis.ParameterDTO;


@Controller
public class AndroidController {
	
	@Autowired
	private SqlSession sqlSession4;
	@Autowired
	JdbcTemplate template;
	
	@RequestMapping("/android/memberLogin.do")
	@ResponseBody
	public Map<String, Object> memberLogin(MemberVO memberVO) {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();

		MemberVO memberInfo =
			sqlSession4.getMapper(IAndroidDAO.class).memberLogin(memberVO);
		
		if(memberInfo==null) {
			//회원정보 불일치로 로그인에 실패한 경우..결과만 0으로 내려준다.
			returnMap.put("isLogin", 0);
		}
		else {
			//로그인에 성공하면 결과는 1, 해당 회원의 정보를 객체로 내려준다. 
			returnMap.put("memberInfo", memberInfo);
			returnMap.put("isLogin", 1);
		}
		
		System.out.println("요청들어옴:"+returnMap);
		return returnMap;
	}
	
	//회원가입 & 포인트 부여 완료
	@RequestMapping("/android/memberRegist.do")
	@ResponseBody
	public int memberRegist(MemberVO memberVO){
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		int isRegist;
		int memberRegist =
				sqlSession4.getMapper(IAndroidDAO.class).memberRegist(memberVO);
		
		if(memberRegist==0) {
			//회원가입ㅇ[ 실패한 경우..결과만 0으로 내려준다.
			returnMap.put("isRegist", 0);
			isRegist = 0;
			System.out.println("안드로이드 회원가입 db등록 실패");
		}
		else {
			//회원가입에 성공하면 결과는 1, 해당 회원의 정보를 객체로 내려준다. 
			returnMap.put("memberRegist", memberRegist);
			returnMap.put("isRegist", 1);
			isRegist = 1;
			
			int setPoint =
					sqlSession4.getMapper(IAndroidDAO.class).setPoint(memberVO);
			if(setPoint==0) {
				//회원정보 불일치로 로그인에 실패한 경우..결과만 0으로 내려준다.
				returnMap.put("isRegistPoint", 0);
				isRegist = 0;
				System.out.println("안드로이드 포인트부여 db등록 실패");
			}
			else {
				//로그인에 성공하면 결과는 1, 해당 회원의 정보를 객체로 내려준다. 
				returnMap.put("setPoint", setPoint);
				returnMap.put("isRegistPoint", 1);
				isRegist = 1;
				System.out.println("안드로이드 포인트부여 db등록 성공");
			}
			
			System.out.println("안드로이드 회원가입 db등록 성공");
		}
		
		//return isRegist;
		return isRegist;
	}
	
	@RequestMapping("/android/setPoint.do")
	@ResponseBody
	public int setPoint(MemberVO memberVO){
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		int isRegist;
		int setPoint =
				sqlSession4.getMapper(IAndroidDAO.class).setPoint(memberVO);
		 System.out.println("안드로이드 포인트 부여 실행");
		if(setPoint==0) {
			//회원정보 불일치로 로그인에 실패한 경우..결과만 0으로 내려준다.
			returnMap.put("isReist", 0);
			isRegist = 0;
			System.out.println("안드로이드 포인트부여 db등록 실패");
		}
		else {
			//로그인에 성공하면 결과는 1, 해당 회원의 정보를 객체로 내려준다. 
			returnMap.put("setPoint", setPoint);
			returnMap.put("isReist", 1);
			isRegist = 1;
			System.out.println("안드로이드 포인트부여 db등록 성공");
		}
		
		//return isRegist;
		return isRegist;
	}
	
	@RequestMapping("/android/write.do")
	@ResponseBody
	public int write(BoardDTO bdto){
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		System.out.println("게시글 삽입 실행1입니다");
		FileuploadController2 up2 = new FileuploadController2();

		int isRegist;
		int write =
				sqlSession4.getMapper(IBoardDAO.class).write(bdto);
		
		System.out.println("게시글 삽입 실행2");
		if(write==0) {
			//회원정보 불일치로 로그인에 실패한 경우..결과만 0으로 내려준다.
			returnMap.put("write", 0);
			isRegist = 0;
			System.out.println("게시물 등록 실패");
		}
		else {
			//로그인에 성공하면 결과는 1, 해당 회원의 정보를 객체로 내려준다. 
			returnMap.put("write", write);
			isRegist = 1;
			System.out.println("게시물 등록 성공");
		}
		
		//return isRegist;
		return isRegist;
	}
	
	
	
	///안드로이드리스트
	//JSONArray로 데이터 반환
		@RequestMapping("/android/list.do")
		@ResponseBody
		public ArrayList<BoardDTO> AndroidList(HttpServletRequest req) {
			System.out.println("요청들어옴");
			ArrayList<BoardDTO> lists = 
					sqlSession4.getMapper(IBoardDAO.class).androidList();
			return lists;
		}
		
	//Id 찾기 & 비밀번호 찾기
	@RequestMapping("/android/findId.do")
	@ResponseBody
	public Map<String, Object> findId(MemberVO memberVO) {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();

		MemberVO memberInfo =
			sqlSession4.getMapper(IAndroidDAO.class).findId(memberVO);
		
		if(memberInfo==null) {
			//회원정보 불일치
			returnMap.put("findId", 0);
		}
		else {
			//회원 정보 일치 
			returnMap.put("memberInfo", memberInfo);
			returnMap.put("findId", 1);
		}
		
		System.out.println("요청들어옴:"+returnMap);
		return returnMap;
	}

	

}
