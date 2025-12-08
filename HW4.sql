create table orderInfo(
	id serial primary key,
	customer_id int,
	order_date date,
	total numeric(10, 2),
	status varchar(20)
);

-- 1. Thêm 5 đơn hàng mẫu với tổng tiền khác nhau
INSERT INTO OrderInfo (customer_id, order_date, total, status)
VALUES
(1, '2023-11-01', 500.00, 'Completed'),
(2, '2023-11-02', 150.50, 'Pending'),
(3, '2023-11-05', 1200.00, 'Shipped'),
(1, '2023-11-10', 89.90, 'Cancelled'),
(4, '2023-11-12', 345.75, 'Processing');

-- 2. Truy vấn các đơn hàng có tổng tiền lớn hơn 500,000
select *
from OrderInfo
where total > 500000;

-- 3. Truy vấn các đơn hàng có ngày đặt trong tháng 10 năm 2024
select *
from OrderInfo
where order_date BETWEEN '2024-10-1' and '2024-10-31';

-- 4. Liệt kê các đơn hàng có trạng thái khác “Completed”
select *
from OrderInfo
where status != 'Complete';

-- 5. Lấy 2 đơn hàng mới nhất
select *
from OrderInfo
order by order_date desc;
