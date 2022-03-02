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
	public Map<String, Object> memberRegist(MemberVO memberVO){
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		int isRegist;
		MemberVO memberRegist =
				sqlSession4.getMapper(IAndroidDAO.class).memberRegist(memberVO);
		
		if(memberRegist==null) {
			//회원정보 불일치로 로그인에 실패한 경우..결과만 0으로 내려준다.
			returnMap.put("isReist", 0);
			isRegist = 0;
		}
		else {
			//로그인에 성공하면 결과는 1, 해당 회원의 정보를 객체로 내려준다. 
			returnMap.put("memberRegist", memberRegist);
			returnMap.put("isReist", 1);
			isRegist = 1;
		}
		
		//return isRegist;
		return returnMap;
	}


}
