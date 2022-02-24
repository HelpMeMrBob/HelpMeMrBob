package infomation.model;

import lombok.Data;

@Data
public class FavoriteDTO {
	private String idx; //즐겨찾기 인덱스
	private String id; //사용자 아이디
	private String place; //식당 이름
	private String address; //식당 주소
	private String memo; //즐겨찾기한 식당에 대한 메모
}
