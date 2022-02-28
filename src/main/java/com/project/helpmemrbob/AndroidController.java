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
	private SqlSession sqlSession;
	
	@RequestMapping("/anMemberLogin.do")
	@ResponseBody
	public Map<String, Object> memberLogin(MemberVO memberVO){
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		MemberVO memberInfo =
				sqlSession.getMapper(IAndroidDAO.class).memberLogin(memberVO);
		
		if(memberInfo==null) {
			returnMap.put("isLogin", 0);
		}else {
			returnMap.put("memberInfo", memberInfo);
			returnMap.put("isLogin", 1);
		}
		return returnMap;
		
	}

}
