##############################################
게시판 만들기
##############################################
SELECT * FROM board;
DROP TABLE board;
DROP SEQUENCE board_num_seq;

/////////////////////////로그인 테이블//////////////////////////

create table t_member(
  id varchar2(20),
  pwd varchar2(20),
  name varchar2(30),
  email varchar(50),
  joinDate Date
);

select * from t_member;

insert into t_member
values('a1234', 'a1234', '홍길동', 'a1234@daum.net', sysdate);

commit;

delete from t_member;

drop table t_member;

////////////////////////////////////////////////////////

delete from tb_user;

drop table tb_user;
drop sequence tb_user_id_seq;

create table tb_user(
  id number,
  username varchar2(100),
  password varchar2(1000),
  email varchar2(100),
  authRole varchar(100),
  createDate Date
);

create sequence tb_user_id_seq
 start with 1
 increment by 1
 nocache
 nocycle;

insert into tb_user
values(tb_user_id_seq.nextval, 'a1234', 'a1234', 'a1234@daum.net', null, sysdate);
commit;

delete from tb_user
where id = 2;

DESC tb_user;
ALTER TABLE tb_user
MODIFY password varchar2(100);

select * from tb_user;
/////////////////////////////////////////////

/* product 테이블 */

drop table product;

create table books (
book_num number not null,
category_code number not null,
 book_title varchar2(100),
book_author varchar2(100),
book_image varchar2(100),
book_price number,
book_publisher varchar2(100),
book_pubdate varchar2(100));

CREATE SEQUENCE books_SEQ
START WITH 1
INCREMENT BY 1;

insert into books ( book_num,category_code,book_title,book_author,book_image,book_price,book_publisher,book_pubdate) values (books_SEQ.nextval,1,'백설공주','홍길동','https://d12zq4w4guyljn.cloudfront.net/300_300_20221101084131_photo1_94ecf3cdea70.jpg',10000,'동화나라','2023-02-13');
insert into books ( book_num,category_code,book_title,book_author,book_image,book_price,book_publisher,book_pubdate) values (books_SEQ.nextval,1,'신데렐라','김범수','https://d12zq4w4guyljn.cloudfront.net/300_300_20221101084057_photo2_94ecf3cdea70.jpg',100000,'동화나라2','2023-02-14');

commit;
select * from books;


//////////////////////////////////////////////

1. 테이블생성 
create table board(
   	num number,
   	writer varchar2(20),
 	email varchar2(30),
	subject varchar2(50),
	reg_date date,
	readcount number default 0, 
	ref number, 
	re_step number, 
	re_level number, 
	content varchar2(100),
	ip varchar2(20),
    upload varchar2(300)
);

create sequence board_num_seq
start with 1 
increment by 1
nocache
nocycle;

insert into board 
values(board_num_seq.nextval, '홍길동','young@aaaa.com','제목1',sysdate,0,board_num_seq.nextval,
0,0,'내용 테스트.......','127.0.0.1','sample.txt');

commit;


select num, readcount 
from board
where num=2;


select num, subject, ref, re_step, re_level
from board
order by ref desc, re_step asc



select b.* 
from (select rownum as rm, a.*
	  from (select *
	 	    from board
            order by ref desc, re_step asc) a)b
where b.rm>=? and b.rm<=?           



delete from board
where num=21

drop table board;


select b.* from 
(select rownum as rm, a.* from(
  select num, ref, re_step,re_level from board
  order by ref desc, re_step asc) a)b
where b.rm >=1  and b.rm<=5

delete from board where num=23;

WebServlet("/board/*")


webContent             /boardview/list.jsp
boardview
  list.jsp

select count(*) from board where subject like '%w%'
select count(*) from board where writer like '%3%'




select num, ref, re_step,re_level 
from board 
order by num

--from -> where -> group by ->having ->select -> order by

select rownum, b.*
 from(select rownum as rm, a.*
 from(select * from board order by ref desc ,re_step asc)a)b
 where b.rm>=? and b.rm <=?





























