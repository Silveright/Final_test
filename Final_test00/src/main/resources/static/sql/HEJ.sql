drop table group_schedule purge
drop sequence calendar_seq
--select * from calendar
--create table calendar(
	--calendar_no number,
--	group_no number,
--	title varchar2(15),
--	subject varchar2(300),
--	content varchar2(1000),
--	startdate date --start는 예약어로 사용할 수 없음..
--)
CREATE TABLE group_schedule (
	calendar_no	VARCHAR(255)	NOT NULL primary key,
	group_no	number	NOT NULL,
	title	varchar2(100)	NOT NULL,
	subject	varchar2(100)	NOT NULL,
	content	varchar2(1000)	NOT NULL,
	startdate	date	NOT NULL,
	location	varchar2(100)	NOT NULL,
	xcoord	varchar(100)	NULL,
	ycoord	varchar(100)	NULL
);

--임의 데이터 삽입 테스트
create sequence calendar_seq
insert into calendar
values (1,1,'정모','만나요','강남역에서 봐요','2022-09-09')

insert into calendar
values (2,1,'번개','만나요','집에서 봐요','2022-09-12')
select calendar_no, title, to_char(startdate,'yyyy-mm-dd') as "start"
	from calendar 
	where group_no = 1

--회원테이블 생성
CREATE TABLE user_info (
	userid	varchar2(100)	NOT NULL primary key,
	gender	varchar2(5)	NOT NULL,
	email	varchar2(100)	NOT NULL,
	area_name	varchar2(100)	NOT NULL,
	joindate	date	NOT NULL
);
--데이터 임의 삽입
insert into user_info values ('user1', '여', 'user1@kakao.com', '서울', sysdate)
insert into user_info values ('user2', '남', 'user2@kakao.com', '서울', sysdate)
insert into user_info values ('user3', '여', 'user3@kakao.com', '서울', sysdate)
insert into user_info values ('user4', '남', 'user4@kakao.com', '서울', sysdate)
insert into user_info values ('user5', '여', 'user5@kakao.com', '서울', sysdate)
insert into user_info values ('user6', '남', 'user6@kakao.com', '서울', sysdate)

select * from user_info
--모임 테이블 생성
drop table group_info purge;
SELECT *
  FROM user_sequences
select * from GROUP_INFO
CREATE TABLE group_info (
	group_no	number	NOT NULL primary key,
	group_name	varchar2(100)	NOT NULL,
	group_original	varchar2(100)	NOT NULL,
	area_name	varchar2(100)	NOT NULL,
	catename	varchar2(100)	NOT NULL,
	opendate	date	NOT NULL,
	group_img	varchar2(100)	NOT NULL,
	userid	varchar2(100)	NOT NULL
);
--데이터 임의 삽입
insert into group_info values (1, '3355', '사진1', '서울', '코딩', sysdate, '사진1', 'user1')
insert into group_info values (2, '사진동호회', '사진2', '인천', '사진', sysdate, '사진2', 'user2')
insert into group_info values (3, '코딩모임', '사진3', '경기', '코딩', sysdate, '사진3', 'user3')
insert into group_info values (4, '게임 동호회', '사진4', '서울', '게임', sysdate, '사진4', 'user1')


--모임-회원 테이블 생성
CREATE TABLE group_user_role (
	group_role_no	number	NOT NULL primary key,
	userid	varchar2(100)	NOT NULL,
	group_no	number	NOT NULL,
	group_role	number	NOT NULL--0이 관리자, 1이 일반 유저?
);
--데이터 임의 삽입
insert into group_user_role values (1, 'user1', 1, 0)
--일반 회원 모임 가입
insert into group_user_role values (2, 'user2', 1, 1)
insert into group_user_role values (3, 'user3', 1, 1)
insert into group_user_role values (4, 'user4', 1, 1)

insert into group_user_role values (5, 'user2', 2, 0)
insert into group_user_role values (6, 'user3', 2, 1)

insert into group_user_role values (7, 'user3', 3, 1)
insert into group_user_role values (8, 'user4', 3, 1)

insert into group_user_role values (9, 'user1', 4, 0)

select * from group_user_role


