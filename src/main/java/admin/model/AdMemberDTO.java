package admin.model;

import lombok.Data;

@Data
public class AdMemberDTO {
	
	private String id;
    private String name;
    private String pass; 
    private String email;
    private String telNum; 
    private int point;
    private int lev;
    private int exp;
    private String favMenu; 
    private String item; 
    private String rest; 
    private String grade;
    
    //가상번호를 위한 멤버변수 추가
  	private int virtualNum;
  	
}
