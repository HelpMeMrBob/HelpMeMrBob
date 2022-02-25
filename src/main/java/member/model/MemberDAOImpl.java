package member.model;

import java.util.ArrayList;

public interface MemberDAOImpl
{
	public MemberVO login(String id, String pass);
	public MemberVO myPage(String id);
	public MemberVO memberUpdate(MemberVO vo);
	public int memberUpdateAction(MemberVO vo);
	
	public ArrayList<MemberVO> mySticker(ParameterDTO parameterDTO);
	
	public int getTotalCountSearch(ParameterDTO parameterDTO);
	public ArrayList<MemberVO> listPageSearch(ParameterDTO parameterDTO);
	
	public int getCommentTotalCountSearch(ParameterDTO parameterDTO);
	public ArrayList<MemberVO> commentListPageSearch(ParameterDTO parameterDTO);
	
	public int getScrapTotalCountSearch(ParameterDTO parameterDTO);
	public ArrayList<MemberVO> scrapListPageSearch(ParameterDTO parameterDTO);
	
	public int registerAction(MemberVO vo);
}