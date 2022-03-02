package mybatis;

import java.util.ArrayList;

public interface IAndroidDAO {

	public ArrayList<MemberVO> memberList();
	
	public MemberVO memberLogin(MemberVO memberVO);

	public int memberRegist(MemberVO memberVO);
	
	public int setPoint(MemberVO memberVO);
}

