CREATE TABLE bill (
    bill_id VARCHAR(30) PRIMARY KEY,
    branch_id VARCHAR(30),
    amount INTEGER,
    FOREIGN KEY (branch_id) REFERENCES segment(branch_id)
);

CREATE TABLE customer (
    customer_id VARCHAR(20) PRIMARY KEY,
    street VARCHAR(20),
    house_number VARCHAR(20),
    city VARCHAR(20),
    country VARCHAR(20)
);

CREATE TABLE partner (
    company_name VARCHAR(20) PRIMARY KEY,
    country VARCHAR(20),
    products_and_services VARCHAR(255)
);

ALTER TABLE bill ADD COLUMN reference INTEGER;
ALTER TABLE bill ADD COLUMN holder VARCHAR(50);
ALTER TABLE bill ADD COLUMN description VARCHAR(255);

ALTER TABLE customer ADD COLUMN age INTEGER;
ALTER TABLE customer ADD COLUMN salary INTEGER;
ALTER TABLE customer ADD COLUMN nationality VARCHAR(50);

ALTER TABLE partner ADD COLUMN n_clients INTEGER;
ALTER TABLE partner ADD COLUMN annual_revenue INTEGER;
ALTER TABLE partner ADD COLUMN headquarters VARCHAR(50);

CREATE TABLE segment (
    branch_id VARCHAR(30) PRIMARY KEY,
    department_name VARCHAR(50)
);

ALTER TABLE segment ADD COLUMN COO VARCHAR(50);
ALTER TABLE segment ADD COLUMN location VARCHAR(50);
ALTER TABLE segment ADD COLUMN number VARCHAR(20);

