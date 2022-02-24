/*
final����
*/
create user final identified by 1234;
grant connect, resource to final;

--�������̺�(�귿, ������)
drop table food;
create table food( 
    idx varchar2(30) NOT NULL,
    food varchar2(50), --���� �̸�
    image varchar2(80), --�̹���
    recomndCnt number default 0, --�����ſ��� ���� ���� ���� ��
    Lgroup varchar2(30), --��з�
    Mgroup varchar2(30), --�ߺз�
    primary KEY (idx));
    
--�Ĵ����̺�
drop table restaurant;
create table restaurant(
    idx varchar2(30) NOT NULL,
    food varchar2(50), --���� Ű����
    place varchar2(80), --�Ĵ��
    address varchar2(80), --�Ĵ��� �ּ�
    plcNum varchar2(30), --�Ĵ��� ��ȭ��ȣ
    menu varchar2(50), --�Ĵ� �޴�
    price varchar2(50), --�޴� ����
    operTime varchar2(50), --� �ð�
    primary KEY (idx));
    
--ȸ�����̺�
drop table member;
create table member(
    id varchar2(30) NOT NULL, --���̵�
    name varchar(30), --�̸�
    pass varchar(30), --��й�ȣ
    email varchar2(50), --�̸���
    telNum varchar2(50), --��ȭ��ȣ
    point number, --����Ʈ
    lev number, --����
    exp number, --����ġ
    favMenu varchar2(50), --��ȣ �޴�
    item varchar2(50), --������ ������ ���
    rest varchar2(30), --�޸� �� Ȱ��ȭ ����
    grade varchar2(30), --���/ȸ���� ������ ���� 
    primary KEY (id));
    
-- member���̺��� point�÷� ����(���� point�ʿ��ϸ� point���̺�� join�Ͽ� ��ȸ�Ұ�)
ALTER TABLE member DROP COLUMN point;
-- point���̺��� id�� member���̺��� id �ܷ�Ű ����
alter table point 
    add foreign key (id) 
        references member(id);

--�Խ��� ���̺�
drop table board;
create table board(
    idx varchar2(30) NOT NULL,
    id varchar2(30),
    title varchar(200), --����/�ν�Ÿ �����̸� ������ �ʿ��Ѱ�? (Ķ���� �ҰŸ�?)
    contents varchar(4000), -- ����
    ofile varchar(80), -- �������ϸ�
    sfile varchar(80), -- �����
    tag varchar(50), -- �±�
    postdate date default sysdate, --�ۼ���
    visitCnt number default 0, --�湮�ڼ�/�ν�Ÿ �����̸� �湮�ڼ� �ʿ��Ѱ�? 
    recomndCnt number default 0, --���ƿ�, ��õ�� 
    scrapCnt number default 0, --��ũ����
    pdate date, --Ķ���� ���� �ۼ���
    cate varchar2(30), --�Խ��� �з� �÷� ����Խ���:rvw
    primary KEY (idx));
--�������̺� ������
create sequence board_seq
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue 
    nocycle
    nocache;
    
--��� ���̺�
drop table board_rep;
create table board_rep(
    rno varchar2(30),--��� ��ȣ
    idx varchar2(30) NOT NULL,--�Խ����� fk
    id varchar2(30), --���̵�
    name varchar2(30), --�ۼ���
    contents varchar(500), --��� ����
    writeDate date default sysdate, --�ۼ���
    recomndCnt number default 0, --���ƿ�, ��õ��
    cate varchar2(30)); --�Խ��� �з� �÷�
    
--��� ������
create sequence board_rep_seq
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue 
    nocycle
    nocache;
    
--���ƿ� ���̺�
create table doLike(
    lno varchar2(30),--���ƿ� ��ȣ
    idx varchar2(30) NOT NULL,--�Խ����� fk
    id varchar2(30));

