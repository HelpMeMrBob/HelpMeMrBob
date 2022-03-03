package mybatis;

import lombok.Data;

@Data
public class BoardDTO {
    private String idx;
    private String title;
    private String contents;
    private String id;    
    private String image;
    private String postdate;
    private String visitcount;

}
