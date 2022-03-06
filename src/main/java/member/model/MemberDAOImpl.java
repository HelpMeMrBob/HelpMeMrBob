package member.model;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface MemberDAOImpl
{
	public MemberVO login(String id, String pass);
	public int myLevel(MemberVO memberVO);
	public MemberVO kakaoLogin(String id, String name, String email);
	public ArrayList<MemberVO> findId(String name, String email);
	public ArrayList<MemberVO> findPassword(String id, String email);
	
	public MemberVO myPage(String id);
	public ArrayList<MemberVO> myFoodList(ParameterDTO parameterDTO);
	public ArrayList<MemberVO> foodList();
	public int countMyFood(ParameterDTO parameterDTO);
	public void insertMyFood(ParameterDTO parameterDTO);
	public void deleteMyFood(ParameterDTO parameterDTO);
	
	public MemberVO memberUpdate(MemberVO vo);
	public int memberUpdateAction(MemberVO vo);
	public int myPreferenceUpdate(MemberVO vo);
	
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