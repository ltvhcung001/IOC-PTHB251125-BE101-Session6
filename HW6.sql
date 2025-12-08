create table Customer(
	id serial primary key,
	name varchar(100),
	email varchar(100),
	phone varchar(20),
	points int
);

-- 1. Thêm 7 khách hàng (trong đó có 1 người không có email)
INSERT INTO Customer (name, email, phone, points)
VALUES
('Trần Văn Hùng', NULL, '0987654321', 50),
('Phạm Minh Tuấn', 'tuan.pm@gmail.com', '0901234567', 150),
('Lê Thị Lan', 'lan.le@yahoo.com', '0912345678', 300),
('Nguyễn Thị Mai', 'mai.nguyen@company.com', '0933445566', 120),
('Hoàng Đức Anh', 'ducanh@outlook.com', '0977889900', 500),
('Vũ Thu Hà', 'thuha@school.edu.vn', '0966554433', 80),
('Đặng Văn Nam', 'nam.dang@gmail.com', '0999888777', 200);

-- 2. Truy vấn danh sách tên khách hàng duy nhất (DISTINCT)
select DISTINCT name 
from Customer;

-- 3. Tìm các khách hàng chưa có email (IS NULL)
select DISTINCT name 
from Customer
where email is null;

-- 4. Hiển thị 3 khách hàng có điểm thưởng cao nhất, bỏ qua khách hàng cao điểm nhất (gợi ý: dùng OFFSET)
select name
from Customer
order by points desc
offset 1;

-- 5. Sắp xếp danh sách khách hàng theo tên giảm dần
select name
from Customer
order by name desc;
