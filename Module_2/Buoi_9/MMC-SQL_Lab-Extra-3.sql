USE hr;

-- Truy vấn 1: Truy xuất tất cả nhân viên có địa chỉ ở Elgin, IL

SELECT * FROM employees WHERE address LIKE '%Elgin%' OR address LIKE '%IL';

-- Truy vấn 2: Truy xuất tất cả nhân viên sinh vào những năm 1970.

SELECT * FROM employees WHERE b_date LIKE '1970%';


-- Truy vấn 3: Truy xuất tất cả nhân viên trong phòng ban 5 có mức lương từ 60000 đến 70000

SELECT * FROM employees WHERE dep_id = 5 AND salary BETWEEN 60000 AND 70000;

-- Truy vấn 4A: Truy xuất danh sách nhân viên được sắp xếp theo ID phòng ban.

SELECT * FROM employees ORDER BY dep_id;

-- Truy vấn 4B: Truy xuất danh sách nhân viên được sắp xếp theo thứ tự giảm dần theo ID phòng ban và trong mỗi phòng ban, những nhân viên này được sắp xếp theo họ với thứ tự giảm dần của bảng chữ cái.

SELECT * FROM employees ORDER BY dep_id DESC, l_name DESC, f_name DESC;

-- Truy vấn 5A: Đối với mỗi ID phòng ban, truy xuất số lượng nhân viên trong phòng ban.

SELECT dep_id, COUNT(*) AS employee_amount FROM employees GROUP BY dep_id;

-- Truy vấn 5B: Đối với mỗi phòng ban, truy xuất số lượng nhân viên trong phòng ban và mức lương trung bình của nhân viên trong phòng ban.

SELECT dep_id, COUNT(*) AS employee_amount, AVG(salary) AS avg_salary FROM employees GROUP BY dep_id;

-- Truy vấn 5C: Gắn nhãn các cột đã tính trong tập hợp kết quả của Truy vấn 5B là NUM_EMPLOYEES và AVG_SALARY.

SELECT dep_id, COUNT(*) AS NUM_EMPLOYEES, AVG(salary) AS AVG_SALARY FROM employees GROUP BY dep_id;

-- Truy vấn 5D: Trong Truy vấn 5C, hãy sắp xếp tập hợp kết quả Mức lương trung bình.

SELECT dep_id, COUNT(*) AS NUM_EMPLOYEES, AVG(salary) AS AVG_SALARY FROM employees GROUP BY dep_id ORDER BY AVG_SALARY;

-- Truy vấn 5E: Trong Truy vấn 5D, giới hạn kết quả thành ít hơn 4 nhân viên cho các phòng ban.

SELECT dep_id, COUNT(*) AS NUM_EMPLOYEES, AVG(salary) AS AVG_SALARY FROM employees GROUP BY dep_id HAVING COUNT(*) < 4 ORDER BY AVG_SALARY;