--관리자 페이지 통계
--1. 회원 수
select count(*)
from user_info
--2. 일정 수
select count(*)
from GROUP_SCHEDULE
select * from group_schedule
--3. 모임 수
select count(*)
from GROUP_INFO

--4. 인기 모임 (회원 수 기준)
--(1) 모임 가입 테이블의 모임별 회원 수
select count(*) ,group_no
from group_user_role 
group by group_no	

 COUNT(*) GROUP_NO
 -------- --------
        4        1
        2        2
        2        3

--(2) 회원 수 내림차순으로 정렬 뒤 첫번째 행 출력
select  rownum, g.* 
		from(
			select group_no, count(*) cnt
			from group_user_role
			group by group_no
			order by cnt desc) g
where rownum=1
	
ROWNUM GROUP_NO CNT
 ------ -------- ---
      1        1   4
--모임 정보 테이블과 join(모임명 출력 목적) :(1) 테이블 인라인뷰 활용
select group_no, group_name,  cnt 
	  from group_info gi join 
	  					(select group_no as user_groupno, count(*) cnt
						 from group_user_role
						 group by group_no
						 order by cnt desc)
on gi.group_no = user_groupno
 
 GROUP_NO GROUP_NAME CNT
 -------- ---------- ---
        1 3355         4
        2 사진동호회        2
        3 코딩모임         2
        
        

--rownum 부여하기
select rownum, j.* 
from (select group_no, group_name,  cnt 
	  from group_info gi join 
	  					(select group_no as user_groupno, count(*) cnt
						 from group_user_role
						 group by group_no
						 order by cnt desc
						 ,group_no asc)--회원 수 같은 경우 먼저 생성된 모임 우선 출력
						 on gi.group_no = user_groupno) j

 ROWNUM GROUP_NO GROUP_NAME CNT
 ------ -------- ---------- ---
      1        1 3355         4
      2        2 사진동호회        2
      3        3 코딩모임         2

select f.group_name 
from (select rownum, j.* 
	  from 
	  		(select group_no, group_name,  cnt 
	  		 from group_info gi join 
	  							(select group_no as user_groupno, count(*) cnt
						 		 from group_user_role
						 		 group by group_no
						 		 order by cnt desc)
						 		 on gi.group_no = user_groupno
			 ) j
	   ) f
 GROUP_NAME
 ----------
 3355
 코딩모임
 사진동호회

--인기 모임명만 출력
select f.group_name 
from 	(select rownum, j.* 
		 from 
		 		(select group_no, group_name,  cnt 
	  			 from group_info gi join 
	  								(select group_no as user_groupno, count(*) cnt
						 			 from group_user_role
						 			 group by group_no
						 			 order by cnt desc ,group_no asc)
						 			on gi.group_no = user_groupno) j
		 ) f
where rownum=1

 GROUP_NAME
 ----------
 3355
 
 
--같은 결과 
 ROWNUM USER_GROUPNO CNT
 ------ ------------ ---
      1            1   4
select  rownum, g.* 
from(
	select group_no, count(*) cnt
	from group_user_role
	group by group_no
	order by cnt desc) g
where rownum=1
	
select *
from (select rownum, j.*
	  from (
		  	select group_no as user_groupno, count(*) cnt
				from group_user_role
				group by group_no
				order by cnt desc
		  	) j
		)
where rownum=1


--회원가입 추세 그래프
--1. 최근 가입 순 데이터 출력 (일주일)
--select * from user_info
SELECT userid, to_char(joindate, 'yyyy-mm-dd') 
FROM user_info 
WHERE joindate >= TO_CHAR(SYSDATE-7,'YYYY-MM-DD')

 USERID TO_CHAR(JOINDATE,'YYYY-MM-DD')
 ------ ------------------------------
 user1  2022-09-20
 user2  2022-09-21
 user3  2022-09-21



