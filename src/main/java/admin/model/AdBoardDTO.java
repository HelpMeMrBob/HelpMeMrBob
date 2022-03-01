package admin.model;

import lombok.Data;

@Data
public class AdBoardDTO {
	
	private int idx;
	private String id;
	private String title;
	private String contents;
	private String ofile;
	private String sfile;
	private String tag;
	private java.sql.Date postdate;
	private int visitCnt;
	private int recomndCnt;
	private int scrapCnt;
	private String pdate;
	private String cate;
	//가상번호를 위한 멤버변수 추가
	private int virtualNum;
	
}