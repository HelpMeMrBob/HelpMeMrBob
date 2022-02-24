package board.model;

import java.util.Date;

import lombok.Data;

@Data
public class LikeVO {
	private int lno; //좋아요 번호
	private int idx; //게시판의 fk
	private String id;
}
