package recommand.model;

import lombok.Data;

@Data
public class RecommandDTO {
	private String idx;
	private String food;// 음식 이름
	private String image;// 이미지 이름
	private String recomndCnt;// 월드컵에서 우승한 횟수
	private String Lgroup;// 대분류
	private String Mgroup;// 중분류
}
