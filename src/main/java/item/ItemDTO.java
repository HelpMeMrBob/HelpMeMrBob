package item;

import lombok.Data;

@Data
public class ItemDTO {
	private String id; //아이디
	private String idx; //아이템 고유번호
	private String temOname; //아이템의 오리지널 이름
	private String temSname; //아이템의 저장이름
	private String contents; //아이템 설명
	private String price; //아이템 가격
	private String image; //아이템 이미지
	
}
