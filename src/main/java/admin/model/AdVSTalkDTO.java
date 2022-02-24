package admin.model;

import lombok.Data;

@Data
public class AdVSTalkDTO {
	
	private int idx; //인덱스
	private String topic; //토론 주제
    private int sel1vote; //선택1에 대한 투표수
    private int sel2vote; //선택2에 대한 투표수
    private String sel1img; //선택1에 대한 이미지
    private String sel2img; //선택2에 대한 이미지
}
