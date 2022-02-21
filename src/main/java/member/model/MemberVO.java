package member.model;

import lombok.Data;

@Data
public class MemberVO
{
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
}