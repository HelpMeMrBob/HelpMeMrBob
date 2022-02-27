/*
final계정
*/
create user final identified by 1234;
grant connect, resource to final;

--음식테이블(룰렛, 월드컵)
drop table food;
create table food( 
    idx varchar2(30) NOT NULL,
    food varchar2(50), --음식 이름
    image varchar2(80), --이미지
    recomndCnt number default 0, --월드컵에서 최종 선택 받은 수
    Lgroup varchar2(30), --대분류
    Mgroup varchar2(30), --중분류
    primary KEY (idx));
    
--food테이블 시퀀스
drop sequence food_seq;
create sequence food_seq
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue 
    nocycle
    nocache;     
    
--식당테이블
drop table restaurant;
create table restaurant(
    idx varchar2(20) NOT NULL,
    food varchar2(200), --음식 키워드
    place varchar2(100), --식당명
    address varchar2(200), --식당의 주소
    plcNum varchar2(50), --식당의 전화번호
    menu varchar2(2000), --식당 메뉴(|로 연결했음:꺼낼때 반드시 |로 split)
    price varchar2(500), --메뉴 가격(|로 연결했음:꺼낼때 반드시 |로 split)
    operTime varchar2(200), --운영 시각
    primary KEY (idx));
    
--회원테이블
drop table member;
create table member(
    id varchar2(30) NOT NULL, --아이디
    name varchar(30), --이름
    pass varchar(30), --비밀번호
    email varchar2(50), --이메일
    telNum varchar2(50), --전화번호
    lev number, --레벨
    exp number, --경험치
    favMenu varchar2(50), --선호 메뉴
    item varchar2(50), --소유한 아이템 목록
    grade varchar2(30), --등급/회원과 관리자 구분 
    primary KEY (id));
-- member테이블의 rest컬럼 삭제 (grade컬럼 이용해 휴면 관리를 하기로 해서 필요 없어졌음)
--ALTER TABLE member DROP COLUMN rest;  
-- member테이블의 point컬럼 삭제(만약 point필요하면 point테이블과 join하여 조회할것)
--ALTER TABLE member DROP COLUMN point;
-- point테이블의 id와 member테이블의 id 외래키 설정
alter table point 
    add foreign key (id) 
        references member(id);

--게시판 테이블
drop table board;
create table board(
    idx varchar2(30) NOT NULL,
    id varchar2(30),
    title varchar(200), --제목/인스타 형식이면 제목이 필요한가? (캘린더 할거면?)
    contents varchar(4000), -- 내용
    userfile1 VARCHAR(80),
    userfile2 VARCHAR(80),
    userfile3 VARCHAR(80),
    userfile4 VARCHAR(80),
    userfile5 VARCHAR(80),
    tag varchar(50), -- 태그
    postdate date default sysdate, --작성일
    visitCnt number default 0, --방문자수/인스타 형식이면 방문자수 필요한가? 
    recomndCnt number default 0, --좋아요, 추천수 
    scrapCnt number default 0, --스크랩수
    pdate date, --캘린더 전용 작성일
    cate varchar2(30), --게시판 분류 컬럼 리뷰게시판:rvw
    primary KEY (idx));
    
--보드테이블 시퀀스
drop sequence board_seq;
create sequence board_seq
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue 
    nocycle
    nocache;
--게시판 테이블 수정
--ALTER TABLE board add userfile1 VARCHAR(80);--게시판에 사진파일컬럼5개추가
--ALTER TABLE board add userfile2 VARCHAR(80);
--ALTER TABLE board add userfile3 VARCHAR(80);
--ALTER TABLE board add userfile4 VARCHAR(80);
--ALTER TABLE board add userfile5 VARCHAR(80);
--ALTER TABLE board DROP COLUMN ofile; --필요 없어졌음 삭제  
--ALTER TABLE board DROP COLUMN sfile; --필요 없어졌음 삭제 

--댓글 테이블
drop table board_rep;
create table board_rep(
    rno varchar2(30),--댓글 번호
    idx varchar2(30) NOT NULL,--게시판의 fk
    id varchar2(30), --아이디
    name varchar2(30), --작성자
    contents varchar(500), --댓글 내용
    writeDate date default sysdate, --작성일
    recomndCnt number default 0, --좋아요, 추천수
    cate varchar2(30)); --게시판 분류 컬럼  
--댓글 시퀀스
drop sequence board_rep_seq;
create sequence board_rep_seq
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue 
    nocycle
    nocache;
    
