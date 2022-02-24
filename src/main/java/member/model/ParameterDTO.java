package member.model;

import lombok.Data;

@Data
public class ParameterDTO
{
	private String id;			//	사용자 아이디
	private int lev;			//	사용자 레벨
	private int exp;			//	사용자 경험치
	
	//	검색어 처리를 위한 멤버변수
	private String searchField;	//	검색할 필드명
	private String searchTxt;	//	검색어
	
	//	select 구간을 위한 멤버변수
	private int start;			//	select 시작
	private int end;			//	select 끝
	
	//	스크랩 탭 구분
	private int tab;
}