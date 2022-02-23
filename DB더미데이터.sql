/*
더미데이터 입력
*/
commit;

--board테이블 더미
insert into board(idx,id,title,contents,postdate,tag,cate) values 
    (board_seq.nextval,'test','스프링게시판 첫번째입니다.','내용입니다',sysdate,'#태그1','rvw');
insert into board(idx,id,title,contents,postdate,tag,cate)values 
    (board_seq.nextval,'test','스프링게시판 두번째입니다.','내용입니다',sysdate,'#태그2','rvw');
insert into board(idx,id,title,contents,postdate,tag,cate)values 
    (board_seq.nextval,'test','스프링게시판 세번째입니다.','내용입니다',sysdate,'#태그3','rvw');
insert into board(idx,id,title,contents,postdate,tag,cate)values 
    (board_seq.nextval,'test2','스프링게시판 네번째입니다.','내용입니다',sysdate,'#태그4','rvw');
insert into board(idx,id,title,contents,postdate,tag,cate)values 
    (board_seq.nextval,'test2','스프링게시판 다섯번째입니다.','내용입니다',sysdate,'#태그5','rvw');

--댓글 더미
insert into board_rep(rno,idx,id,name,contents,writeDate,recomndCnt,cate)values 
    (board_rep_seq.nextval,6,'test1','테스트1','댓글내용입니다.',sysdate,1,'rvw');
insert into board_rep(rno,idx,id,name,contents,writeDate,recomndCnt,cate)values 
    (board_rep_seq.nextval,6,'test1','테스트1','댓글을 넣어봤어요',sysdate,1,'rvw');
insert into board_rep(rno,idx,id,name,contents,writeDate,recomndCnt,cate)values 
    (board_rep_seq.nextval,6,'test1','테스트1','~~댓글~~',sysdate,1,'rvw');
insert into board_rep(rno,idx,id,name,contents,writeDate,recomndCnt,cate)values 
    (board_rep_seq.nextval,6,'test1','테스트1','테스트댓글.',sysdate,1,'rvw');
insert into board_rep(rno,idx,id,name,contents,writeDate,recomndCnt,cate)values 
    (board_rep_seq.nextval,6,'test1','테스트1','졸리지않아',sysdate,1,'rvw');
    
--restaurant테이블 더미
insert into restaurant(idx, food, place, address, lati, longi, plcNum, menu, price, operTime)
    values('1', '#김치찌개,#김치,#찌개', '돼지한마리', '서울특별시 금천구 가산로3길 81',
        '37.47868297981449', '126.87866945602173', '010-1234-5678', '김치찌개,김치찜,김치짜글이',
            '8000, 7000, 6000', '08:00~21:00');    

--회원테이블 더미
insert into member(id, name, pass, email, telNum, point, lev, exp, favMenu, item, rest, grade) values
    ('test1', '테스트1', '1111', 'test1@naver.com', '010-1111-1111', 100, 5, 400, '떡볶이', '소유템', '활성화', '회원');
insert into member(id, name, pass, email, telNum, point, lev, exp, favMenu, item, rest, grade) values
    ('test2', '테스트2', '2222', 'test1@naver.com', '010-2222-2222', 100, 5, 400, '라면', '소유템', '활성화', '회원');
insert into member(id, name, pass, email, telNum, point, lev, exp, favMenu, item, rest, grade) values
    ('test3', '테스트3', '3333', 'test1@naver.com', '010-3333-3333', 100, 5, 400, '족발', '소유템', '활성화', '회원');