package recommand.model;

import lombok.Data;

@Data
public class FavCategoryDTO {
	// 대분류 우선순위
	private String id;
	private String prenoodle;// 면
	private String prerice;// 밥
	private String presoup;// 국 / 탕
	private String premeat;// 고기
	private String preseafood;// 해산물
	private String preetc;// 기타
}
