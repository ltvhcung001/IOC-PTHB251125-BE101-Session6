create table Departmemt(
	id serial primary key,
	name varchar(50)
);

create table Employee(
	id serial primary key,
	full_name varchar(100),
	departmemt_id int,
	salary numeric(10, 2)
);

-- 1. Liệt kê danh sách nhân viên cùng tên phòng ban của họ (INNER JOIN)
select e.id "Mã nhân viên", e.full_name "Tên nhân viên", d.name "Tên phòng ban"
from Employee e join Departmemt d on e.departmemt_id = d.id;

-- 2. Tính lương trung bình của từng phòng ban, hiển thị:
-- department_name
-- avg_salary
-- Gợi ý: dùng GROUP BY và bí danh cột

select d.name, avg(e.salary) "Lương trung bình của từng phòng ban"
from Employee e join Departmemt d on e.departmemt_id = d.id
group by d.id, d.name;

-- 3. Hiển thị các phòng ban có lương trung bình > 10 triệu (HAVING)
select d.name, avg(e.salary) "Lương trung bình của từng phòng ban"
from Employee e join Departmemt d on e.departmemt_id = d.id
group by d.id, d.name
having avg(e.salary) > 10000000;

-- 4. Liệt kê phòng ban không có nhân viên nào (LEFT JOIN + WHERE employee.id IS NULL)
select d.id "Mã phòng ban", d.name "Tên phòng ban"
from Departmemt d left join Employee e on e.departmemt_id = d.id
where e.id is null;
