--dsum 테이블의 r 컬럼 이름만(예: 13 line) r2로 바꾸기 
(나머지 테이블의 r 이름은 그대로 두기)




insert tempdb..c	select name, r r1, c c1	from a	where name like '%tbl1%'
insert tempdb..d	select 'tbl1' 원테이블, r r2, c c2, name	from b	where name like '%tbl1%'
insert tempdb..dSum	select 'tbl1' 원테이블, sum(r) r, NULL as [r1-r2] from b	where name like '%tbl1%'
go

insert tempdb..c	select name, r r1, c c1	from a	where name like '%table1%'
insert tempdb..d	select 'table1' 원테이블, r r2, c c2, name	from b	where name like '%table1%'
insert tempdb..dSum	select 'table1' 원테이블, sum(r) r, NULL as [r1-r2] from b	where name like '%table1%'
go