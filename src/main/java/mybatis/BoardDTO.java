package mybatis;

import lombok.Data;

@Data
public class BoardDTO {
    private String idx;
    private String title;
    private String contents;
    private String userfile1;
    private String userfile2;
    private String id;    
    private String image;
    private String postdate;
    private String visitcount;

}
