create database if not exists m3_c0326g1;
use m3_c0326g1;
create table james(
 username varchar(50) primary key,
 password varchar(50)
);
create table classes(
id int primary key auto_increment,
name varchar(50)
);
create table students(
id int primary key auto_increment,
name varchar(50),
birthday date,
gender boolean,
email varchar(50),
score float,
username varchar(50),
class_id int,
foreign key(username) references james(username),
foreign key(class_id) references classes(id)
);
create table phone_number(
phone_number varchar(50) primary key,
student_id int,
foreign key(student_id) references students(id)
);
create table instructors(
id int primary key auto_increment,
name varchar(50),
birthday date,
salary double
);

create table instructors_classes(
instructor_id int,
class_id int,
primary key (instructor_id,class_id),
start_time date,
end_time date,
foreign key(instructor_id) references instructors(id),
foreign key(class_id) references classes(id)
);

insert into classes (name) values ('c1121g1'), ('c1221g1'),('a0821i1'),('a0921i1');


insert into james(`username`,`password`)
 values('cunn','12345'),('chunglh','12345'),('hoanhh','12345'),('dungd','12345'),('huynhtd','12345'),
 ('hainm','12345'),('namtv','12345'),('hieuvm','12345'),('kynx','12345'),('vulm','12345');

insert into james(`username`,`password`)
 values('chau','12345');
 
insert into instructors(`name`,birthday, salary)
 values('tran van chanh','1985-02-03',100),('tran minh chien','1985-02-03',200),('vu thanh tien','1985-02-03',300);
insert into instructors(`name`,birthday, salary)
 values('tran van nam','1989-12-12',100);


 
 insert into students(`name`,birthday, gender,`score`, class_id,`username`) 
 values ('nguyen ngoc cu','1981-12-12',1,8,1,'cunn'),('le hai chung','1981-12-12',1,5,1,'chunglh'),
 ('hoang huu hoan','1990-12-12',1,6,2,'hoanhh'),('dau dung','1987-12-12',1,8,1,'dungd'),
 ('ta dinh huynh','1981-12-12',1,7,2,'huynhtd'),('nguyen minh hai','1987-12-12',1,9,1,'hainm'),
 ('tran van nam','1989-12-12',1,4,2,'namtv'),('vo minh hieu','1981-12-12',1,3,1,'hieuvm'),
 ('le xuan ky','1981-12-12',1,7,2,'kynx'),('le minh vu','1981-12-12',1,7,1,'vulm');

  insert into students(`name`,birthday, gender,`score`, class_id) 
 values ('nguyen van a','1981-12-12',1,8,null),('tran van b','1981-12-12',1,5,null);
 
--   insert into student(`name`,birthday, gender,`point`, class_id,`username`) 
--  values ('nguyen minh hai chau','1981-12-12',1,8,null,'chau');
 insert into phone_number(phone_number,student_id) values ('0938305879',1),('0938305878',1),('0938305877',2),('0938305876',3),('0938305875',3),('0938305874',3);

 insert into instructors_classes(class_id,instructor_id) values (1,1),(1,2),(2,1),(2,2),(3,1),(3,2);

select * from phone_number;
select* from classs;
select* from students;
select* from james;
select* from instructors;
select * from instructors_classes;

-- ss3 thao tác với csdl

-- 1. Lấy ra thông tin các học viên đã có lớp học, và cho biết các học viên đang theo học lớp nào.

select s.*, c.name as class_name
from students s
join classes c on s.class_id = c.id;

-- 2. Lấy ra thông tin các học viên, và cho biết các học viên đang theo học lớp nào 
-- và cả các bạn đã đăng ký nhưng chưa có lớp học.
select s.*, c.name as class_name
from students s
left join classes c on s.class_id = c.id;

-- 3. Lấy ra học viên có họ là “nguyen”
select s.*, c.name as class_name
from students s
left join classes c on s.class_id = c.id
where s.name like 'nguyen %';

-- 4. Lấy thông tin của các học viên tên 'nguyen minh hai'.

-- 5. Lấy thông tin của các học viên tên 'hai' hoặc 'huynh’.
select s.*, c.name as class_name
from students s
left join classes c on s.class_id = c.id
where s.name like '% hai' or s.name like '% huynh';

