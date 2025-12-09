create table Orders (
	id serial primary key,
	customer_id int,
	order_date date,
	total_amount NUMERIC(10,2)
);

-- 1. Hiển thị tổng doanh thu, số đơn hàng, giá trị trung bình mỗi đơn (dùng SUM, COUNT, AVG) 
-- Đặt bí danh cột lần lượt là total_revenue, total_orders, average_order_value
select sum(total_amount) "total_revenue", count(id) "total_orders", avg(total_amount) "average_order_value"
from Orders;

-- 2. Nhóm dữ liệu theo năm đặt hàng, hiển thị doanh thu từng năm (GROUP BY EXTRACT(YEAR FROM order_date))
select *
from Orders
group by EXTRACT(year from order_date);

-- 3. Chỉ hiển thị các năm có doanh thu trên 50 triệu (HAVING)
SELECT EXTRACT(YEAR FROM order_date) nam
FROM Orders
GROUP BY EXTRACT(YEAR FROM order_date)
HAVING SUM(total_amount) > 50000000;

-- 4. Hiển thị 5 đơn hàng có giá trị cao nhất (dùng ORDER BY + LIMIT)
select id
from Orders
order by total_amount desc 
limit 5;
