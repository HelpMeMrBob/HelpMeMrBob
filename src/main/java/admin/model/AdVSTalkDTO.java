package admin.model;

import lombok.Data;

@Data
public class AdVSTalkDTO {
	
	private int idx; //인덱스
	private String topic; //토론 주제
    private int sel1vote; //선택1에 대한 투표수
    private int sel2vote; //선택2에 대한 투표수
    private String ofile1; //선택1에 원본파일명
    private String sfile1; //선택1에 저장된파일명
    private String ofile2; //선택1에 원본파일명
    private String sfile2; //에 대한 저장된파일명
    
    //가상번호를 위한 멤버변수 추가
  	private int virtualNum;	
  	
  	//페이징
  	private int nowPage;
}