--좋아요 테이블
drop table doLike;
create table doLike(
    lno varchar2(30),--좋아요 번호
    idx varchar2(30) NOT NULL,--게시판의 fk
    scrapNo varchar2(30), --스크랩기능
    id varchar2(30));
--좋아요테이블에 스크랩기능추가    
--ALTER TABLE doLike add scrapNo varchar2(30);

--토론테이블
drop table VStalk;
create table VStalk(
    idx varchar2(30) NOT NULL,
    topic varchar(200), --주제
    sel1vote number default 0, --선택1에 대한 투표수
    sel2vote number default 0, --선택2에 대한 투표수
    sel1img varchar2(80), --선택1에 대한 이미지
    sel2img varchar2(80), --선택2에 대한 이미지
    primary KEY (idx));
    
--댓글테이블
drop table comnt;
create table comnt(
    idx varchar2(30) NOT NULL,
    id varchar2(30), --아이디
    contents varchar(4000), --댓글 내용
    postdate date default sysdate, --작성일
    recomndCnt number default 0, --좋아요, 추천수
    cate varchar2(30), --게시판 분류 컬럼
    primary KEY (idx));
    
--가상 포인트 테이블
create table point(
    id varchar2(30), --아이디
    point varchar2(30), --단위?
    standard varchar2(30), --지급 기준?
    primary KEY (id));
    
--QNA테이블
create table QnA(
    name varchar(30), --이름
    pass varchar(30), --비밀번호
    telNum varchar2(50), --전화번호
    contents varchar(4000), -- 내용
    email varchar2(50)); --이메일
    
--아이템 테이블
create table item(
     idx varchar2(30) NOT NULL,
     temName varchar(30), --템 이름
     contents varchar(2000), --템 설명
     price varchar2(50), --템 가격
     ofile varchar2(80), --템이미지 원본명
     sfile varchar2(80), --템이미지 저장명
     primary KEY (idx));
     
--- 아이템의 시퀀스 생성
drop sequence myitem_seq;
create sequence myitem_seq
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;     
     
-- 내가 가진 haveItem 테이블
drop table haveItem;
create table haveItem(
     id varchar2 (30) NOT NULL, -- 구매하는 회원의 계정
     temOname varchar(100) --템 오리지널 이름
     );  
-- haveItem테이블에 id라는걸 추가 후, 기존의 member테이블의 id와 외래키걸기.
alter table haveItem
    add foreign key (id) 
        references member(id);
-- haveItem테이블의 temOname과, 기존의 adminItem테이블의 temOname을 외래키걸기        
alter table haveItem
    add foreign key (temOname) 
        references adminItem(temOname);        
     
-- admin계정으로 등록된 adminItem 테이블
drop table adminItem;
create table adminItem(
     id varchar2 (30), -- admin 계정으로만 등록 가능하게 설정.
     idx varchar2(30) NOT NULL, -- 아이템 고유의 번호
     temOname varchar(100), --템 오리지널 이름
     temSname varchar(100), --템 저장 이름
     contents varchar(2000), --템 설명
     price varchar2(50), --템 가격
     image varchar2(80), --템 이미지
     primary KEY (temOname), -- 아이템 이름으로 중복 & null값 불가.
     UNIQUE (idx)); -- 아이템 고유의 번호로 중복불가.     
    
--결제 관련 테이블
drop table pay;
create table pay(
    idx varchar2(30) NOT NULL,
    code varchar2(50), --가맹점 코드
    orderNum varchar2(50), --가맹점 주문번호
    id varchar2(80), --가맹점 회원 아이디
    goods varchar(30), --상품명
    goodsCnt number, --상품 수량
    tPrice varchar2(50), --상품 총액
    taxFree varchar2(50), --비과세
    sucUrl varchar2(100), --결제 성공시 리다이렉트 URL
    failUrl varchar2(100), --결제 실패시 리다이렉트 URL
    cancleUrl varchar2(100), --결제 취소시 리다이렉트 URL 
    primary KEY (idx));
    
--스크랩테이블
drop table scrap;
create table scrap(
    idx varchar2(30), --보드넘버
    scrapNum varchar2(30), --스크랩번호
    sdate date default sysdate, --스크랩날짜
    cate varchar2(30) --게시판 분류 컬럼
);

--즐겨찾기 테이블
drop table favorite;
create table favorite(
    idx varchar2(30), --즐겨찾기 인덱스
    id varchar2(30), --사용자 아이디
    place varchar2(80), --식당 이름
    address varchar2(80), --식당 주소
    memo varchar2(500), --즐겨찾기한 식당에 대한 메모
    primary key(address)
);