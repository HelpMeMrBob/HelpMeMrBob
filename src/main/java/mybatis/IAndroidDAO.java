package mybatis;

import java.util.ArrayList;

import mybatis.MemberVO;

public interface IAndroidDAO {

	public ArrayList<MemberVO> memberList();
	
	public MemberVO memberLogin(MemberVO memberVO);
}

