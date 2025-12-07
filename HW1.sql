create table Products (
	id serial primary key,
	name varchar(100),
	category varchar(100),
	price numeric(10, 2),
	stock int
);

-- 1. Thêm 5 sản phẩm vào bảng bằng lệnh INSERT
INSERT INTO Products (name, category, price, stock) 
VALUES 
('Laptop Dell XPS', 'Electronics', 1200.00, 15),
('Chuột không dây Logitech', 'Accessories', 25.50, 100),
('Bàn phím cơ', 'Accessories', 85.00, 50),
('Tai nghe Sony', 'Audio', 150.99, 30),
('Màn hình LG 24 inch', 'Electronics', 180.00, 20);

-- 2. Hiển thị danh sách toàn bộ sản phẩm
select *
from Products;

-- 3. Hiển thị 3 sản phẩm có giá cao nhất
select name
from Products
order by price desc
limit 3;

-- 4. Hiển thị các sản phẩm thuộc danh mục “Điện tử” có giá nhỏ hơn 10,000,000
select name
from Products
where category = "Điện tử" and price < 10000000;

-- 5. Sắp xếp sản phẩm theo số lượng tồn kho tăng dần
select *
from Products
order by stock desc;
