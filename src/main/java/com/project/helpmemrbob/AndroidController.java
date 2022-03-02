package com.project.helpmemrbob;

import java.util.HashMap;

import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import mybatis.IAndroidDAO;
import mybatis.MemberVO;


@Controller
public class AndroidController {
	
	@Autowired
	private SqlSession sqlSession4;
	
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
	
	@RequestMapping("/android/memberRegist.do")
	@ResponseBody
	public int memberRegist(MemberVO memberVO){
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		int isRegist;
		int memberRegist =
				sqlSession4.getMapper(IAndroidDAO.class).memberRegist(memberVO);
		
		if(memberRegist==0) {
			//회원가입ㅇ[ 실패한 경우..결과만 0으로 내려준다.
			returnMap.put("isReist", 0);
			isRegist = 0;
			System.out.println("안드로이드 회원가입 db등록 실패");
		}
		else {
			//회원가입에 성공하면 결과는 1, 해당 회원의 정보를 객체로 내려준다. 
			returnMap.put("memberRegist", memberRegist);
			returnMap.put("isReist", 1);
			isRegist = 1;
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


}
