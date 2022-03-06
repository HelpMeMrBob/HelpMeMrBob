package member.model;

import lombok.Data;

@Data
public class ParameterDTO
{
	private int idx;
	private String id;			//	사용자 아이디
	private String name;
	private String email;
	private int lev;			//	사용자 레벨
	private int exp;			//	사용자 경험치
	private String myfood;		//	사용자 선호 메뉴
	private int tab;			//	선호 메뉴 탭
	
	//	검색어 처리를 위한 멤버변수
	private String searchField;	//	검색할 필드명
	private String searchTxt;	//	검색어
	
	//	select 구간을 위한 멤버변수
	private int start;			//	select 시작
	private int end;			//	select 끝
	
	//	스크랩 구분
	private int scrapNo;
}