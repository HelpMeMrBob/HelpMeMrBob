package mybatis;

import java.util.ArrayList;

public interface IAndroidDAO {

	public ArrayList<MemberVO> memberList();
	
	public MemberVO memberLogin(MemberVO memberVO);

	public int memberRegist(MemberVO memberVO);
	
	public int setPoint(MemberVO memberVO);


	public ArrayList<BoardDTO> listPage(ParameterDTO parameterDTO);

	public int getTotalCount(ParameterDTO parameterDTO);
	
	//Id찾기
	public MemberVO findId(MemberVO memberVO);
	
	//비밀번호 찾기
	public MemberVO findPwd(MemberVO memberVO);

}

