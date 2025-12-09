create table Product(
	id serial primary key,
	name varchar(100),
	category varchar(50),
	price numeric(10, 2)
);

create table OrderDetail(
	id serial primary key,
	order_id int, 
	product_id int,
	quantity int
);


-- 1. Tính tổng doanh thu từng sản phẩm, hiển thị product_name, total_sales (SUM(price * quantity))
SELECT p.name "Tên sản phẩm", sum(p.price * o.quantity) "total_sales"
from Product p join OrderDetail on p.id = o.product_id;

-- 2. Tính doanh thu trung bình theo từng loại sản phẩm (GROUP BY category)
select p.category "Loại sản phẩm", avg(o.quantity * p.price) "Doanh thu trung bình"
from Product p join OrderDetail on p.id = o.product_id
group by p.category;

-- 3. Chỉ hiển thị các loại sản phẩm có doanh thu trung bình > 20 triệu (HAVING)
select p.category "Loại sản phẩm", avg(o.quantity * p.price) "Doanh thu trung bình"
from Product p join OrderDetail on p.id = o.product_id
group by p.category
having avg(o.quantity * p.price) > 20000000;

-- 4. Hiển thị tên sản phẩm có doanh thu cao hơn doanh thu trung bình toàn bộ sản phẩm (dùng Subquery)
select p.category "Loại sản phẩm", avg(o.quantity * p.price) "Doanh thu trung bình"
from Product p join OrderDetail on p.id = o.product_id
group by p.category
having avg(o.quantity * p.price) > (
	select avg(o.quantity * p.price)
	from Product p join OrderDetail on p.id = o.product_id 
);

-- 5. Liệt kê toàn bộ sản phẩm và số lượng bán được (nếu có) – kể cả sản phẩm chưa có đơn hàng (LEFT JOIN)
SELECT p.name "Tên sản phẩm", sum(p.price * o.quantity) "total_sales"
from Product p left join OrderDetail on p.id = o.product_id;
