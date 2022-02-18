package member.model;

public interface MemberDAOImpl
{
	public MemberVO login(String id, String pass);
	public MemberVO myPage(String id);
	public MemberVO memberUpdate(MemberVO vo);
	public int memberUpdateAction(MemberVO vo);
}