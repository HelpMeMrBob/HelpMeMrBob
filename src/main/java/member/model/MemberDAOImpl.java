package member.model;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

public interface MemberDAOImpl
{
	public MemberVO login(String id, String pass);
	public MemberVO kakaoLogin(String id, String name, String email);
	public MemberVO findId(String name, String email);
	public MemberVO findPassword(String id, String email);
	
	
	public MemberVO myPage(String id);
	public MemberVO memberUpdate(MemberVO vo);
	public int memberUpdateAction(MemberVO vo);
	public int myPreferenceUpdate(MemberVO vo);
	public int myPreferenceInsert(MemberVO vo);
	
	public void customerServiceSave(@Param("name")String name,
									@Param("email")String email,
									@Param("contents")String contents);
		
	public ArrayList<MemberVO> mySticker(ParameterDTO parameterDTO);
	public ArrayList<MemberVO> myPreference(ParameterDTO parameterDTO);
	public ArrayList<MemberVO> myPoint(ParameterDTO parameterDTO);
	
	public int getTotalCountSearch(ParameterDTO parameterDTO);
	public ArrayList<MemberVO> listPageSearch(ParameterDTO parameterDTO);
	
	public int getCommentTotalCountSearch(ParameterDTO parameterDTO);
	public ArrayList<MemberVO> commentListPageSearch(ParameterDTO parameterDTO);
	
	public int getScrapTotalCountSearch(ParameterDTO parameterDTO);
	public ArrayList<MemberVO> scrapListPageSearch(ParameterDTO parameterDTO);
	
	public int registerAction(MemberVO vo);
	public int kakaoRegisterAction(MemberVO vo);
	
}