package member.model;

import lombok.Data;

@Data
public class MemberVO
{	//	멤버 테이블
    private String id;
    private String name;
    private String pass;
    private String email;
    private String telNum;
    private int lev;
    private int exp;
    private String favMenu;
    private String item;
    private String rest;
    private String grade;
    
    //	게시판 테이블
	private int idx;
	private String title;
	private String contents;
	private String ofile;
	private String sfile;
	private String tag;
	private java.sql.Date postdate;
	private int visitCnt;
	private int recomndCnt;
	private int scrapCnt;
	private java.sql.Date pdate;
	private String cate;
	private int virtualNum;
	
	//	페이징 처리
	private String searchField;
	private String searchTxt;
	private int start;
	private int end;
	
	//	댓글 테이블
	private String rno;
	private java.sql.Date writedate;
		
	//	스크랩 테이블
	private int scrapNum;
	private java.sql.Date sdate;
	private int tab;
	private String tab1Name;
	private String tab2Name;
	private String tab3Name;
	private String tab4Name;
	private String tab5Name;
	private String tab6Name;
	private String tab7Name;
	private String tab8Name;
	private String tab9Name;
	private String tab10Name;
	
	//	스티커 테이블
	private String temOname;
	
	//	대분류
	private int prenoodle;
	private int prerice;
	private int presoup;
	private int premeat;
	private int preseafood;
	private int preetc;
	
	//	포인트
	private String point;
}