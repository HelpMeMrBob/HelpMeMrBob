package board.model;

import java.util.Date;

import lombok.Data;

@Data
public class BoardReplyVO {
	
	private int rno; 		//댓글번호	
	private String idx;		//글번호 -FK	
	private String id;		//아이디
	private String name;	//이름
	private String contents;	//내용	
	private Date writeDate;//작성일	
	
	//private String cate;	//게시판 분류컬럼
	//private int recomndCnt;//좋아요, 추천수
	
	
	
}
