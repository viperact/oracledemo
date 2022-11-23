##############################################
게시판 만들기
##############################################

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

SELECT * FROM board;

select num, readcount 
from board
where num=2;

/*가장 최근에 답변한 답변글이 제일 위로오게*/
select num, subject, ref, re_step, re_level
from board
order by ref desc, re_step asc;

/*일반 정렬*/
select num, subject, ref, re_step, re_level
from board
order by num asc;

DELETE FROM board
WHERE num = 8;

commit;

/*
                          출력순서   들여쓰기
num   subject       ref,  re_step,  re_level
1      제목글1        1        0       0
2      제목글2        2        0       0
3     제목1_답변1     1        2       1
4     제목2_답변2     1        1       1
*/
num   subject  ref  re_step re_level
1	제목1	    1	    0	    0
2	안녕하세요	2	    0	    0
3	반갑습니다	3	    0	    0
4	반가워요	    4	    0	    0
5	안녕히가세요	5	    0	    0
6	굿모닝	    6	    0	    0
7	첫번째	    3	    2	    1
9	두번째	    3	    1	    1

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
where b.rm >=1  and b.rm<=5;


select b.* from 
(select rownum as rm, a.* from(
  select * from board
  order by ref desc, re_step asc) a)b
where b.rm >=1  and b.rm<=5;

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





























