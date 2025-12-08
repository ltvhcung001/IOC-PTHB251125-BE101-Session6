create table Course(
	id serial primary key,
	title varchar(100),
	instructor varchar(50),
	price numeric(10, 2),
	duration int
);


-- 1. Thêm ít nhất 6 khóa học vào bảng
INSERT INTO Course (title, instructor, price, duration)
VALUES
('Lập trình Python cho người mới bắt đầu', 'Nguyễn Văn A', 500.00, 30),
('Phân tích dữ liệu với SQL', 'Trần Thị B', 600.00, 25),
('Thiết kế Web Frontend (HTML, CSS, JS)', 'Lê Văn C', 850.50, 45),
('Machine Learning cơ bản', 'Phạm Minh D', 1200.00, 60),
('Tiếng Anh giao tiếp công sở', 'Linda Smith', 1500.00, 50),
('Quản trị dự án Agile/Scrum', 'Hoàng Văn E', 900.00, 20);

-- 2. Cập nhật giá tăng 15% cho các khóa học có thời lượng trên 30 giờ
update Course
set price = price * 1.15
where duration > 30;

-- 3. Xóa khóa học có tên chứa từ khóa “Demo”
delete from Course
where title ilike '%Demo%';

-- 4. Hiển thị các khóa học có tên chứa từ “SQL” (không phân biệt hoa thường)
SELECT *
from Course
where title ilike '%SQL%';

-- 5. Lấy 3 khóa học có giá nằm giữa 500,000 và 2,000,000, sắp xếp theo giá giảm dần
select *
from Course
where price BETWEEN 500000 and 2000000
order by price DESC
limit 3;
