/*
���̵����� �Է�
*/
commit;

--board���̺� ����
insert into board(idx,id,title,contents,postdate,tag,cate) values 
    (board_seq.nextval,'test','�������Խ��� ù��°�Դϴ�.','�����Դϴ�',sysdate,'#�±�1','rvw');
insert into board(idx,id,title,contents,postdate,tag,cate)values 
    (board_seq.nextval,'test','�������Խ��� �ι�°�Դϴ�.','�����Դϴ�',sysdate,'#�±�2','rvw');
insert into board(idx,id,title,contents,postdate,tag,cate)values 
    (board_seq.nextval,'test','�������Խ��� ����°�Դϴ�.','�����Դϴ�',sysdate,'#�±�3','rvw');
insert into board(idx,id,title,contents,postdate,tag,cate)values 
    (board_seq.nextval,'test2','�������Խ��� �׹�°�Դϴ�.','�����Դϴ�',sysdate,'#�±�4','rvw');
insert into board(idx,id,title,contents,postdate,tag,cate)values 
    (board_seq.nextval,'test2','�������Խ��� �ټ���°�Դϴ�.','�����Դϴ�',sysdate,'#�±�5','rvw');

--��� ����
insert into board_rep(rno,idx,id,name,contents,writeDate,recomndCnt,cate)values 
    (board_rep_seq.nextval,6,'test1','�׽�Ʈ1','��۳����Դϴ�.',sysdate,1,'rvw');
insert into board_rep(rno,idx,id,name,contents,writeDate,recomndCnt,cate)values 
    (board_rep_seq.nextval,6,'test1','�׽�Ʈ1','����� �־�þ��',sysdate,1,'rvw');
insert into board_rep(rno,idx,id,name,contents,writeDate,recomndCnt,cate)values 
    (board_rep_seq.nextval,6,'test1','�׽�Ʈ1','~~���~~',sysdate,1,'rvw');
insert into board_rep(rno,idx,id,name,contents,writeDate,recomndCnt,cate)values 
    (board_rep_seq.nextval,6,'test1','�׽�Ʈ1','�׽�Ʈ���.',sysdate,1,'rvw');
insert into board_rep(rno,idx,id,name,contents,writeDate,recomndCnt,cate)values 
    (board_rep_seq.nextval,6,'test1','�׽�Ʈ1','�������ʾ�',sysdate,1,'rvw');
    
--restaurant���̺� ����
insert into restaurant(idx, food, place, address, lati, longi, plcNum, menu, price, operTime)
    values('1', '#��ġ�,#��ġ,#�', '�����Ѹ���', '����Ư���� ��õ�� �����3�� 81',
        '37.47868297981449', '126.87866945602173', '010-1234-5678', '��ġ�,��ġ��,��ġ¥����',
            '8000, 7000, 6000', '08:00~21:00');    

--ȸ�����̺� ����
insert into member(id, name, pass, email, telNum, point, lev, exp, favMenu, item, rest, grade) values
    ('test1', '�׽�Ʈ1', '1111', 'test1@naver.com', '010-1111-1111', 100, 5, 400, '������', '������', 'Ȱ��ȭ', 'ȸ��');
insert into member(id, name, pass, email, telNum, point, lev, exp, favMenu, item, rest, grade) values
    ('test2', '�׽�Ʈ2', '2222', 'test1@naver.com', '010-2222-2222', 100, 5, 400, '���', '������', 'Ȱ��ȭ', 'ȸ��');
insert into member(id, name, pass, email, telNum, point, lev, exp, favMenu, item, rest, grade) values
    ('test3', '�׽�Ʈ3', '3333', 'test1@naver.com', '010-3333-3333', 100, 5, 400, '����', '������', 'Ȱ��ȭ', 'ȸ��');