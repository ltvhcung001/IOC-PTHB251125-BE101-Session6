create table Employees(
	id serial primary key,
	full_name varchar(100),
	departmemt varchar(50),
	salary numeric(10, 2),
	hire_date date
);

-- 1. Thêm 6 nhân viên mới
INSERT INTO Employees (full_name, department, salary, hire_date)
VALUES
('Nguyễn Văn An', 'IT', 2500.00, '2023-01-15'),
('Trần Thị Bình', 'HR', 1500.50, '2022-05-20'),
('Lê Văn Cường', 'Marketing', 1800.00, '2023-03-10'),
('Phạm Thị Dung', 'Finance', 2200.00, '2021-11-01'),
('Hoàng Văn Em', 'Sales', 1200.00, '2023-07-25'),
('Vũ Thị Hoa', 'IT', 1950.00, '2023-06-30');

-- 2. Cập nhật mức lương tăng 10% cho nhân viên thuộc phòng IT
update Employees 
set salary = salary * 1.1
where departmemt = 'IT';

-- 3. Xóa nhân viên có mức lương dưới 6,000,000
delete from Employees
where salary < 6000000;

-- 4. Liệt kê các nhân viên có tên chứa chữ “An” (không phân biệt hoa thường)
SELECT full_name
from Employees
where full_name ilike '%An%';

-- 5. Hiển thị các nhân viên có ngày vào làm việc trong khoảng từ '2023-01-01' đến '2023-12-31'
SELECT full_name
from Employees
where hire_date >= '2023-01-01' and hire_date <= '2023-12-31;
