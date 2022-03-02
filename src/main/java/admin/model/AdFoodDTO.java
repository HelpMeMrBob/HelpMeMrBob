package admin.model;

import lombok.Data;

@Data
public class AdFoodDTO {
	
	private int idx;
	private String food; //음식 이름
	private String image; //이미지
	private int recomndCnt; // 최종 선택 받은 수
	private String Lgroup; //대분류
	private String Mgroup; //중분류
	
	//가상 번호
	private int virtualNum;
}
