package point;

import lombok.Data;

@Data
public class PointDTO {

	private String id; //아이디 
    private int point; //보유포인트 
    private int standard; //지급기준
    private String sticker;
}
