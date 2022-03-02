package admin.model;

import lombok.Data;

@Data
public class AdPlaceDTO {

	private int idx;
    private String food; //음식 키워드
    private String place; //식당명
    private String address; //식당의 주소
    private String plcNum; //식당의 전화번호
    private String menu; //식당 메뉴(|로 연결했음:꺼낼때 반드시 |로 split)
    private String price; //메뉴 가격(|로 연결했음:꺼낼때 반드시 |로 split)
    private String operTime; //운영 시각

    //가상번호를 위한 멤버변수 추가
  	private int virtualNum;	
}
