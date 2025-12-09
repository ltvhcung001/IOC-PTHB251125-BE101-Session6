-- 1. Hiển thị tên khách hàng và tổng tiền đã mua, sắp xếp theo tổng tiền giảm dần
select c.name "Tên khách hàng", sum(total_amount) "Tổng tiền đã mua"
from Customer c join Orders o on c.id = o.customer_id
group by c.name
order by sum(total_amount) desc;

-- 2. Tìm khách hàng có tổng chi tiêu cao nhất (dùng Subquery với MAX)
select c.name "Tên khách hàng", sum(o.total_amount) "Tổng tiền đã mua"
from Customer c join Orders o on c.id = o.customer_id
group by c.name
having sum(total_amount) = (
	select sum(o.total_amount)
	from Customer c join Orders o on c.id = o.customer_id
	group by c.name
);

-- 3. Liệt kê khách hàng chưa từng mua hàng (LEFT JOIN + IS NULL)
select c.name "Tên khách hàng chưa từng mua hàng"
from Customer c left join Orders o on c.id = o.customer_id
where o.id is null;

-- 4. Hiển thị khách hàng có tổng chi tiêu > trung bình của toàn bộ khách hàng (dùng Subquery trong HAVING)
select c.name "Tên khách hàng", sum(o.total_amount) "Tổng tiền đã mua"
from Customer c join Orders o on c.id = o.customer_id
group by c.name
having sum(total_amount) > (
	select avg(o.total_amount)
	from Customer c join Orders o on c.id = o.customer_id
	group by c.name
);
