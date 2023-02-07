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

create table tb_user(
  id number,
  username varchar2(30),
  password varchar2(20),
  email varchar2(50),
  authRole varchar(30),
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

select * from tb_user;


delete from tb_user
where id = 2;
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





