CREATE TABLE shareholder (
    shareholder_id INTEGER PRIMARY KEY,
    customer_id VARCHAR(20),
    shareholder_name VARCHAR(50),
    n_of_shares INTEGER,
    amount INTEGER,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE customer_partner (
    customer_id VARCHAR(20),
    company_name VARCHAR(20),
    contract_type VARCHAR(20),
    contract_date DATE,
    contract_amount INTEGER,
    contract_description VARCHAR(255),
    PRIMARY KEY (customer_id, company_name),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (company_name) REFERENCES partner(company_name)
);

INSERT INTO segment (branch_id, department_name, COO, location, number) VALUES
('B001','Finance','Alice Johnson','Utrecht','101'),
('B002','HR','Mark de Vries','Amsterdam','102'),
('B003','IT','Sven Bakker','Rotterdam','103'),
('B004','Marketing','Linda Janssen','Den Haag','104'),
('B005','Sales','Eva Smits','Utrecht','105'),
('B006','Support','Peter Vos','Eindhoven','106'),
('B007','Logistics','Tom Peters','Maastricht','107'),
('B008','Compliance','Anna van Dijk','Leiden','108'),
('B009','R&D','Chris van Dam','Tilburg','109'),
('B010','Procurement','Maria de Boer','Almere','110'),
('B011','Security','Henk Bakker','Delft','111'),
('B012','Planning','Jeroen Maas','Arnhem','112'),
('B013','Legal','Karin Meijer','Haarlem','113'),
('B014','Treasury','Pieter Smit','Zwolle','114'),
('B015','Strategy','Marlies Vos','Breda','115'),
('B016','Analytics','Wouter Dekker','Groningen','116'),
('B017','Operations','Nina Kuiper','Nijmegen','117'),
('B018','Innovation','Roy Jansen','Enschede','118'),
('B019','CSR','Mieke Bos','Utrecht','119'),  
('B020','PR','Jan van Leeuwen','Amsterdam','120');

INSERT INTO bill (bill_id, branch_id, amount, reference, holder, description) VALUES
('BL001','B001',1500,10001,'Anna','Office Supplies'),
('BL002','B002',2500,10002,'Mark','Recruitment Services'),
('BL003','B003',3200,10003,'Sven','IT Equipment'),
('BL004','B004',500,10004,'Linda','Ad Campaign'),
('BL005','B005',7800,10005,'Eva','Sales Incentives'),
('BL006','B006',340,10006,'Peter','Support Software'),
('BL007','B007',1900,10007,'Tom','Transport'),
('BL008','B008',2100,10008,'Anna','Audit Services'),
('BL009','B009',4200,10009,'Chris','Lab Equipment'),
('BL010','B010',850,10010,'Maria','Office Chairs'),
('BL011','B011',1300,10011,'Henk','CCTV Cameras'),
('BL012','B012',2700,10012,'Jeroen','Planning Tools'),
('BL013','B013',600,10013,'Karin','Legal Fees'),
('BL014','B014',900,10014,'Pieter','Financial Reports'),
('BL015','B015',3100,10015,'Marlies','Strategy Workshop'),
('BL016','B016',1700,10016,'Wouter','Data Analytics'),
('BL017','B017',2600,10017,'Nina','Ops Training'),
('BL018','B018',1450,10018,'Roy','Prototype Costs'),
('BL019','B019',330,10019,'Mieke','CSR Event'),
('BL020','B020',440,10020,'Jan','PR Materials');

INSERT INTO customer (customer_id, street, house_number, city, country, age, salary, nationality) VALUES
('C001','Vredenburg',10,'Utrecht','NL',32,4200,'Dutch'),
('C002','Dapperstraat',22,'Amsterdam','NL',29,3900,'Dutch'),
('C003','Meent',12,'Rotterdam','NL',40,5200,'Dutch'),
('C004','Langegracht',7,'Leiden','NL',35,4100,'Dutch'),
('C005','Stationsstraat',55,'Den Haag','NL',27,3500,'Dutch'),
('C006','Oude Markt',3,'Enschede','NL',45,6000,'Dutch'),
('C007','Grote Markt',9,'Groningen','NL',38,4800,'Dutch'),
('C008','Spui',44,'Den Haag','NL',31,3900,'Dutch'),
('C009','Oudegracht',200,'Utrecht','NL',36,4500,'Dutch'),
('C010','Damrak',78,'Amsterdam','NL',28,3600,'Dutch'),
('C011','Nieuwe Markt',11,'Zwolle','NL',41,5500,'Dutch'),
('C012','Kerkstraat',8,'Breda','NL',34,4200,'Dutch'),
('C013','Marktplein',13,'Arnhem','NL',37,4700,'Dutch'),
('C014','Keizersgracht',99,'Amsterdam','NL',30,3800,'Dutch'),
('C015','Maasstraat',22,'Rotterdam','NL',39,4900,'Dutch'),
('C016','Boslaan',17,'Amersfoort','NL',42,5100,'Dutch'),
('C017','Laanstraat',33,'Hilversum','NL',25,3200,'Dutch'),
('C018','Singel',50,'Amsterdam','NL',47,6200,'Dutch'),
('C019','Brink',15,'Deventer','NL',28,3700,'Dutch'),
('C020','Vismarkt',5,'Groningen','NL',44,5800,'Dutch');
('C021','Vismarkt',7,'Groningen','NL',43,5800,'Dutch');
('C022','Vismarkt',12,'Groningen','NL',44,5900,'Dutch');

INSERT INTO partner (company_name, country, products_and_services, n_clients, annual_revenue, headquarters) VALUES
('IBM','US','IT Services',300,8500000,'New York'),
('KPMG','NL','Consulting',150,4300000,'Amstelveen'),
('Philips','NL','Electronics',200,7800000,'Eindhoven'),
('Shell','NL','Energy',500,12000000,'Den Haag'),
('Google','US','Cloud Services',400,10000000,'Mountain View'),
('Microsoft','US','Software',600,15000000,'Redmond'),
('ASML','NL','Chip Machines',100,9500000,'Veldhoven'),
('ING','NL','Financial Services',350,8700000,'Amsterdam'),
('Rabobank','NL','Banking',320,7600000,'Utrecht'),
('Accenture','US','Consulting',250,6900000,'Dublin'),
('Capgemini','FR','IT Services',300,5400000,'Paris'),
('Tata','IN','Manufacturing',280,4200000,'Mumbai'),
('Siemens','DE','Engineering',360,9800000,'Berlin'),
('Unilever','UK','Consumer Goods',400,11000000,'London'),
('Heineken','NL','Beverages',230,5000000,'Amsterdam'),
('Vodafone','UK','Telecom',310,7300000,'London'),
('Nokia','FI','Telecom Equipment',200,4900000,'Espoo'),
('Sony','JP','Electronics',250,7200000,'Tokyo'),
('Bosch','DE','Automotive',220,6300000,'Stuttgart'),
('EY','UK','Consulting',180,4600000,'London');

INSERT INTO shareholder (shareholder_id, customer_id, shareholder_name, n_of_shares, amount) VALUES
(1,'C001','John Smith',120,24000),
(2,'C002','Emma Brown',150,30000),
(3,'C003','Lucas Vermeer',80,16000),
(4,'C004','Sara Meijer',200,40000),
(5,'C005','Mark Jansen',50,10000),
(6,'C006','Linda de Vries',130,26000),
(7,'C007','Tom Bakker',90,18000),
(8,'C008','Nina Kuiper',75,15000),
(9,'C009','Roy Bos',160,32000),
(10,'C010','Eva Smit',110,22000),
(11,'C011','Wouter Maas',140,28000),
(12,'C012','Chris Peters',60,12000),
(13,'C013','Karin Vos',100,20000),
(14,'C014','Peter van Dam',180,36000),
(15,'C015','Sophie Dekker',95,19000),
(16,'C016','Jan Willem',125,25000),
(17,'C017','Laura van Leeuwen',70,14000),
(18,'C018','Mieke Smits',85,17000),
(19,'C019','Daan de Groot',105,21000),
(20,'C020','Henk Bos',115,23000);

INSERT INTO customer_partner (customer_id, company_name, contract_type, contract_date, contract_amount, contract_description) VALUES
('C001','IBM','Service','2022-01-01',15000,'IT Support Contract'),
('C002','KPMG','Consulting','2021-06-15',12000,'Audit Services'),
('C003','Philips','Procurement','2022-09-10',18000,'Medical Equipment Supply'),
('C004','Shell','Energy','2023-03-20',22000,'Fuel Supply Contract'),
('C005','Google','Cloud','2021-11-05',14000,'Cloud Hosting Services'),
('C006','Microsoft','Software','2022-05-18',25000,'Office365 Licenses'),
('C007','ASML','Procurement','2023-02-12',30000,'Chip Machines Supply'),
('C008','ING','Banking','2021-12-01',10000,'Loan Agreement'),
('C009','Rabobank','Banking','2022-07-19',9500,'Credit Facilities'),
('C010','Accenture','Consulting','2022-09-25',17000,'Business Consulting');

SELECT
  c.customer_id,
  sh.shareholder_id,
  sh.shareholder_name,
  cp.contract_amount,
  cp.contract_description,
  c.salary
FROM shareholder AS sh
JOIN customer AS c
  ON c.customer_id = sh.customer_id
LEFT JOIN customer_partner AS cp
  ON cp.customer_id = c.customer_id;

SELECT city, AVG(salary) AS avg_salary
FROM customer
GROUP BY city;

SELECT sh.shareholder_id
FROM shareholder sh
WHERE EXISTS (
  SELECT 1
  FROM customer_partner cp
  WHERE cp.customer_id = sh.customer_id
);