-- RegexP : tìm hiểu thêm( lấy ra học vien có Tên bắt đầu Bằng chữ H


-- 6. Lấy ra các học viên có điểm lớn hơn 5 .
select s.*, c.name as class_name
from students s
left join classes c on s.class_id = c.id
where s.score >5;


-- đếm số lương học viên của trung tâm
-- select count(id) as so_luong from students;
-- lấy ra các loại điểm duy nhất

-- 8. Thông kế số lượng học sinh theo từng loại điểm.
-- select distinct score from students ;
select score , count(id) as so_luong from students group by score;

-- 9 . Thông kế số lượng học sinh theo điểm và điểm phải lớn hơn 5
select score , count(id) as so_luong 
from students
where score>5
group by score;

-- 10. Thông kế số lượng học sinh theo điểm lớn hơn 5 và chỉ hiện thị với số lượng>=2
select score , count(id) as so_luong 
from students
where score>5
group by score
having so_luong >2;

-- 11. Lấy ra danh sách học viên của lớp c1121g1 và sắp xếp  học viên theo point giảm dần,
-- nếu point bằng nhau thì sắp xếp theo tên tăng dần.
select s.*, c.name as class_name
from students s
right join classes c on s.class_id = c.id
where c.name = "c1121g1"
order by s.score desc, s.name;

 -- bài 4: sử dụng các hàm thông dụng
  
-- 1.1	Hiện thị danh sách các lớp và số lượng học viên của mỗi lớp

select c.name as class_name, count(s.id) as sl
from students s
right join classes c on s.class_id = c.id
group by c.id;
-- 1.2.	 Tính điểm lớn nhất của mỗi các lớp
select c.name as class_name, ifnull(max(s.score),0) as sl
from students s
right join classes c on s.class_id = c.id
group by c.id;

-- 1.3	 Tình điểm trung bình  của từng lớp
select c.name as class_name, ifnull(avg(s.score),0) as sl
from students s
right join classes c on s.class_id = c.id
group by c.id;

-- 2 Lấy ra toàn bộ tên và ngày sinh các instructor và student ở CodeGym.
select  s.name, s.birthday from students s
union all
select i.name, i.birthday from instructors i;

-- sử dụng union để thực hiện full join

select s.*, c.name as class_name
from students s
left join classes c on s.class_id = c.id
union 
select s.*, c.name as class_name
from students s
right join classes c on s.class_id = c.id;
-- 4 Lấy ra  3 học viên có điểm cao nhất của trung tâm.
select s.name, s.score from students s order by s.score desc limit 3;
select s.name, s.score from students s order by s.score desc limit 3,3;

-- 3 record tiếp the0
select * from students;
select max(score) from students;

select s.name, s.score from students s where s.score = (select max(score) from students);

with max_score as (
select max(score) from students
)
select s.name, s.score from students s where s.score in(select * from max_score);

-- 5. Lấy ra các học viên có điểm số là cao nhất của trung tâm.


-- 6 lấy ra tất cả các giảng viên chưa từng tham gia giảng dạy
select i.name from instructors i
left join instructors_classes ic on ic.instructor_id = i.id where ic.instructor_id is null;
-- Câu truy vấn con



select * from instructors i where i.id  not in (select distinct ic.instructor_id from instructors_classes ic);
select * from instructors i where not exists(select * from instructors_classes ic where ic.instructor_id = i.id);



-- join bảng
select * from phone_number;
select* from classs;
select* from students;
select* from james;
select* from instructors;
select * from instructors_classes;

-- tạo index
explain select * from customers where city = 'lyon';
 select count(*) from customers where city = 'lyon';
select count(*) from customers where city ='lyon';
select * from customers;

create index i_city on customers(city);
alter table customers add index i_country(country);

drop index i_city on customers;
alter table customers drop index i_country;

-- view
create view w_students as
select s.*,c.name as class_name 
from students s 
join classes c on s.class_id = c.id;
-- sử dụng view
select * from w_students;


-- sp không tham số
delimiter //
create procedure get_all()
begin
select s.*,c.name as class_name 
from students s 
 join classes c on s.class_id = c.id;

end //
delimiter ;

delimiter //
create procedure delete_by_id(IN p_id int)
begin
 delete from students where id = p_id;
end //
delimiter ;

call delete_by_id(12);

call get_all();

-- function xếp loại

delimiter //
create function xep_loai(p_score int)
returns varchar(250)
deterministic
begin
declare loai varchar(20);
if p_score>=8 then
set loai ="giỏi";
elseif p_score>=5 then
set loai = "khá";
else
set loai = "yếu";
end if;
return loai;
end //
delimiter ;

select s.*,c.name as class_name, xep_loai(s.score) as `rank`
from students s 
 join classes c on s.class_id = c.id;

-- 
-- 5 tạo trigger tự động lưu lại lịch sử thay đổi điểm của sinh viên
 select * from student;
 select * from jame;

-- tạo bảng để ghi log
create table `history`(
id int auto_increment primary key,
name varchar(50),
old_point int,
new_point int,
update_day date
);
-- tạo trigger
DELIMITER //
CREATE TRIGGER tr_history 
AFTER UPDATE ON students
FOR EACH ROW
BEGIN
insert into `history`(`name`, old_point, new_point, update_day) 
values ( old.`name`, old.`score`,new.`score`,now());
END //
DELIMITER ;

select * from history;
select * from student;
