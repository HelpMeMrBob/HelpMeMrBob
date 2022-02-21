package board.command;

import member.model.MemberVO;

public interface MybatisMemberImpl {
	/*
	 로그인 처리를 위한 추상메서드
	 	:아이디, 패스워드와 일치하는 회원정보가 있는 경우
	 	MemberVO객체를 통해 반환받는다.
	 */
	public MemberVO login(String id, String pass);
}
