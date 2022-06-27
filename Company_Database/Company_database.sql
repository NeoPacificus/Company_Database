
CREATE TABLE employee (
  employee_id INT PRIMARY KEY,
  first_name VARCHAR(40),
  last_name VARCHAR(40),
  birth_day DATE,
  sex VARCHAR(1),
  salary INT,
  supervisor_id INT,
  branch_id INT
);

CREATE TABLE branch (
  branch_id INT PRIMARY KEY,
  branch_name VARCHAR(40),
  manager_id INT,
  manager_start_date DATE,
  FOREIGN KEY(manager_id) REFERENCES employee(employee_id) ON DELETE SET NULL
);

ALTER TABLE employee
ADD FOREIGN KEY(branch_id)
REFERENCES branch(branch_id)
ON DELETE SET NULL;

ALTER TABLE employee
ADD FOREIGN KEY(supervisor_id)
REFERENCES employee(employee_id)
ON DELETE SET NULL;

CREATE TABLE client (
  client_id INT PRIMARY KEY,
  client_name VARCHAR(40),
  branch_id INT,
  FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);

CREATE TABLE works_with (
  employee_id INT,
  client_id INT,
  total_sales INT,
  PRIMARY KEY(employee_id, client_id),
  FOREIGN KEY(employee_id) REFERENCES employee(employee_id) ON DELETE CASCADE,
  FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE
);

CREATE TABLE branch_supplier (
  branch_id INT,
  supplier_name VARCHAR(40),
  supply_type VARCHAR(40),
  PRIMARY KEY(branch_id, supplier_name),
  FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);


-- -----------------------------------------------------------------------------

-- National
INSERT INTO employee VALUES(100, 'Sachhin', 'Tendulkar', '1973-04-24', 'M', 2500000, NULL, NULL);

INSERT INTO branch VALUES(1, 'National', 100, '2006-02-09');

UPDATE employee
SET branch_id = 1
WHERE employee_id = 100;

INSERT INTO employee VALUES(101, 'Mithaali', 'Raj', '1982-12-3', 'F', 1100000, 100, 1);

-- State
INSERT INTO employee VALUES(102, 'Souraav', 'Ganguly', '1972-07-8', 'M', 750000, 100, NULL);

INSERT INTO branch VALUES(2, 'State', 102, '1992-04-06');

UPDATE employee
SET branch_id = 2
WHERE employee_id = 102;

INSERT INTO employee VALUES(103, 'Smrithi', 'Mandhana', '1996-07-18', 'F', 630000, 102, 2);
INSERT INTO employee VALUES(104, 'Harmanpret', 'Kaur', '1989-03-08', 'F', 550000, 102, 2);
INSERT INTO employee VALUES(105, 'Aanil', 'Kumble', '1970-10-11', 'M', 690000, 102, 2);

-- District
INSERT INTO employee VALUES(106, 'Raahul', 'Dravid', '1973-01-11', 'M', 780000, 100, NULL);

INSERT INTO branch VALUES(3, 'District', 106, '1998-02-13');

UPDATE employee
SET branch_id = 3
WHERE employee_id = 106;

INSERT INTO employee VALUES(107, 'Harabhajan', 'Singh', '1980-07-03', 'M', 650000, 106, 3);
INSERT INTO employee VALUES(108, 'Yuvaraj', 'Singh', '1981-12-12', 'M', 710000, 106, 3);


-- BRANCH SUPPLIER
INSERT INTO branch_supplier VALUES(2, 'IPMA', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Nikee', 'Willow');
INSERT INTO branch_supplier VALUES(2, 'J.T. Forms & Labels', 'Custom Forms');
INSERT INTO branch_supplier VALUES(3, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'IPMA', 'Paper');
INSERT INTO branch_supplier VALUES(3, 'Lables Manufacturers', 'Custom Forms');

-- CLIENT
INSERT INTO client VALUES(400, 'National Highschool', 2);
INSERT INTO client VALUES(401, 'New Country', 2);
INSERT INTO client VALUES(402, 'FlipCart', 3);
INSERT INTO client VALUES(403, 'MCC', 3);
INSERT INTO client VALUES(404, 'State Whitepages', 2);
INSERT INTO client VALUES(405, 'Times Newspaper', 3);
INSERT INTO client VALUES(406, 'FlipCart', 2);

-- WORKS_WITH
INSERT INTO works_with VALUES(105, 400, 550000);
INSERT INTO works_with VALUES(102, 401, 2670000);
INSERT INTO works_with VALUES(108, 402, 225000);
INSERT INTO works_with VALUES(107, 403, 50000);
INSERT INTO works_with VALUES(108, 403, 120000);
INSERT INTO works_with VALUES(105, 404, 330000);
INSERT INTO works_with VALUES(107, 405, 260000);
INSERT INTO works_with VALUES(102, 406, 150000);
INSERT INTO works_with VALUES(105, 406, 130000);

SELECT * FROM client;


