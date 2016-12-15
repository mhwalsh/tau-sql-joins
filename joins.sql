CREATE TABLE staff (
	id SERIAL PRIMARY KEY,
	name VARCHAR(200)
);

CREATE TABLE department (
	id SERIAL PRIMARY KEY,
	name VARCHAR(200)
);

CREATE TABLE staff_department (
	staff_id INT REFERENCES staff(id) ON DELETE CASCADE,
	department_id INT REFERENCES department(id) ON DELETE CASCADE
);

CREATE TABLE lecture (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100),
	staff_id INT REFERENCES staff(id)
);

INSERT INTO department (name) VALUES ('Development');
INSERT INTO department (name) VALUES ('Culinary');
INSERT INTO department (name) VALUES ('Billing');
INSERT INTO department (name) VALUES ('Admin');

INSERT INTO staff (name) VALUES ('Dev');
INSERT INTO staff (name) VALUES ('Millie');
INSERT INTO staff (name) VALUES ('Fred');
INSERT INTO staff (name) VALUES ('Scott');
INSERT INTO staff (name) VALUES ('Bill');

INSERT INTO staff_department (staff_id, department_id) VALUES (1,1);
INSERT INTO staff_department (staff_id, department_id) VALUES (2,1);
INSERT INTO staff_department (staff_id, department_id) VALUES (3,4);
-- Scott
INSERT INTO staff_department (staff_id, department_id) VALUES (4,1);
INSERT INTO staff_department (staff_id, department_id) VALUES (4,4);

INSERT INTO staff_department (staff_id, department_id) VALUES (5,3);

INSERT INTO lecture (name, staff_id) VALUES ('Routers', 2);
INSERT INTO lecture (name, staff_id) VALUES ('SQL Garage', 1);
INSERT INTO lecture (name, staff_id) VALUES ('Imposter Syndrome', 4);
INSERT INTO lecture (name, staff_id) VALUES ('Blood', 1);
INSERT INTO lecture (name) VALUES ('Cooking 101');


-- READ
-- One to Many
SELECT * FROM staff
JOIN lecture ON staff.id = lecture.staff_id;

-- Many to Many
SELECT staff.id, staff.name, department.name, lecture.name FROM staff
JOIN staff_department ON staff.id = staff_department.staff_id
JOIN department ON staff_department.department_id = department.id
LEFT JOIN lecture ON staff.id = lecture.staff_id
WHERE department.name = 'Development';


DELETE FROM staff WHERE id = 5;