--2. 날짜별 가입한 회원 수
--2-1) 날짜만 출력
select to_char(joindate, 'yyyy-mm-dd') as "date"
from user_info 
WHERE joindate >= TO_CHAR(SYSDATE-7,'YYYY-MM-DD')
group by to_char(joindate, 'yyyy-mm-dd')
--2-2) 날짜별 가입 회원 수
select count(*) cnt--, to_char(joindate, 'yyyy-mm-dd') as "date"
from user_info 
WHERE joindate >= TO_CHAR(SYSDATE-7,'YYYY-MM-DD')
group by to_char(joindate, 'yyyy-mm-dd')
--3)한 꺼번에
select count(*) cnt, to_char(joindate, 'yyyy-mm-dd') as "date"
from user_info 
WHERE joindate >= TO_CHAR(SYSDATE-7,'YYYY-MM-DD')
group by to_char(joindate, 'yyyy-mm-dd')
 
 CNT date
 --- ----------
   1 2022-09-20
   2 2022-09-21
   

--모임 카테고리 별 회원 수

--카테고리별 생성된 모임 수..   
select count(*) cnt, catename
from group_info
group by catename

 CNT CATENAME
 --- --------
   1 게임
   2 코딩
   1 사진

--모임별 회원수 조인			 
select group_no, group_name, catename,  cnt 
	  from group_info gi join 
	  					(select group_no as user_groupno, count(*) cnt
						 from group_user_role
						 group by group_no
						 order by cnt desc)
						 on gi.group_no = user_groupno
						 
 GROUP_NO GROUP_NAME CATENAME CNT
 -------- ---------- -------- ---
        1 3355       코딩         4
        2 사진동호회      사진         2
        3 코딩모임       코딩         2

----------카테고리별 모임 가입 회원 수 합산					 
select catename, sum(cnt) as users 
from (select group_no, group_name, catename,  cnt 
	  from group_info gi join 
						(select group_no as user_groupno, count(*) cnt
					 	 from group_user_role
					 	 group by group_no
					 	 order by cnt desc)
					 	 on gi.group_no = user_groupno)	
group by catename	
						 
 CATENAME SUM(CNT)
 -------- --------
 코딩              6
 사진              2						 
	
select * from user_info
---모임장인 회원 리스트 ..? + 보다는 전체 모임리스트 + 관리자 >>회원수 기준 내림차순
select rownum, j.* 
from (select group_no, group_name, userid,  cnt 
	  from group_info gi join 
	  					(select group_no as user_groupno, count(*) cnt
						 from group_user_role
						 group by group_no
						 order by cnt desc
						 ,group_no asc)--회원 수 같은 경우 먼저 생성된 모임 우선 출력
						 on gi.group_no = user_groupno) j
						 

ROWNUM GROUP_NO GROUP_NAME USERID CNT
 ------ -------- ---------- ------ ---
      1        1 3355       user1    4
      2        2 사진동호회      user2    2
      3        3 코딩모임       user3    2	
      
--페이징 처리 추가하기
	select *
from (select rownum, j.* 
from (select group_name, userid,  cnt 
	  from group_info gi join 
	  					(select group_no as user_groupno, count(*) cnt
						 from group_user_role
						 group by group_no
						 order by cnt desc
						 ,group_no asc)--회원 수 같은 경우 먼저 생성된 모임 우선 출력
						 on gi.group_no = user_groupno) j
	  	where rownum<=10
	  	)
where rownum>=1 and rownum<=10;

--회원 정보 테이블 조인-----------------------------------------------------------------
select group_no, group_name, userid,  cnt 
	  from group_info gi join 
	  					(select group_no as user_groupno, count(*) cnt
						 from group_user_role
						 group by group_no
						 order by cnt desc
						 ,group_no asc)--회원 수 같은 경우 먼저 생성된 모임 우선 출력
						 on gi.group_no = user_groupno
--최종 ++페이징 필요
select ui.userid, gender, email, area_name,group_name,cnt
from user_info ui
inner join (select group_no, group_name, userid,  cnt 
	  from group_info gi join 
	  					(select group_no as user_groupno, count(*) cnt
						 from group_user_role
						 group by group_no
						 order by cnt desc
						 ,group_no asc)--회원 수 같은 경우 먼저 생성된 모임 우선 출력
						 on gi.group_no = user_groupno) g
