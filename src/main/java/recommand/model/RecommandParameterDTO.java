package recommand.model;

import java.util.ArrayList;

import lombok.Data;

@Data
public class RecommandParameterDTO {
	private String round;// 라운드 수(몇강인지)
	private ArrayList<String> food;// 음식 이름
	private ArrayList<String> image;// 이미지 이름
	private ArrayList<String> recomndCnt;// 월드컵에서 우승한 횟수
}