--������̺�
drop table VStalk;
create table VStalk(
    idx varchar2(30) NOT NULL,
    topic varchar(200), --����
    sel1vote varchar2(30), --����1�� ���� ��ǥ��
    sel2vote varchar2(30), --����2�� ���� ��ǥ��
    sel1img varchar2(80), --����1�� ���� �̹���
    sel2img varchar2(80), --����2�� ���� �̹���
    primary KEY (idx));
    
--������̺�
drop table comnt;
create table comnt(
    idx varchar2(30) NOT NULL,
    id varchar2(30), --���̵�
    contents varchar(4000), --��� ����
    postdate date default sysdate, --�ۼ���
    recomndCnt number default 0, --���ƿ�, ��õ��
    cate varchar2(30), --�Խ��� �з� �÷�
    primary KEY (idx));
    
--���� ����Ʈ ���̺�
create table point(
    id varchar2(30), --���̵�
    point varchar2(30), --����?
    standard varchar2(30), --���� ����?
    primary KEY (id));
    
--QNA���̺�
create table QnA(
    name varchar(30), --�̸�
    pass varchar(30), --��й�ȣ
    telNum varchar2(50), --��ȭ��ȣ
    contents varchar(4000), -- ����
    email varchar2(50)); --�̸���
    
--������ ���̺�
create table item(
     idx varchar2(30) NOT NULL,
     temName varchar(30), --�� �̸�
     contents varchar(2000), --�� ����
     price varchar2(50), --�� ����
     ofile varchar2(80), --���̹��� ������
     sfile varchar2(80), --���̹��� �����
     primary KEY (idx));
     
--- �������� ������ ����
create sequence myitem_seq
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;     
     
-- ���� ���� haveItem ���̺�
drop table haveItem;
create table haveItem(
     id varchar2 (30) NOT NULL, -- �����ϴ� ȸ���� ����
     temOname varchar(100) --�� �������� �̸�
     );  
-- haveItem���̺� id��°� �߰� ��, ������ member���̺��� id�� �ܷ�Ű�ɱ�.
alter table haveItem
    add foreign key (id) 
        references member(id);
-- haveItem���̺��� temOname��, ������ adminItem���̺��� temOname�� �ܷ�Ű�ɱ�        
alter table haveItem
    add foreign key (temOname) 
        references adminItem(temOname);        
     
-- admin�������� ��ϵ� adminItem ���̺�
drop table adminItem;
create table adminItem(
     id varchar2 (30), -- admin �������θ� ��� �����ϰ� ����.
     idx varchar2(30) NOT NULL, -- ������ ������ ��ȣ
     temOname varchar(100), --�� �������� �̸�
     temSname varchar(100), --�� ���� �̸�
     contents varchar(2000), --�� ����
     price varchar2(50), --�� ����
     image varchar2(80), --�� �̹���
     primary KEY (temOname), -- ������ �̸����� �ߺ� & null�� �Ұ�.
     UNIQUE (idx)); -- ������ ������ ��ȣ�� �ߺ��Ұ�.     
    
--���� ���� ���̺�
create table pay(
    idx varchar2(30) NOT NULL,
    code varchar2(50), --������ �ڵ�
    orderNum varchar2(50), --������ �ֹ���ȣ
    id varchar2(80), --������ ȸ�� ���̵�
    goods varchar(30), --��ǰ��
    goodsCnt number, --��ǰ ����
    tPrice varchar2(50), --��ǰ �Ѿ�
    taxFree varchar2(50), --�����
    sucUrl varchar2(100), --���� ������ �����̷�Ʈ URL
    failUrl varchar2(100), --���� ���н� �����̷�Ʈ URL
    cancleUrl varchar2(100), --���� ��ҽ� �����̷�Ʈ URL 
    primary KEY (idx));
    
--��ũ�����̺�
create table scrap(
    idx varchar2(30), --����ѹ�
    scrapNum varchar2(30), --��ũ����ȣ
    sdate date default sysdate, --��ũ����¥
    cate varchar2(30) --�Խ��� �з� �÷�
);