on ui.userid=g.userid

 USERID GENDER EMAIL           AREA_NAME GROUP_NAME CNT
 ------ ------ --------------- --------- ---------- ---
 user1  여      user1@kakao.com 서울        3355         4
 user2  남      user2@kakao.com 서울        사진동호회        2
 user3  여      user3@kakao.com 서울        코딩모임         2
 user1  여      user1@kakao.com 서울        게임 동호회       1
 
 select count(*) from (
 select ui.userid, gender, email, area_name,group_name,catename, cnt
from user_info ui
inner join (select group_no, group_name, userid,catename,  cnt 
	  from group_info gi join 
	  					(select group_no as user_groupno, count(*) cnt
						 from group_user_role
						 group by group_no
						 order by cnt desc
						 ,group_no asc)--회원 수 같은 경우 먼저 생성된 모임 우선 출력
						 on gi.group_no = user_groupno) g
on ui.userid=g.userid
 ) where userid like '%u%'
 
 
 
 select *
			from (select rownum rnum, b.*
					from (select ui.userid, gender, email, area_name,group_name,cnt
from user_info ui
inner join (select group_no, group_name, userid,  cnt 
	  from group_info gi join 
	  					(select group_no as user_groupno, count(*) cnt
						 from group_user_role
						 group by group_no
						 order by cnt desc
						 ,group_no asc)--회원 수 같은 경우 먼저 생성된 모임 우선 출력
						 on gi.group_no = user_groupno) g
on ui.userid=g.userid) b 
					where rownum <=10
					)
					where rnum>=1 and rnum<=10
					and userid like '%3%'
					
 RNUM USERID GENDER EMAIL           AREA_NAME GROUP_NAME CNT
 ---- ------ ------ --------------- --------- ---------- ---
    1 user1  여      user1@kakao.com 서울        3355         4
    2 user2  남      user2@kakao.com 서울        사진동호회        2
    3 user3  여      user3@kakao.com 서울        코딩모임         2
    4 user1  여      user1@kakao.com 서울        게임 동호회       1

--++)
--1) 한 명당 하나의 모임 생성하는 경우
select group_name, userid 
from group_info
 
 GROUP_NAME USERID
 ---------- ------
 3355       user1
 사진동호회      user2
 코딩모임       user3

-- 2) 한 명의 유저가 여러 모임 생성하는 경우...?
--insert into group_info values (4, '게임 동호회', '사진4', '서울', '게임', sysdate, '사진4', 'user1')
--select * from group_info
Select userid,Listagg(group_name,',') within group(order by group_name) as group_name
From group_info
Group by userid

 USERID GROUP_NAME
 ------ -----------
 user1  3355,게임 동호회
 user2  사진동호회
 user3  코딩모임
 
 --3) 회원정보 조인
 select * from user_info ui join (Select userid,Listagg(group_name,',') within group(order by group_name) as group_name
From group_info
Group by userid) on ui.userid=userid

select ui.userid, gender, email, area_name,group_name
from user_info ui
inner join (Select userid,Listagg(group_name,',') within group(order by group_name) as group_name
From group_info
Group by userid) g
on ui.userid=g.userid
 USERID GENDER EMAIL           AREA_NAME GROUP_NAME
 ------ ------ --------------- --------- -----------
 user1  여      user1@kakao.com 서울        3355,게임 동호회
 user2  남      user2@kakao.com 서울        사진동호회
 user3  여      user3@kakao.com 서울        코딩모임


--기본 회원 관리(전체 회원)
--전체 회원 출력
select * from user_info
--검색 및 페이징 처리
select count(*) from user_info
		where userid != 'admin'
		 and userid like '%키워드%' 							
					
select *
			from (select rownum rnum , b.*
					from (select userid, gender, area_name, email,  to_char(joindate, 'yy-mm-dd') joindate from user_info
					where userid != 'admin' 
					--and userid like '%키워드%'
					order by userid) b
					where rownum <=10
					)
					where rnum>=1 and rnum<=10
select *
			from (select b.*, rownum rnum
					from (select * from user_info
					--where userid != 'admin' 
					--and userid like '%키워드%'
					order by userid) b
					where rownum <=10 --&lt;= #{end}
					)
					where rnum >=1 and rnum<=10--&gt;= #{start} and rnum &lt;= #{end} 



select * from USER_INFO
drop table user_info purge
SELECT *
  FROM all_tables order by table_name asc