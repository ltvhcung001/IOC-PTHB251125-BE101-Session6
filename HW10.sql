create table OldCustomers(
	id serial primary key,
	name varchar(100),
	city varchar(50)
);

create table NewCustomers(
	id serial primary key,
	name varchar(100),
	city varchar(50)
);

-- 1. Lấy danh sách tất cả khách hàng (cũ + mới) không trùng lặp (UNION)
select distinct name 
from OldCustomers
UNION
select distinct name
from NewCustomers;

-- 2. Tìm khách hàng vừa thuộc bảng OldCustomers vừa thuộc bảng NewCustomers (INTERSECT)
select distinct name 
from OldCustomers
intersect
select distinct name
from NewCustomers;

-- 3. Tính số lượng khách hàng ở từng thành phố (dùng GROUP BY city)
select city, count(*)
from (select city
	  from OldCustomers
	  union all
	  select city
	  from NewCustomers)
group by city;

-- 4. Tìm thành phố có nhiều khách hàng nhất (dùng Subquery và MAX)
select city, count(*)
from (select city
	  from OldCustomers
	  union all
	  select city
	  from NewCustomers)
group by city 
having count(*) = (
	select max(city)
	from (select city
		  from OldCustomers
		  union all
		  select city
		  from NewCustomers)
);
