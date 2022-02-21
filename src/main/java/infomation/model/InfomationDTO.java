package infomation.model;

import lombok.Data;

@Data
public class InfomationDTO {
	private String idx;		//식당 인덱스
	private String food;	//음식 키워드
	private String place;	//식당명
	private String address; //식당 주소
	private String lati;	//위도
	private String longi;	//경도
	private String plcNum;  //식당 전화번호
	private String menu;	//식당 메뉴
	private String price;	//메뉴 가격
	private String operTime;//운영 시간
}
